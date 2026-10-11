---
title: "P3 layout — the rest of the rendering contract"
description: "Images, lists, links, anchors, page breaks, widows/orphans and heading keep on top of the P0 line/note paginator; theme colours and view drawing for the app."
status: completed
priority: P1
effort: 3d
branch: main
tags: [feature]
blockedBy: [261011-0431-p2-css-cascade]
blocks: [261011-0601-p4-app-shell]
created: 2026-10-11
---

# P3 layout: the rest of the rendering contract

Scope: profile §4, §7, §8, §9; [engine-scope "Engine"](../../docs/engine-scope.md#engine). P0 already does paragraphs, justification, drop caps and footnotes.

## Decisions
- L1. **One block list.** An image is a block of one U+FFFC character whose single "line" is the image box, so spacing, margins, page starts and resume (`PageStart`) need no new paths.
- L2. **Block images** (§4.2, only child of `p`/`div`/`figure`): natural size in px (1 px = 1 pt), shrunk to fit the column width minus insets and the column height, aspect kept, never split; horizontal position from the container's `text-align`. Decoded with ImageIO at display size, only when drawn.
- L3. **Inline images**: U+FFFC with a CTRunDelegate, scaled (aspect kept) to fit the block's line height and the column width. ponytail: the line box does not grow; real books in hand only have block images.
- L4. **Pagination rules** (§8) run as a cut-back pass after the fill pass: widows/orphans 2 (a block of ≤ 3 lines never splits), then a heading (`h1`–`h6`) is never the last block of a page that continues. `break-before: page` on any element starts a page with the next block; a forced break keeps the block's top margin. Cut-back only ever removes steps from the page, so the note fill stays valid. The first step of a page is always kept (progress).
- L5. **Lists**: `ul`/`ol` indent their content 40 px (WebKit's UA `padding-left`, no `padding` in the profile); the marker (`•` or `N.`) is inline text at the start of the `li` (ponytail: `list-style-position: inside`).
- L6. **Links and anchors**: `a[href]` (not noterefs) mark their text with the href; `Page.link(at:)` hit-tests a point. Every element `id` maps to a (block, offset) anchor for fragment navigation.
- L7. **Degraded input** (§9): `svg` subtrees are skipped; a document with no blocks lays out as zero pages (the app skips it, so no blank page appears).
- L8. **Drawing for the app**: `Canvas` can wrap a view's context and draws text in a given colour (theme); the bitmap path keeps black on white.

## Phases

| # | Phase | Status |
|---|---|---|
| 1 | [Block model: images, lists, links, anchors, colours](phase-01-block-model.md) | in-progress |
| 2 | [Pagination rules and verification](phase-02-pagination-rules.md) | pending |

## Risks
- Cut-back interacts with drop caps and notes: the existing `--check` (notes on their ref page, continuity against the tall column) runs on every chapter of both profile books after the change.
- P0 page breaks change where widows/orphans apply; `pages.json` differences are expected and explained, line breaks are not allowed to change.
