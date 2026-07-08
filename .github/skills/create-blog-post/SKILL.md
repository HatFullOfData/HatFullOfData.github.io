---
name: create-blog-post
description: 'Create a new Hugo blog post with proper frontmatter and folder structure. Use when: creating new blog post, adding new article, starting new post, writing new blog entry.'
argument-hint: 'Title and optional publish date (YYYY-MM-DD)'
---

# Create Blog Post

Creates a new blog post for the HatFullOfData Hugo site with proper folder structure and frontmatter template.

## When to Use

- User wants to create a new blog post
- User says "new post", "create article", "add blog entry"
- User provides a title and optional publish date

## Folder Structure

Blog posts are organized as:
```
content/post/YYYY/YYYY-MM-DD slug/
└── index.md
```

## Procedure

### 1. Gather Information

Ask the user for any missing information:
- **Title** (required): The post title
- **Publish Date** (required): Format YYYY-MM-DD - always prompt if not provided, since posts are often written ahead of schedule
- **Categories** (optional): Multi-select from common categories or allow custom input

**Common categories:**
- Power BI
- Microsoft Fabric
- Power Automate
- Dataverse
- Power Apps
- Power Query
- DAX
- M
- Dataflow
- Community
- Variable Libraries
- Notebooks
- Paginated Reports
- DevOps
- Charticulator
- Data Pipeline
- Azure
- Microsoft Graph
- Excel
- VBA
- SVG

### 2. Generate Slug

Convert title to URL-friendly slug:
- Lowercase
- Replace spaces with hyphens
- Remove special characters except hyphens
- Example: "Variable Library in Fabric" → "variable-library-in-fabric"

### 3. Check for Duplicates

Before creating, check if folder already exists at: `content/post/YYYY/YYYY-MM-DD slug/`

If it exists:
1. Warn the user: "A post with this date and slug already exists at [path]"
2. Ask if they want to:
   - Overwrite the existing post
   - Choose a different title/slug
   - Cancel the operation

### 4. Create Folder

Create folder at: `content/post/YYYY/YYYY-MM-DD slug/`
- YYYY = year from publish date
- MM-DD = month and day from publish date
- slug = generated from title

### 5. Create index.md

Use the [template](./template-index.md) to create `index.md` with:

**Frontmatter fields:**
```yaml
---
title: [User-provided title]
description: # TODO: Add description
slug: [generated-slug]
date: YYYY-MM-DD 00:00:00+0000
lastmod: YYYY-MM-DD 00:00:00+0000
image: cover.png
categories:
    - [Selected category 1]
    - [Selected category 2]
---
```

**Field details:**
- `title`: Use exact title provided by user
- `description`: Leave blank with comment `# TODO: Add description`
- `slug`: Auto-generated from title
- `date`: Use publish date at midnight UTC (format: YYYY-MM-DD 00:00:00+0000)
- `lastmod`: Same as date initially
- `image`: Default to `cover.png`
- `categories`: YAML array with selected categories, or blank with comment if none selected

**Content area:**
Add placeholder comment:
```markdown
<!-- TODO: Write blog post content here -->
```

### 6. Open File

Open the newly created `index.md` file in the editor for the user to start writing.

### 7. Completion Message

Report to user:
1. Full path created
2. Remind to:
   - Fill in description
   - Add cover.png image to the folder
   - Write the post content
   - Update categories if needed

## Example

**Input:**
- Title: "Using Variable Libraries in Power BI"
- Date: 2026-07-15
- Categories: Power BI, Variable Libraries

**Creates:**
```
content/post/2026/2026-07-15-using-variable-libraries-in-power-bi/
└── index.md
```

**index.md contents:**
```yaml
---
title: Using Variable Libraries in Power BI
description: # TODO: Add description
slug: using-variable-libraries-in-power-bi
date: 2026-07-15 00:00:00+0000
lastmod: 2026-07-15 00:00:00+0000
image: cover.png
categories:
    - Power BI
    - Variable Libraries
---

<!-- TODO: Write blog post content here -->
```

**File is then opened in the editor for writing.**

## Notes

- Hugo requires `index.md` (not `index.html` or other names)
- Slug should match the folder name suffix for consistency
- Date format must include timezone (+0000 for UTC) and defaults to midnight
- Categories is a YAML array and can have multiple values
- Always check for existing posts before creating to avoid overwrites
- User can add custom categories not in the common list
- The template file provides a reusable reference for frontmatter structure

## Helper Scripts

Use [create-post.py](./scripts/create-post.py) (if available) to automate slug generation and folder creation, or implement the logic directly using file tools.
