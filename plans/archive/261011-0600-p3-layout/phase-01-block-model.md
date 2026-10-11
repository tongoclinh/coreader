---
phase: 1
title: "Block model: images, lists, links, anchors, colours"
status: done
---

# Phase 1: Block model

## Files
- `Sources/CoReaderEngine/XHTML.swift`: keep `src`/`alt`
- `Sources/CoReaderEngine/Chapter.swift`: image blocks, inline images, list markers/indent, links, anchors, `breakBefore`/`keepWithNext` per block, `svg` skip
- `Sources/CoReaderEngine/Layout.swift`: `.image` lines
- `Sources/CoReaderEngine/Render.swift`: images, text colour, `Canvas(context:)`, `Page.link(at:)`
- `Sources/CoReaderEngine/Book.swift`/`Zip.swift`: entry sizes (book percent)

## Tasks
- [x] Chapter takes a resource loader + document path (images) and the column height (image fit)
- [x] Block and inline images (L2, L3)
- [x] Lists (L5)
- [x] Links + anchors (L6)
- [x] `svg` skipped, empty documents give zero pages (L7)
- [x] Theme colour + view context drawing (L8)

## Verification
- `coreader paginate` on both covers and the `Fixtures/layout` blocks fixture shows the images (k06's content images point at entries missing from its ZIP and are skipped, §9); `scripts/p2.sh` still passes.
