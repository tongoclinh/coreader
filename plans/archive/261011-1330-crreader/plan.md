---
title: "CrReader — crengine reference reader for comparison"
description: "Minimal AppKit EPUB reader on KOReader's crengine with feature parity to CoReader P4, to compare open speed, memory and rendering against CoReader."
status: completed
priority: P1
effort: 1d
branch: main
tags: [feature, benchmark]
blockedBy: []
blocks: []
created: 2026-10-11
---

# CrReader: crengine reference reader

Why: the preliminary benchmark showed the engine is not where open time goes, and crengine lays out a whole book ~3x faster than CoReaderEngine. CoReader stays as is; CrReader is a second app on crengine, without KOReader's Lua/SDL stack, so both engines can be compared app to app. Personal/open-source use only, so crengine's GPL-2 is acceptable (owner, 2026-10-11).

## Decisions
- C1. Source: `koreader/crengine` (the engine KOReader ships), fetched and pinned by `scripts/build-crreader.sh` into `build/src/crengine` (gitignored), built as a static library with CMake against Homebrew libs (freetype, harfbuzz, fribidi, libunibreak, utf8proc, zstd, libpng, jpeg-turbo, xxhash). Unused formats (CHM, DOC, RTF, ODT, FB3, MD, SVG, MathML, WebP, GIF) off.
- C2. App: one Objective-C++ file `CrReader/main.mm` (AppKit `NSDocument`, like `App/`), bundle `build/CrReader.app` with crengine's `epub.css`/`html5.css` and hyphenation patterns as resources.
- C3. Rough parity with CoReader P4, enough to compare (owner, 2026-10-11: no need for complete features): open by double-click / Open Recent, refused-book alert, 620×860 window, 40 px margins, one page, arrows/space/click/swipe/two-finger page turns, footer (chapter title · page x/y in chapter · book %), internal links with back stack (⌘[), external links after confirmation, light/dark from the system theme (CSS `color` ignored, as in CoReader), resize keeps position, user CSS `~/Library/Application Support/CrReader/{user.css, books/<id>.css}` with 1 s mtime poll, Ignore Book CSS, drop caps and in-page footnotes. EPUB footnote `aside`s are non-linear: they get their own pages, which page turns skip. Fallback font for symbols: Apple Symbols. Only bien-than was checked in the GUI.
- C4. Defaults match CoReader: Times New Roman 16 px, generics serif/sans/mono = Times New Roman/Helvetica/Menlo. Fonts are registered by file from CoreText lookups (generics plus families named in user CSS), not by scanning every system font. Embedded book fonts are crengine's own.
- C5. Retina: crengine renders into a 32-bit buffer at backing pixel size (render DPI 96 × scale) that is drawn as one CGImage.
- C6. crengine's cache (`~/Library/Caches/CrReader`) stays on, as KOReader uses it; `bench-open.sh` clears it for "first" runs.
- C7. `COREADER_TRACE=1` prints the same open trace as CoReader.

## Phases

| # | Phase | Status |
|---|---|---|
| 1 | Build crengine static lib + script | done |
| 2 | `CrReader/main.mm` with C3 parity | done |
| 3 | GUI check (bien-than: cover, drop cap, footnotes, link + back, paging), `crreader` in `bench-open.sh`, bench, report | done |

## Result (bien-than, visually complete, median ms, 2 runs)

| App | First | Reopen |
|---|---|---|
| CoReader | 435 | 419 |
| CrReader | 535 | 429 |

First = crengine parses and lays out the whole book (~17 + ~53 ms) and writes its cache; reopen reads the cache (~6 ms). Known gap: a link to a footnote shows the note's own non-linear page, not the note in place.
