#!/usr/bin/env python3
"""Generate a Hugo series shortcode from ordered post metadata."""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from datetime import date
from pathlib import Path


def slugify(value: str) -> str:
    slug = value.lower()
    slug = re.sub(r"[^\w\s-]", "", slug)
    slug = re.sub(r"[-\s]+", "-", slug)
    return slug.strip("-")


@dataclass
class SeriesPost:
    title: str
    publish_date: str
    slug: str | None = None

    @property
    def resolved_slug(self) -> str:
        return self.slug or slugify(self.title)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--shortcode-name", required=True)
    parser.add_argument("--heading", required=True)
    parser.add_argument("--description", required=True)
    parser.add_argument("--list-tag", choices=("ol", "ul"), default="ol")
    parser.add_argument("--posts-json")
    parser.add_argument("--posts-file")
    parser.add_argument("--output")
    return parser.parse_args()


def load_posts(args: argparse.Namespace) -> list[SeriesPost]:
    if bool(args.posts_json) == bool(args.posts_file):
        raise ValueError("Provide exactly one of --posts-json or --posts-file")

    raw = args.posts_json
    if args.posts_file:
        raw = Path(args.posts_file).read_text(encoding="utf-8")

    payload = json.loads(raw)
    if not isinstance(payload, list) or not payload:
        raise ValueError("Posts payload must be a non-empty JSON array")

    posts: list[SeriesPost] = []
    for index, item in enumerate(payload, start=1):
        if not isinstance(item, dict):
            raise ValueError(f"Post {index} must be an object")

        title = str(item.get("title", "")).strip()
        publish_date = str(item.get("publishDate", "")).strip()
        slug = item.get("slug")
        slug = str(slug).strip() if slug else None

        if not title:
            raise ValueError(f"Post {index} is missing title")
        validate_publish_date(publish_date, index)
        posts.append(SeriesPost(title=title, publish_date=publish_date, slug=slug))

    return posts


def validate_publish_date(value: str, index: int) -> None:
    try:
        date.fromisoformat(value)
    except ValueError as exc:
        raise ValueError(f"Post {index} has invalid publishDate '{value}'. Use YYYY-MM-DD.") from exc


def escape_hugo_string(value: str) -> str:
    return value.replace('"', '\\"')


def build_item_line(part_number: int, post: SeriesPost, today: date) -> str:
    base = (
        f'    (dict "part" "{part_number}" "title" "{escape_hugo_string(post.title)}" '
        f'"url" "/{post.resolved_slug}/"'
    )

    if date.fromisoformat(post.publish_date) > today:
        base += f' "publishDate" "{post.publish_date}"'

    return base + ")"


def render_shortcode(shortcode_name: str, heading: str, description: str, list_tag: str, posts: list[SeriesPost]) -> str:
    today = date.today()
    item_lines = [build_item_line(index, post, today) for index, post in enumerate(posts, start=1)]
    items_block = "\n".join(item_lines)

    return f'''{{{{- $current := printf "%v" (.Get "current" | default "") -}}}}
{{{{- $items := slice
{items_block}
-}}}}

<h2>{heading}</h2>
<p>{description}</p>
<{list_tag}>
    {{{{- range $items }}}}
    <li>
        {{{{- if eq $current .part -}}}}
            <strong>{{{{ .title }}}}</strong>
        {{{{- else if and .publishDate ((time .publishDate).After now) -}}}}
            {{{{ .title }}}} <em>(coming soon)</em>
        {{{{- else if .url -}}}}
            <a href="{{{{ .url }}}}">{{{{ .title }}}}</a>
        {{{{- else -}}}}
            {{{{ .title }}}}
        {{{{- end -}}}}
    </li>
    {{{{- end }}}}
</{list_tag}>
'''


def main() -> int:
    args = parse_args()
    posts = load_posts(args)
    content = render_shortcode(
        shortcode_name=args.shortcode_name,
        heading=args.heading,
        description=args.description,
        list_tag=args.list_tag,
        posts=posts,
    )

    if args.output:
        output_path = Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(content, encoding="utf-8")
    else:
        print(content)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())