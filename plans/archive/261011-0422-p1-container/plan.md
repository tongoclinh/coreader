---
title: "P1 container — read the EPUB in place"
description: "Open an .epub without extraction: mmap ZIP, OPF, spine, nav TOC, profile §9 refusals; the CLI paginates a chapter straight from the ZIP."
status: completed
priority: P1
effort: 2d
branch: main
tags: [feature]
blockedBy: [261011-0250-p0-spike-dropcap-footnote]
blocks: []
created: 2026-10-11
---

# P1 container: read the EPUB in place

Scope from [engine-scope](../../docs/engine-scope.md) "Opening and positions" and profile §1, §7, §9.

## Decisions
- C1: ZIP read from an mmapped `Data`; central directory parsed once; Stored or Deflated (Compression `COMPRESSION_ZLIB` = raw deflate). No ZIP64 (novels are far below 4 GB).
- C2: Refusals (profile §9): EPUB 2 (`version` < 3), fixed layout, encryption (`META-INF/encryption.xml` or ZIP encrypted flag), no nav item. Everything else opens.
- C3: Hrefs resolve relative to the OPF (or nav) directory, percent-decoded, fragment kept apart.
- C4: Fonts referenced by the book CSS still come from the spike `--fonts` dir mechanism, now loaded from ZIP entries. CSS cascade stays P2.

## Phases
| # | Phase | Status |
|---|---|---|
| 1 | [ZIP, OPF, nav, refusals, CLI](phase-01-zip-opf-nav.md) | completed |
