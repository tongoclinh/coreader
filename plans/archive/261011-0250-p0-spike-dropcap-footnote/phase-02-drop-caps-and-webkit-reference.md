---
phase: 2
title: "Drop caps and WebKit reference comparison"
status: done
priority: P1
effort: "2d"
dependencies: [1]
---

# Phase 2: Drop caps and WebKit reference comparison

## Goal

Implement `initial-letter` according to css-inline-3 §7, using the WebKit box model (S4). Check it against WebKit with side-by-side PNGs and loose geometric deltas, measured relative to line 1.

## Files to Create / Modify

- Create `Sources/CoReaderEngine/DropCap.swift` covering:
  - **First-letter selection**: leading punctuation plus one grapheme `Character`.
  - **Sizing** (§7.5.3).
  - **Block position** (§7.6.1). Raised and sunken caps push the text down.
  - **Inline position**: the cap pen sits at the content edge with its side bearing kept (S4).
  - **Exclusion**: the cap's advance width plus `margin-right`. It applies to every line the ink touches and carries into the next block on the same page.
- Modify `Sources/CoReaderEngine/Paragraph.swift`: each line's width and x come from the active exclusion. Offsets stay block-relative, and the first letter occupies range `0..<k`.
- Modify `Sources/CoReaderEngine/Render.swift`: add a `debugCapColor` that paints the cap pure red, for comparisons only.
- Create `Sources/webref/main.swift`, built from `research/webkit-render.swift` with these fixes:
  - It takes the same XHTML and fonts, and emits an HTML wrapper with:
    - `@font-face` for each mapped face;
    - `-webkit-initial-letter`;
    - a red `::first-letter`;
    - lengths printed as `%.3fpx` (never `Int`);
    - **body padding equal to our page margins and no body margin**, so both renderers share one reference frame.
  - Line extraction walks **all text nodes of all blocks** with a `TreeWalker`. Rects that equal the first-letter box are skipped.
  - Output: a PNG plus geometry JSON. Hard fail unless the image is 1200 px wide.
- Create `Sources/coreader/Compare.swift`. Subcommand: `compare <ours.png> <ours.json> <wk.png> <wk.json> --out <side.png>`.
  - Takes the red-pixel bbox of each image.
  - All y values are measured relative to line 1's top in each renderer.
  - Compares the cap's top and bottom, the cap's left ink x, and the x at which lines 1..N start.
  - Writes one JSON row and a side-by-side PNG with guides (line 1's cap line and line N's baseline).
- `coreader render --geometry <json>` emits the same keys as webref:
  - `capInk` {minX, minY, maxX, maxY};
  - `capBox` {minX, maxX};
  - `lines` [{top, baseline, left}].
- Create `scripts/spike.sh`, executable. It starts with `set -euo pipefail` and `cd "$(dirname "$0")/.."`. Its `dropcaps` part:
  - generates cases into `build/spike-input/dropcap/`;
  - wipes only `artifacts/spike/dropcap/`;
  - runs both renderers and `compare`;
  - writes `artifacts/spike/dropcap/dropcap.json`.

## Case matrix

| Case | Text source | Cap font |
|---|---|---|
| M with N = 2, 3, 5; M with `3 2` | Template paragraph of original Vietnamese prose (no inline markup, plus one variant with `em`) | Times New Roman Bold, `margin-right: 4px` |
| Đ, Ừ, Ặ with N = 3 | Same | Same |
| Short paragraph (2 lines with N = 3) followed by a long paragraph | Same | Same |
| Leading quote `“M`, N = 3 | Same | Same |
| bien-than c04 first paragraph (`header + p`) | Extracted from the private fixture | Tarif Medium 500, `margin-right: 5px` |
| nguoi-moi-den c03 first paragraph (`h1 + p`, `“S`) | Extracted from the private fixture | Body font, `margin-right: 5px` |

The last two rows are skipped with a notice if `Fixtures/private/` is missing.

## Tasks & Steps

1. **Size.** `capSize = ((N−1)·LH + bodyCapHeight) / (capHeight(capFont)/size(capFont))`. Only the cap-height metric is used (S1). Diacritics overflow upward and are never clipped.
2. **Vertical position.**
   - If size ≥ sink, the cap's baseline sits on line 1's baseline plus `(sink−1)·LH`.
   - If size < sink, the cap's top sits on line 1's cap line.
   - If the cap top would rise above the paragraph top, push the paragraph down by the difference.
3. **Exclusion.**
   - `right = advance(cap) + marginRight`, with advance from `CTLineGetTypographicBounds`.
   - `bottom = capBaseline − ink.minY`.
   - A line is shortened while its top is above `bottom`. The exclusion carries into the next block on the same page.
4. **webref.** Port the recipe with the fixes listed above. Wait for `document.fonts.ready`. Use `RunLoop.main` without `NSApplication`.
5. **compare.** Tolerances (S5):
   - Flat letters (M, Đ, and the Tarif cap if flat) must be within ≤ 1.0 px on cap top and bottom, and ≤ 2 px on the start x of lines 1..N.
   - Letters with diacritics are judged on the cap bottom only. Their top is reported, not judged.
   - Every row prints the cap's left ink x on both sides.

## Verification

- `scripts/spike.sh dropcaps` exits 0 and writes `artifacts/spike/dropcap/*.png` and `dropcap.json`.
- Every flat-letter case is within tolerance. Each case outside it gets a cause line in the report draft.
- Visual check:
  - Ừ and Ặ: the body aligns like U and A, and the diacritics stick out above.
  - `3 2`: the text is pushed down.
  - Short paragraph: the next paragraph wraps around the cap.
  - `“M`: the quote is part of the cap.
  - Tarif: the decorative face renders (not Helvetica).
