---
name: "Create Blog Series"
description: "Create a Hugo blog series from a structured list of posts and publish dates. Use when you want a cleaner input format than invoking the skill freehand."
argument-hint: "Series name or paste the full series template"
agent: "agent"
model: "GPT-5 (copilot)"
---

Create a new Hugo blog series in this workspace using the existing `create-series` skill at [create-series skill](../skills/create-series/SKILL.md).

Follow that skill's workflow to:

- create the shortcode in `layouts/shortcodes/<shortcode-name>-series.html`
- create each post bundle under `content/post/YYYY/`
- preserve the order of the posts exactly as provided
- mark future-dated entries as coming soon in the shortcode

If the user only provided partial details, ask only for the missing fields.

Use this input template and accept the user's values in this shape:

```text
Series name: 
Shortcode name: 
Series heading: 
Series description: 
List style: ol

Posts:
- 2026-08-01 | First post title | categories: Category 1, Category 2
- 2026-08-08 | Second post title
- 2026-08-15 | Third post title | slug: custom-slug
```

Rules:

- `Series heading` defaults to `Series name` when omitted
- `List style` must be `ol` or `ul`
- Each post line is ordered and should become parts `1..N`
- A custom `slug:` override is optional
- `categories:` is optional and should be passed into post creation when present
- Do not reorder posts by date unless the user explicitly asks for it

Before creating files:

1. Check whether `layouts/shortcodes/<shortcode-name>-series.html` already exists.
2. Check whether each target post folder already exists.
3. If conflicts exist, ask whether to overwrite, keep existing files, or stop.

When done, report:

1. The shortcode file path created
2. The post bundle paths created
3. The shortcode usage snippet for each part in this format:

```text
{{</ shortcode-name-series current="N" >}}
```