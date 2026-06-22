param(
    [Parameter(Mandatory = $true)]
    [string]$CsvPath,

    [int]$ChunkSize = 10,
    [int]$StartIndex = 0,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $CsvPath)) {
    throw "CSV not found: $CsvPath"
}

$importScript = Join-Path $PSScriptRoot 'import-wordpress-post.ps1'
if (-not (Test-Path $importScript)) {
    throw "Importer script not found: $importScript"
}

function Get-SlugFromUrl([string]$url) {
    if ([string]::IsNullOrWhiteSpace($url)) { return $null }
    $normalized = $url.Trim().ToLower()
    $normalized = $normalized -replace '^https?://(www\.)?hatfullofdata\.blog/', ''
    return $normalized.Trim('/')
}

$csv = Import-Csv $CsvPath
$localSlugs = @(Get-ChildItem 'content/post' -Directory | ForEach-Object { $_.Name -replace '^\d{4}-\d{2}-\d{2}\s+', '' })

$missing = @()
foreach ($row in $csv) {
    $slug = Get-SlugFromUrl $row.link
    if (-not $slug) { continue }
    if ($localSlugs -notcontains $slug) {
        $missing += [PSCustomObject]@{
            title = $row.title
            link  = $row.link
            slug  = $slug
        }
    }
}

$totalMissing = $missing.Count
if ($totalMissing -eq 0) {
    Write-Output 'No missing posts found. Nothing to import.'
    exit 0
}

if ($StartIndex -ge $totalMissing) {
    throw "StartIndex $StartIndex is out of range. Missing posts: $totalMissing"
}

$chunk = $missing | Select-Object -Skip $StartIndex -First $ChunkSize
$endIndex = $StartIndex + $chunk.Count - 1

Write-Output "Total missing posts: $totalMissing"
Write-Output "Processing chunk: index $StartIndex to $endIndex (size $($chunk.Count))"

$success = 0
$failed = @()

foreach ($item in $chunk) {
    Write-Output "--- Importing: $($item.slug)"
    try {
        if ($Force) {
            & pwsh $importScript -PostUrl $item.link -Force
        }
        else {
            & pwsh $importScript -PostUrl $item.link
        }

        if ($LASTEXITCODE -eq 0) {
            $success++
            Write-Output "OK: $($item.slug)"
        }
        else {
            $failed += $item
            Write-Output "FAILED (exit $LASTEXITCODE): $($item.slug)"
        }
    }
    catch {
        $failed += $item
        Write-Output "FAILED (exception): $($item.slug)"
        Write-Output $_
    }
}

Write-Output ""
Write-Output "Chunk complete. Success: $success  Failed: $($failed.Count)"

if ($failed.Count -gt 0) {
    Write-Output 'Failed slugs:'
    $failed | ForEach-Object { Write-Output $_.slug }
    exit 1
}
