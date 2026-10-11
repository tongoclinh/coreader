---
title: "P3 layout: images, lists, links, page-break rules"
date: 2026-10-11
---

# P3 layout: images, lists, links, page-break rules

## What shipped
- Image = one-char (U+FFFC) block whose only line is the image box → PageStart/resume untouched. Inline images via CTRunDelegate (line box not grown).
- Lists: UA padding 40 px, markers inside content. Links + anchors recorded per chapter; `svg` skipped.
- Pagination: forced `break-before: page`; cut-back pass for widows/orphans 2 and heading-never-last (only removes steps, so note placement stays valid).
- `paginate --check` gained the §8 rules; `scripts/p3.sh` runs every spine doc of 8 books — all pass.

## Surprises
- k06 spine 21 had 10 footnote asides, 0 referenced → they vanished. Fix: only *referenced* asides leave the flow (§9 degraded).
- k06 content images point at ZIP entries that don't exist; covers are the real image proof.
- `--expect-push` had to relax: with widows/orphans the ref line can legitimately move to page 2 with its paragraph.

## Open
- bien-than c04 drop cap still ~2 px off WebKit (accepted at G1).

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
