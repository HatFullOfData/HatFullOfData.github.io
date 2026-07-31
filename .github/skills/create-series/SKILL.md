---
name: create-series
description: 'Create a new Hugo blog series from an ordered list of post titles and publish dates. Use when: creating a new series, generating a series shortcode, planning a multipart blog series, creating several related posts at once.'
argument-hint: 'Series name and an ordered list of posts with publish dates (YYYY-MM-DD)'
---

# Create Blog Series

Creates a new series shortcode in `layouts/shortcodes/` and creates each post bundle by reusing the existing `create-blog-post` skill workflow.

## When to Use

- User wants to create a brand new blog series
- User has a list of post titles and publish dates
- User wants the shortcode and post folders created together
- User says "create a series", "set up a multipart series", or "make all posts for this series"

## Expected Input

Collect or confirm these values before creating anything:

- **Series name**: Human-friendly name, for example `Variable Library Series`
- **Shortcode name**: File stem used for the shortcode, for example `variablelibrary`
- **Series description**: Paragraph shown under the series heading
- **List style**: `ol` or `ul`
- **Posts**: Ordered list of entries with:
  - `title` (required)
  - `publishDate` in `YYYY-MM-DD` format (required)
  - `categories` (optional)
  - `slug` (optional override, normally generated from the title)

Accept the post list in plain language, markdown bullets, JSON, or a table. Preserve the user-provided order as the series order.

## Procedure

### 1. Confirm the Ordered Post List

Normalize the input into this shape before proceeding:

```json
[
  {
    "title": "Getting started with variable libraries",
    "publishDate": "2026-07-01",
    "categories": ["Microsoft Fabric", "Variable Libraries"]
  },
  {
    "title": "Variable Values in a Fabric Notebook",
    "publishDate": "2026-07-08"
  }
]
```

If any title or publish date is missing, ask only for the missing values.

### 2. Check the Shortcode Target

The new shortcode file must be:

```text
layouts/shortcodes/<shortcode-name>-series.html
```

If that file already exists, stop and ask whether to overwrite it or use `add-series-post` instead.

### 3. Create Each Post Bundle

For each post in order, reuse the existing `create-blog-post` skill in this repo.

- Pass the post title and publish date to that workflow
- Include categories when provided
- Let the existing workflow generate the slug unless the user explicitly provided a custom slug
- If direct skill composition is unavailable, follow the procedure in `.github/skills/create-blog-post/SKILL.md` and reuse `.github/skills/create-blog-post/scripts/create-post.py`

Before creating each post, check whether the target folder already exists. If it does, ask whether to keep it, overwrite it, or stop the series creation.

### 4. Generate the Shortcode

Use the helper script at `.github/skills/create-series/scripts/generate-series-shortcode.py`.

Provide:

- `--shortcode-name`
- `--heading`
- `--description`
- `--list-tag`
- either `--posts-json` or `--posts-file`
- `--output layouts/shortcodes/<shortcode-name>-series.html`

The script will:

- preserve the post order as part numbers `1..N`
- generate slugs from titles unless a `slug` override is present
- add `publishDate` to future-dated items so they render as `coming soon`
- emit the Hugo logic used by existing series shortcodes in this repo

### 5. Confirm the Result

Report back with:

1. The shortcode file path created
2. The list of post bundle paths created
3. The shortcode usage pattern for each post:

```text
{{</ shortcode-name-series current="N" >}}
```

## Notes

- Use the same slugification behavior as the existing post creation workflow
- Do not sort posts by date unless the user explicitly asks for that; keep the supplied order
- Future dates should still create the post folders now, but the shortcode should show `coming soon` until the publish date passes
- Prefer minimal edits if the user reruns the workflow with small changes

## Example

User input:

```text
Series name: Variable Library Series
Shortcode name: variablelibrary
List style: ol
Description: Variable libraries should be part of every project.
Posts:
- 2026-07-01 | Getting started with variable libraries
- 2026-07-08 | Variable Values in a Fabric Notebook
- 2026-08-15 | Variable Values in a Data Pipeline
```

Creates:

- `layouts/shortcodes/variablelibrary-series.html`
- one post bundle per post under `content/post/YYYY/`

For part 3, the shortcode entry includes `publishDate` because the date is in the future.