$posts = @(Get-ChildItem 'content/post' -Directory | Sort-Object Name)
$trackerRows = @()

foreach ($post in $posts) {
    $indexPath = Join-Path $post.FullName 'index.md'
    if (Test-Path $indexPath) {
        $content = Get-Content $indexPath -Raw
        
        if ($content -match '---\s*([\s\S]*?)\s*---') {
            $fm = $matches[1]
            $title = if ($fm -match 'title:\s*(.+)$') { $matches[1].Trim().Trim('"') } else { "Unknown" }
            $date = if ($fm -match 'date:\s*(\d{4}-\d{2}-\d{2})') { $matches[1] } else { $post.Name.Substring(0, 10) }
            $slug = if ($fm -match 'slug:\s*(.+)$') { $matches[1].Trim().Trim('"') } else { $post.Name -replace '^\d{4}-\d{2}-\d{2}\s+', '' }
            $image = if ($fm -match 'image:\s*') { "Yes" } else { "No" }
            $url = "https://hatfullofdata.blog/$slug/"
            $row = "| $date | $title | $url | Yes | $image | No | Yes |"
            $trackerRows += $row
        }
    }
}

$header = @"
---
title: Blog Migration Tracker
description: Track migration progress from WordPress to Hugo.
slug: blog-migration-tracker
date: 2026-06-21 00:00:00+0000
---

Use this table to track migration progress for each blog page.

| DatePublished | Page Title | original URL | Copied across | Page Graphic | Shortcuts | Published |
| --- | --- | --- | --- | --- | --- | --- |
"@

$content = $header + "`n" + ($trackerRows -join "`n")
Set-Content -Path 'content/page/blog-migration-tracker/index.md' -Value $content
"Done. $($trackerRows.Count) posts added."
