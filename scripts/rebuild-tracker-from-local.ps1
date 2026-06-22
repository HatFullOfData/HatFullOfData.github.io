$posts = Get-ChildItem 'content/post' -Directory | Sort-Object Name
$rows = @()

foreach ($post in $posts) {
    $indexPath = Join-Path $post.FullName 'index.md'
    if (-not (Test-Path $indexPath)) {
        continue
    }

    $raw = Get-Content $indexPath -Raw
    if ($raw -notmatch "(?s)^---\r?\n(.*?)\r?\n---") {
        continue
    }

    $fm = $matches[1]

    $title = 'Unknown'
    $date = $post.Name.Substring(0, 10)
    $slug = ($post.Name -replace '^\d{4}-\d{2}-\d{2}\s+', '')
    $hasImage = 'No'

    $m = [regex]::Match($fm, '(?m)^title:\s*(.+)$')
    if ($m.Success) {
        $title = $m.Groups[1].Value.Trim().Trim('"')
    }

    $m = [regex]::Match($fm, '(?m)^date:\s*(\d{4}-\d{2}-\d{2})')
    if ($m.Success) {
        $date = $m.Groups[1].Value.Trim()
    }

    $m = [regex]::Match($fm, '(?m)^slug:\s*(.+)$')
    if ($m.Success) {
        $slug = $m.Groups[1].Value.Trim().Trim('"')
    }

    if ([regex]::IsMatch($fm, '(?m)^image:\s*.+$')) {
        $hasImage = 'Yes'
    }

    $url = "https://hatfullofdata.blog/$slug/"
    $rows += "| $date | $title | $url | Yes | $hasImage | No | Yes |"
}

$header = @'
---
title: Blog Migration Tracker
description: Track migration progress from WordPress to Hugo.
slug: blog-migration-tracker
date: 2026-06-21 00:00:00+0000
---

Use this table to track migration progress for each blog page.

| DatePublished | Page Title | original URL | Copied across | Page Graphic | Shortcuts | Published |
| --- | --- | --- | --- | --- | --- | --- |
'@

Set-Content 'content/page/blog-migration-tracker/index.md' ($header + "`r`n" + ($rows -join "`r`n"))

$unknownCount = (Get-Content 'content/page/blog-migration-tracker/index.md' | Where-Object { $_ -match '^\|\s*\d{4}-\d{2}-\d{2}\s*\|\s*Unknown\s*\|' }).Count

Write-Output "Tracker rebuilt rows=$($rows.Count) unknownTitles=$unknownCount"
