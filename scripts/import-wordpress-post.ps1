[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PostUrl,

    [string]$ContentRoot = "content/post",

    [switch]$Force
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Get-SlugFromUrl {
    param([string]$Url)

    $uri = [Uri]$Url
    $path = $uri.AbsolutePath.Trim("/")
    if ([string]::IsNullOrWhiteSpace($path)) {
        throw "URL path is empty: $Url"
    }

    $parts = $path.Split("/", [System.StringSplitOptions]::RemoveEmptyEntries)
    if ($parts.Length -eq 0) {
        throw "Could not determine slug from URL: $Url"
    }

    return $parts[$parts.Length - 1]
}

function Format-HugoDate {
    param([datetimeoffset]$Date)

    # Match existing front matter style: yyyy-MM-dd HH:mm:ss+0000
    $offset = $Date.ToString("zzz").Replace(":", "")
    return "{0} {1}{2}" -f $Date.ToString("yyyy-MM-dd"), $Date.ToString("HH:mm:ss"), $offset
}

function Parse-WordPressDate {
    param([string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        throw "WordPress date value is empty."
    }

    $styles = [System.Globalization.DateTimeStyles]::AssumeUniversal -bor [System.Globalization.DateTimeStyles]::AdjustToUniversal
    $culture = [System.Globalization.CultureInfo]::InvariantCulture
    $parsed = [datetimeoffset]::MinValue

    if ([datetimeoffset]::TryParse($Value, $culture, $styles, [ref]$parsed)) {
        return $parsed
    }

    $formats = @(
        "MM/dd/yyyy HH:mm:ss",
        "M/d/yyyy HH:mm:ss",
        "yyyy-MM-dd HH:mm:ss",
        "yyyy-MM-ddTHH:mm:ss",
        "yyyy-MM-ddTHH:mm:ssK"
    )

    foreach ($fmt in $formats) {
        if ([datetimeoffset]::TryParseExact($Value, $fmt, $culture, $styles, [ref]$parsed)) {
            return $parsed
        }
    }

    throw "Unsupported WordPress date format: $Value"
}

function Strip-Html {
    param([string]$Html)

    if ([string]::IsNullOrWhiteSpace($Html)) {
        return ""
    }

    $text = $Html -replace "<[^>]+>", ""
    return [System.Net.WebUtility]::HtmlDecode($text).Trim()
}

function Convert-WordPressHtmlToMarkdown {
    param(
        [string]$Html,
        [hashtable]$ImageMap
    )

    if ([string]::IsNullOrWhiteSpace($Html)) {
        return ""
    }

    $content = $Html

    # Normalize line endings first.
    $content = $content -replace "`r`n", "`n"
    $content = $content -replace "`r", "`n"

    $singlelineIgnoreCase = [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
    $ignoreCase = [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

    # Headings
    $content = [regex]::Replace($content, '<h2[^>]*>(.*?)</h2>', { param($m) "`n## " + (Strip-Html $m.Groups[1].Value) + "`n" }, $singlelineIgnoreCase)
    $content = [regex]::Replace($content, '<h3[^>]*>(.*?)</h3>', { param($m) "`n### " + (Strip-Html $m.Groups[1].Value) + "`n" }, $singlelineIgnoreCase)
    $content = [regex]::Replace($content, '<h4[^>]*>(.*?)</h4>', { param($m) "`n#### " + (Strip-Html $m.Groups[1].Value) + "`n" }, $singlelineIgnoreCase)

    # Code blocks
    $content = [regex]::Replace(
        $content,
        '<pre[^>]*>\s*<code[^>]*>(.*?)</code>\s*</pre>',
        {
            param($m)
            $code = [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value).Trim()
            "`n" + '```xml' + "`n" + $code + "`n" + '```' + "`n"
        },
        $singlelineIgnoreCase
    )

    # Images
    $content = [regex]::Replace(
        $content,
        '<img[^>]*src="([^"]+)"[^>]*alt="([^"]*)"[^>]*>',
        {
            param($m)
            $src = [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value)
            $alt = [System.Net.WebUtility]::HtmlDecode($m.Groups[2].Value)
            if ($ImageMap.ContainsKey($src)) {
                return "![$alt]($($ImageMap[$src]))"
            }
            return "![$alt]($src)"
        },
        $singlelineIgnoreCase
    )

    # Links
    $content = [regex]::Replace(
        $content,
        '<a[^>]*href="([^"]+)"[^>]*>(.*?)</a>',
        {
            param($m)
            $url = [System.Net.WebUtility]::HtmlDecode($m.Groups[1].Value)
            $text = Strip-Html $m.Groups[2].Value
            "[$text]($url)"
        },
        $singlelineIgnoreCase
    )

    # Lists
    $content = [regex]::Replace($content, '<ol[^>]*>', "`n", $ignoreCase)
    $content = [regex]::Replace($content, '</ol>', "`n", $ignoreCase)
    $content = [regex]::Replace($content, '<ul[^>]*>', "`n", $ignoreCase)
    $content = [regex]::Replace($content, '</ul>', "`n", $ignoreCase)
    $content = [regex]::Replace($content, '<li[^>]*>(.*?)</li>', { param($m) "- " + (Strip-Html $m.Groups[1].Value) + "`n" }, $singlelineIgnoreCase)

    # Paragraphs and line breaks
    $content = [regex]::Replace($content, '<p[^>]*>(.*?)</p>', { param($m) (Strip-Html $m.Groups[1].Value) + "`n`n" }, $singlelineIgnoreCase)
    $content = [regex]::Replace($content, '<br\s*/?>', "`n", $ignoreCase)

    # Remove remaining tags and decode entities.
    $content = $content -replace "<[^>]+>", ""
    $content = [System.Net.WebUtility]::HtmlDecode($content)

    # Collapse noisy whitespace but keep paragraph spacing.
    $content = $content -replace "`n{3,}", "`n`n"

    return $content.Trim() + "`n"
}

function Get-CategoryNames {
    param(
        [string]$ApiBase,
        [object[]]$CategoryIds
    )

    if (-not $CategoryIds -or $CategoryIds.Count -eq 0) {
        return @()
    }

    $ids = ($CategoryIds | ForEach-Object { [string]$_ }) -join ","
    $url = "$ApiBase/categories?include=$ids&per_page=100"
    $categories = Invoke-RestMethod -Uri $url
    if (-not $categories) {
        return @()
    }

    return $categories | ForEach-Object { [System.Net.WebUtility]::HtmlDecode($_.name) }
}

function Get-UniqueFileName {
    param(
        [string]$BaseName,
        [string]$Extension,
        [hashtable]$UsedNames
    )

    $candidate = "$BaseName$Extension"
    $counter = 1
    while ($UsedNames.ContainsKey($candidate)) {
        $candidate = "{0}-{1}{2}" -f $BaseName, $counter, $Extension
        $counter++
    }

    $UsedNames[$candidate] = $true
    return $candidate
}

$slug = Get-SlugFromUrl -Url $PostUrl
$uri = [Uri]$PostUrl
$apiBase = "{0}://{1}/wp-json/wp/v2" -f $uri.Scheme, $uri.Host

$postLookupUrl = "$apiBase/posts?slug=$slug"
$posts = Invoke-RestMethod -Uri $postLookupUrl
if (-not $posts -or $posts.Count -eq 0) {
    throw "No WordPress post found for slug '$slug' at $postLookupUrl"
}

$post = $posts[0]
$publishRaw = if (-not [string]::IsNullOrWhiteSpace([string]$post.date_gmt)) { [string]$post.date_gmt } else { [string]$post.date }
$lastModRaw = if (-not [string]::IsNullOrWhiteSpace([string]$post.modified_gmt)) { [string]$post.modified_gmt } else { [string]$post.modified }

$publishDate = Parse-WordPressDate -Value $publishRaw
$lastModifiedDate = Parse-WordPressDate -Value $lastModRaw

$postSlug = $post.slug
$folderName = "{0} {1}" -f $publishDate.ToString("yyyy-MM-dd"), $postSlug
$targetDir = Join-Path -Path $ContentRoot -ChildPath $folderName

if (Test-Path $targetDir) {
    if (-not $Force) {
        throw "Target folder already exists: $targetDir (use -Force to overwrite)"
    }

    Remove-Item -Path $targetDir -Recurse -Force
}

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null

$rawHtml = [string]$post.content.rendered
$imgRegex = '<img[^>]*src="([^"]+)"[^>]*>'
$imgMatches = [regex]::Matches($rawHtml, $imgRegex, "IgnoreCase")

$imageMap = @{}
$usedNames = @{}

foreach ($match in $imgMatches) {
    $src = [System.Net.WebUtility]::HtmlDecode($match.Groups[1].Value)
    if ([string]::IsNullOrWhiteSpace($src)) {
        continue
    }

    if ($imageMap.ContainsKey($src)) {
        continue
    }

    $srcNoQuery = $src.Split("?")[0]
    $leaf = [System.IO.Path]::GetFileName($srcNoQuery)
    if ([string]::IsNullOrWhiteSpace($leaf)) {
        $leaf = "image.png"
    }

    $base = [System.IO.Path]::GetFileNameWithoutExtension($leaf)
    $ext = [System.IO.Path]::GetExtension($leaf)
    if ([string]::IsNullOrWhiteSpace($ext)) {
        $ext = ".png"
    }

    $candidate = Get-UniqueFileName -BaseName $base -Extension $ext -UsedNames $usedNames
    $destination = Join-Path $targetDir $candidate

    try {
        Invoke-WebRequest -Uri $src -OutFile $destination
        $imageMap[$src] = $candidate
    }
    catch {
        Write-Warning "Could not download image: $src"
        Write-Warning $_.Exception.Message
    }
}

$coverImageFile = $null
$featuredImageUrl = $null
if ($post.PSObject.Properties.Name -contains "jetpack_featured_media_url") {
    $candidate = [string]$post.jetpack_featured_media_url
    if (-not [string]::IsNullOrWhiteSpace($candidate)) {
        $featuredImageUrl = $candidate
    }
}

if ([string]::IsNullOrWhiteSpace($featuredImageUrl) -and ($post.PSObject.Properties.Name -contains "featured_media") -and [int]$post.featured_media -gt 0) {
    try {
        $media = Invoke-RestMethod -Uri ("$apiBase/media/{0}" -f [int]$post.featured_media)
        if ($media -and ($media.PSObject.Properties.Name -contains "source_url") -and -not [string]::IsNullOrWhiteSpace([string]$media.source_url)) {
            $featuredImageUrl = [string]$media.source_url
        }
    }
    catch {
        Write-Warning "Could not resolve featured media metadata from WordPress API."
    }
}

if (-not [string]::IsNullOrWhiteSpace($featuredImageUrl)) {
    $featuredImageUrl = [System.Net.WebUtility]::HtmlDecode($featuredImageUrl)

    if ($imageMap.ContainsKey($featuredImageUrl)) {
        $coverImageFile = $imageMap[$featuredImageUrl]
    }
    else {
        $featuredNoQuery = $featuredImageUrl.Split("?")[0]
        $ext = [System.IO.Path]::GetExtension($featuredNoQuery)
        if ([string]::IsNullOrWhiteSpace($ext)) {
            $ext = ".jpg"
        }

        $coverName = Get-UniqueFileName -BaseName "cover" -Extension $ext -UsedNames $usedNames
        $coverDestination = Join-Path $targetDir $coverName

        try {
            Invoke-WebRequest -Uri $featuredImageUrl -OutFile $coverDestination
            $coverImageFile = $coverName
        }
        catch {
            Write-Warning "Could not download featured image: $featuredImageUrl"
            Write-Warning $_.Exception.Message
        }
    }
}

$title = [System.Net.WebUtility]::HtmlDecode($post.title.rendered)
$description = Strip-Html $post.excerpt.rendered
$categories = Get-CategoryNames -ApiBase $apiBase -CategoryIds $post.categories

$markdownBody = Convert-WordPressHtmlToMarkdown -Html $rawHtml -ImageMap $imageMap

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("---")
$lines.Add("title: $title")
$lines.Add("description: $description")
$lines.Add("slug: $postSlug")
$lines.Add("date: $(Format-HugoDate $publishDate)")
$lines.Add("lastmod: $(Format-HugoDate $lastModifiedDate)")
if (-not [string]::IsNullOrWhiteSpace($coverImageFile)) {
    $lines.Add("image: $coverImageFile")
}

if ($categories.Count -gt 0) {
    $lines.Add("categories:")
    foreach ($cat in $categories) {
        $lines.Add("    - $cat")
    }
}

$lines.Add("---")
$lines.Add("")
$lines.Add($markdownBody)

$indexPath = Join-Path $targetDir "index.md"
[System.IO.File]::WriteAllLines($indexPath, $lines)

Write-Output "Imported post: $PostUrl"
Write-Output "Created: $indexPath"
Write-Output "Downloaded images: $($imageMap.Count)"
