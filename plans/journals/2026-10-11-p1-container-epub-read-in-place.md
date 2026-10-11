---
title: P1 container — EPUB read in place
date: 2026-10-11
---

# P1 container — EPUB read in place

## What happened
`Zip` (mmapped, central directory once, Compression raw deflate) + `Book` (container.xml, OPF, nested nav TOC, profile §9 refusals). `coreader book <epub>` dumps JSON; every chapter command takes `--epub <file> --spine N`, fonts read from the ZIP. E2E `scripts/p1.sh` → `artifacts/p1/`, exit 0.

## Evidence
- 8 real books open (2 profile + k01–k06), every resolved spine/TOC/cover path exists in the ZIP; open 0.4–0.65 ms.
- Synthetic: EPUB 2, fixed layout, no nav, encryption.xml → refused (exit 2); percent-encoded and `../` hrefs resolve; garbage file → plain error.
- c04 from ZIP gives byte-identical pages.json/lines.json to the extracted-file path; verify-resume passes. Cold reopen from ZIP ~19.5 ms (reference).

## Gotcha
libxml2's `xmlFree` global is rejected by Swift 6 strict concurrency; `free()` is used (same function on Darwin). XML elements retain their document handle to avoid use-after-free from temporaries.

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
