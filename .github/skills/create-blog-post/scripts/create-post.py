#!/usr/bin/env python3
"""
Helper script for creating new blog posts.
Generates slug from title and creates folder structure.
"""

import re
from datetime import datetime
from pathlib import Path


def slugify(title: str) -> str:
    """Convert title to URL-friendly slug."""
    slug = title.lower()
    slug = re.sub(r'[^\w\s-]', '', slug)
    slug = re.sub(r'[-\s]+', '-', slug)
    return slug.strip('-')


def create_post_folder(title: str, publish_date: str = None) -> Path:
    """
    Create blog post folder structure.
    
    Args:
        title: Post title
        publish_date: Publish date in YYYY-MM-DD format (defaults to today)
    
    Returns:
        Path to created folder
    """
    if publish_date is None:
        publish_date = datetime.now().strftime('%Y-%m-%d')
    
    year = publish_date.split('-')[0]
    slug = slugify(title)
    folder_name = f"{publish_date}-{slug}"
    
    # Create path: content/post/YYYY/YYYY-MM-DD-slug/
    post_path = Path('content/post') / year / folder_name
    post_path.mkdir(parents=True, exist_ok=True)
    
    return post_path


def generate_frontmatter(title: str, slug: str, publish_date: str, categories: list = None) -> str:
    """
    Generate Hugo frontmatter for blog post.
    
    Args:
        title: Post title
        slug: URL slug
        publish_date: Publish date in YYYY-MM-DD format
        categories: List of category strings
    
    Returns:
        Formatted frontmatter string
    """
    timestamp = f"{publish_date} 00:00:00+0000"
    
    frontmatter = f"""---
title: {title}
description: # TODO: Add description
slug: {slug}
date: {timestamp}
lastmod: {timestamp}
image: cover.png
categories:
"""
    
    if categories:
        for cat in categories:
            frontmatter += f"    - {cat}\n"
    else:
        frontmatter += "    # TODO: Add categories\n    - \n"
    
    frontmatter += "---\n\n<!-- TODO: Write blog post content here -->\n"
    
    return frontmatter


if __name__ == "__main__":
    # Example usage
    import sys
    
    if len(sys.argv) < 2:
        print("Usage: python create-post.py 'Post Title' [YYYY-MM-DD] [category1,category2,...]")
        sys.exit(1)
    
    title = sys.argv[1]
    publish_date = sys.argv[2] if len(sys.argv) > 2 else None
    categories = sys.argv[3].split(',') if len(sys.argv) > 3 else None
    
    slug = slugify(title)
    folder = create_post_folder(title, publish_date)
    frontmatter = generate_frontmatter(title, slug, publish_date or datetime.now().strftime('%Y-%m-%d'), categories)
    
    # Write index.md
    index_file = folder / 'index.md'
    index_file.write_text(frontmatter, encoding='utf-8')
    
    print(f"Created: {index_file}")
