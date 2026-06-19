# WordPress to Hugo Migration Skill

Use this importer to migrate one old WordPress post into this Hugo repo.

## What It Does

1. Accepts a WordPress post URL.
2. Calls the WordPress REST API (`/wp-json/wp/v2/posts?slug=...`).
3. Creates a Hugo post bundle using `yyyy-MM-dd slug` folder naming.
4. Downloads post images into the bundle.
5. Generates `index.md` with front matter (`title`, `description`, `slug`, `date`, `lastmod`, `categories`).

## Command

```powershell
pwsh ./scripts/import-wordpress-post.ps1 -PostUrl "https://hatfullofdata.blog/svg-in-power-bi-part-3/"
```

Optional content root:

```powershell
pwsh ./scripts/import-wordpress-post.ps1 -PostUrl "https://hatfullofdata.blog/some-post/" -ContentRoot "content/post"
```

## Notes

1. The script stops if the target folder already exists.
2. Content conversion is intentionally lightweight and may need a quick editorial pass.
3. After import, run Hugo build:

```powershell
hugo
```
