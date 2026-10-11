---
phase: 2
title: "Pagination rules and verification"
status: done
---

# Phase 2: Pagination rules and verification

## Files
- `Sources/CoReaderEngine/Layout.swift`: cut-back pass, forced breaks
- `Sources/coreader/main.swift`: `--check` gains widows/orphans, heading keep, forced breaks, no blank page
- `scripts/p3.sh` → `artifacts/p3/`

## Tasks
- [x] `break-before: page` (L4)
- [x] Widows/orphans 2 (L4)
- [x] Headings never last (L4)
- [x] `paginate --check` covers the new rules
- [x] E2E: every spine document of both profile books and k01–k06 paginates with `--check`; page PNGs kept for covers, a chapter opening and an image chapter
- [x] `scripts/p2.sh` and `scripts/spike.sh all` still pass; P0 `pages.json` changes explained

## Verification
- `scripts/p3.sh` exits 0; `artifacts/p3/summary.txt` lists per-book page counts, rule checks and reference timing.
