---
name: add-series-post
description: 'Add the next post to a Hugo series shortcode. Use when: adding post to series, next part in series, registering new series entry, updating series shortcode with new post.'
argument-hint: 'Series name, post title, slug, and publish date (YYYY-MM-DD)'
---

# Add Post to Series Shortcode

Adds a new entry to an existing Hugo series shortcode in `layouts/shortcodes/`.

## When to Use

- User wants to add a post to an existing series
- User says "add to series", "next part", "register post in series"
- A new blog post belongs to an established series

## Shortcode Files

All series shortcodes live at:
```
layouts/shortcodes/<series-name>-series.html
```

Current series:
- `slicer-series.html` — Power BI Slicers
- `svg-series.html` — SVG in Power BI
- `variablelibrary-series.html` — Variable Libraries

## Procedure

### 1. Gather Information

Collect any missing values:
- **Series** (required): Which shortcode file to update
- **Title** (required): The post title as it should appear in the series list
- **Slug** (required): The URL slug (becomes `/slug/`)
- **Publish date** (required): ISO format `YYYY-MM-DD`

### 2. Determine Next Part Number

Read the target shortcode file and find the highest `"part"` value in the `$items` slice. The new entry is that number + 1.

### 3. Build the Dict Entry

Compare the publish date to today's date:

**Future date** — include both `url` and `publishDate` so the series block shows *(coming soon)* until the date passes, then automatically switches to a link:
```
(dict "part" "N" "title" "Post Title" "url" "/the-slug/" "publishDate" "YYYY-MM-DD")
```

**Today or past date** — include only `url`:
```
(dict "part" "N" "title" "Post Title" "url" "/the-slug/")
```

### 4. Insert the Entry

Add the new dict as the last item in the `$items` slice, directly before the closing `-}}`. Match the indentation of the surrounding lines (4 spaces).

### 5. Confirm

Show the user the line that was added and remind them to use `current="N"` in the shortcode call on the new post:
```
{{</* series-name-series current="N" */>}}
```
