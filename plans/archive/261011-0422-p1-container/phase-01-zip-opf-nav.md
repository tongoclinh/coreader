---
phase: 1
title: "ZIP, OPF, nav, refusals, CLI"
status: in-progress
---

# Phase 1: ZIP, OPF, nav, refusals, CLI

## Files
- `Sources/CoReaderEngine/Zip.swift`, `Book.swift` (container + OPF + nav)
- `Sources/coreader/main.swift`: `book` command; `paginate --epub`
- `scripts/p1.sh`: E2E, artifacts in `artifacts/p1/`

## Tasks
- [x] ZIP central directory + entry read (stored/deflated, CRC not checked)
- [x] container.xml → OPF: metadata, manifest, spine, nav, cover
- [x] nav TOC (nested) from `nav[epub:type=toc]`
- [x] §9 refusals with clear messages
- [x] `coreader book <epub>` JSON dump + open time
- [x] `coreader paginate --epub <file> --spine N` reads chapter and fonts from the ZIP
- [x] E2E: two profile books, six originals (open or refuse, no crash), four synthetic refusal books

## Verification
- `scripts/p1.sh` exits 0; spine chapters paginated from the ZIP match the spike's extracted-file `pages.json`.
