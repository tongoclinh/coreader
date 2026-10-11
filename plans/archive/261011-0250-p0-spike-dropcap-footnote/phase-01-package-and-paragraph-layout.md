---
phase: 1
title: "Package, XHTML reader, paragraph layout"
status: done
priority: P1
effort: "2d"
dependencies: []
---

# Phase 1: Package, XHTML reader, paragraph layout

## Goal

Create a SwiftPM package that turns an XHTML file into justified CoreText lines and renders them to a 2x PNG. There are no drop caps and no pagination yet: lines flow down one tall canvas. This tall-column layout is kept on purpose. Phase 3 uses it as the independent reference for the resume check.

## Files to create / modify (root `/Volumes/Data/ai-playground/coreader`)

- Create `Package.swift`:
  - swift-tools 6.0, platform macOS 14;
  - targets `CoReaderEngine` (library), `coreader` (executable) and `webref` (executable, filled in by phase 2).
- Create the following files in `Sources/CoReaderEngine/`:
  - `XHTML.swift`: libxml2 (`import libxml2`) → a flat DOM (`[Node]` with `parent`, `firstChild`, `next`, `kind`, `tag`, `id`, `class`, `epubType`, `href`, `role`, `text`).
  - `SpikeStyle.swift`: hard-coded computed styles as `struct` values (family, size, weight, style, line-height, text-indent, margins, alignment, display, drop-cap rule). Marked `// ponytail: replaced by P2 CSS cascade`.
  - `Fonts.swift`: `FontBook`.
    - It loads `CTFontDescriptor`s from `Data` via `CTFontManagerCreateFontDescriptorsFromData`, never registering them globally.
    - It maps a CSS family to a font file explicitly (for example `"Tarif Medium" → fonts/DropCap_Tarif-Medium.otf`).
    - It caches sized `CTFont`s by (face, size).
    - A missing book face is a hard error. Only the body default (Times New Roman) comes from the system.
  - `Paragraph.swift`: inline runs (text, `em`/`i`, `strong`/`b`, `a`, `sup`, `span`, `br`) → `NSAttributedString` → one `CTTypesetter` per paragraph. `layoutLines(from offset:, widthFor:, xFor:)` returns `[PlacedLine]` (runs, x, baseline, width, block-relative UTF-16 range).
  - `Justify.swift`: justification by hand, widening the positions of U+0020 glyphs by `(width − natural)/spaces`. It skips the last line, lines without spaces, and any `text-align` other than justify.
  - `Render.swift`: a `CGContext` (sRGB, 2x) → `CGImageDestination` PNG. Each `CTRun` is drawn with `CTFontDrawGlyphs`, using **the font from that run's attributes** (font fallback).
- Create `Sources/coreader/main.swift` with the subcommands below. Arguments are parsed by hand, without ArgumentParser.
  - `fonts <dir>`
  - `render <xhtml> --style <bien-than|nguoi-moi-den|plain> --fonts <dir> --out <png> [--check]`
- Create `Fixtures/spike/plain.xhtml`:
  - original Vietnamese prose (written for this fixture, not copied from a book);
  - 6 paragraphs with `em` and `strong`;
  - one very long word, one short last line, and source text with newlines and indentation.
- Modify `.gitignore`: add `.build/` and `artifacts/`.

## Tasks & Steps

1. `Package.swift`. `CoReaderEngine` uses only Foundation, CoreText, CoreGraphics, ImageIO and libxml2. `Sources/webref/main.swift` starts as a usage stub so the package builds.
2. **Font smoke test first**: `coreader fonts` on the faces extracted from both profile EPUBs (`unzip -o -j <epub> 'OEBPS/fonts/*' -d build/spike-input/<book>/fonts`). For each of the 4 faces (2 of them OTF), print family, PostScript name, full name, cap-height ratio and ascent/descent. The red team verified that the OTF/CFF faces load (Tarif cap-height 64.7 at 100 pt).
3. XHTML reader (S9):
   - Use `xmlReadMemory` with `XML_PARSE_NONET`.
   - Read `epub:type` with `xmlGetNsProp(node, "type", "http://www.idpf.org/2007/ops")`.
   - Collapse whitespace: `[ \t\r\n]+` → U+0020; trim at block start and end; drop whitespace-only text nodes between blocks.
   - Sibling navigation helpers (`nextElement`, `previousElement`) skip non-element nodes.
   - Reject non-UTF-8 input.
4. `SpikeStyle` (S7). Mirror **every** rule of both fixtures' `book.css` that the chosen chapters use:
   - **UA**: `p` justified; `h1` 1.25em, centred; `em`/`strong`; `sup` 0.65em, raised; `aside[epub:type=footnote]` taken out of the flow (consumed in phase 3); `span` inline unless overridden.
   - **bien-than**:
     - `body { line-height: 1.6 }`;
     - `header h1` (iCiel Stabile, 1.25em, margins 100px/75px);
     - `p { margin-top: 0.25em; text-indent: 5% }`;
     - no indent for `header + p`, `h1 + p`, `hr.break + p`, `blockquote p` and `aside p`;
     - `hr.break { margin: 1em 0 }`, drawn as vertical space only;
     - the `::first-letter` rule (phase 2).
   - **nguoi-moi-den**:
     - the `p` margin of 0.5em and `text-indent: 1.25em`;
     - no indent for `h1 + p`, `hr.break + p`, `blockquote p` and `aside p`;
     - `hr.break { margin: 1.5em 0 }`;
     - `h1 span { display: block }`;
     - `blockquote`;
     - the `::first-letter` rule.
   - Cross-check by reading each `book.css` line by line; every rule is either mirrored or listed as "unused in chosen chapters".
5. Paragraph layout and justification following research/coretext-layout §5. The baseline uses CSS half-leading: `b0 = (LH − (asc+desc))/2 + asc`. Offsets are block-relative (S3).
6. The tall-column renderer stacks blocks (margin, then lines). `render` writes the PNG. `--check` asserts that every justified line is exactly the column width (within 0.01 pt) and that no last line is stretched.

## Verification

- `swift build -c release` passes, and `grep -R "import AppKit" Sources/CoReaderEngine` prints nothing.
- `coreader fonts build/spike-input/bien-than/fonts` lists 3 faces. The nguoi-moi-den fonts list 1 face.
- `coreader render Fixtures/spike/plain.xhtml --style plain --out artifacts/spike/plain.png --check` exits 0. A visual check confirms that the lines are justified, last lines are ragged, the long word is not stretched, italic and bold appear, and the source newlines do not show up as breaks.
