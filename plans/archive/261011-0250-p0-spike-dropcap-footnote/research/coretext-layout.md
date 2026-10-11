# CoreText line-by-line layout with CSS `initial-letter`: research report

**Bottom line:** Use one `CTTypesetter` per paragraph and break lines with `CTTypesetterSuggestLineBreak`, passing a different width for each line. Draw the drop cap as its own `CTLine`, sized with the §7.5.3 formula. I ran this recipe (`-O`, Swift 6 mode). The cap-top and cap-baseline errors were 0.0000 pt by metrics and under one device pixel in the raster. A full 600×900 pt page (33 lines) lays out in about **2.2 ms**, and 95 % of that time is `CTLineCreateJustifiedLine`. Hand-written justification that only widens spaces gives the same glyph positions (max |Δx| = 1e-13) at about 9× lower cost. CoreText never hyphenates on its own.

Experiment: `/tmp/coreader-research/CoreTextLayoutResearch/main.swift`, built with `swiftc -O -swift-version 6 main.swift -o ctl && ./ctl`.
PNGs (2x): `dropcap.png` (the deliverable), `dropcap-guides.png` (red line = line-1 cap line, blue line = line-3 baseline), `sunk-3-2.png`, `raised-3-1.png`, `short-para.png`. All are in the same directory.

## 1. What the spec requires (docs/refs/epub/spec/css-inline-3.md §7)
- **Values** (`#sizing-drop-initials`, §7.3). `initial-letter: <number ≥1> <integer ≥1>?` gives *size* first and *sink* second. If sink is omitted, `drop` applies, which means sink = floor(size). `raise` means sink = 1. Examples: `3` is 3 lines high and 3 deep, `3 2` is a sunken cap, `3 1` is a raised cap. Our profile (§6.1) only allows integer N from 2 to 5, with an optional M.
- **Alignment points** (`#aligning-initial-letter`, §7.4). The initial value is `alphabetic`: the cap-height baseline and the alphabetic baseline *of the surrounding text*. Rule 4 of the automatic detection also picks cap-height + alphabetic for Latin script, which covers Vietnamese.
- **Font size** (`#sizing-initial-letter`, §7.5.3). The drop cap's cap-height must equal `(N−1)·line-height + cap-height of the paragraph text`, so `dropFontSize = ((N−1)·LH + paraCapHeight) / dropFontCapHeightRatio`. LH is the containing block's line-height. The calculation uses only metrics, and the content of the spanned lines does not affect it. Spec check: Minion Pro, 12 pt text on a 16 pt line → 61.2 pt cap.
- **Block position** (`#initial-letter-block-position`, §7.6.1).
  - If size ≥ sink, align the cap's *under* point (its baseline) to the baseline of line 1, then move it down by `(sink−1)·LH`.
  - If size < sink, align its *over* point (cap-height) to the cap line of line 1.
  - The cap never makes its line box taller. Its block-start margin edge must stay below the content edge of the containing block, so raised and sunken caps push the paragraph text down (also `#raised-sunken-caps`, §7.9.1).
- **Box and exclusion** (§7.5.2 `#initial-letter-box`, §7.5.5 `#initial-letter-box-size`, §7.6.2 `#initial-letter-inline-position`, §7.7 `#initial-letter-wrapping`).
  - Text is excluded by the cap's *margin box*.
  - With automatic sizing, the content box fits the glyph outlines (hanging glyphs excluded) and the sink. With zero padding and border, the top content edge is the over alignment point, and ink above it is ignored for layout.
  - The box is *kerned*: its start side bearing is removed, so the ink touches the line start.
  - Every line the glyph outline touches is excluded, not only the N sink lines (`#initial-letter-exclusions`, the "J" descender example).
  - `initial-letter-wrap` defaults to `none`, meaning each affected line is flush against the cap's margin edge. The profile only allows `margin-right`, so **exclusion width = ink width + margin-right**.
- **Short paragraphs** (`#short-para-initial-letter`, §7.9.2). The exclusion carries into the following blocks, like a float. Our profile (§8) adds a pagination rule on top: "If fewer than N lines fit on a page, the cap and its paragraph move to the next page."
- **Punctuation** (`#selecting-drop-initials`, §7.2). `::first-letter` takes in punctuation next to the letter; the spec's example is an opening quote plus "M" set as one 3-line cap. CSS-Pseudo-4 also includes trailing punctuation [INFERENCE: pseudo-4 not checked locally].
- **Other rules.**
  - §7.5.4 `#initial-letter-shaping`: the letter is shaped on its own.
  - §7.8.1 `#initial-letter-inline-flow`: white space between a sunken cap and the following text is collapsed.
  - §7.8.2: `text-indent` moves the cap too.

## 2. CoreText APIs (SDK `…/MacOSX.sdk/System/Library/Frameworks/CoreText.framework/Headers`)
- **`CTTypesetterCreateWithAttributedString(CFAttributedString)`** (CTTypesetter.h). The `…AndOptions` variant can return NULL for "unbounded layout" input unless `kCTTypesetterOptionAllowUnboundedLayout` is set. The only other options are `ForcedEmbeddingLevel` and the deprecated `DisableBidiProcessing`. **There is no hyphenation option.**
- **`CTTypesetterSuggestLineBreak(ts, start, width)`** returns a character count in UTF-16 units. Get per-line widths and first-line indent by passing a different `width` on each call, and add the x offset yourself when drawing.
  - *Verified:* `…WithOffset(ts, 0, 300, offset: 200)` gave the same break as offset 0 (35 vs 35). `offset` does not shorten the line. [INFERENCE: it only affects tab stops.]
- **`CTLineCreateJustifiedLine(line, factor, width)`** (CTLine.h). A factor ≥1 gives full justification, values between 0 and 1 give partial justification, and a width smaller than the line squishes it.
  - *Verified:* it ignores trailing whitespace; justified lines measured exactly 529.596 and 600.000 after subtracting `CTLineGetTrailingWhitespaceWidth`.
  - *Verified:* it does **not** guard against stretching. A 160 pt line justified to 600 came out at 600.00, and a word with no spaces was letter-spaced from 140.94 to 300. Your own code must skip the last line and any under-full lines.
  - *Verified:* on lines that contain spaces, it adds space only at the spaces. My own space-only expansion produced identical positions.
- **`CTLineGetTypographicBounds`** returns the advance width and fills in ascent, descent and leading. The width includes trailing whitespace. **`CTLineGetImageBounds(line, nil)`** returns the ink rectangle relative to the pen origin, y-up. The header says it is "not for typographic purposes", but for a drop cap the ink box *is* the CSS content box. **`CTFontGetCapHeight/Ascent/Descent/Leading`** return values in points at the font's size; dividing by `CTFontGetSize` gives the ratio.
- **Embedded fonts with no global registration** (CTFontManager.h).
  - `CTFontManagerCreateFontDescriptorsFromData(CFData) → [CTFontDescriptor]` (macOS 10.13+) followed by `CTFontCreateWithFontDescriptor(desc, size, nil)`.
  - The header says these descriptors are "not available through font descriptor matching". That is what we want: they stay private to the book.
  - `CTFontManagerRegisterGraphicsFont` is deprecated (macOS 15).
  - *Verified* with TTF bytes. Not tested with OTF/CFF.
- **Drawing and PNG output.**
  - Create the context with `CGContext(data:nil, w*2, h*2, 8, 0, sRGB, premultipliedLast)`, then `scaleBy(2,2)` and `textMatrix = .identity`.
  - For each line, set `textPosition = (x, pageH − baselineFromTop)` and call `CTLineDraw`.
  - Then `CGImageDestinationCreateWithURL(url, "public.png", 1, nil)` → `AddImage(ctx.makeImage())` → `Finalize`.
  - *Verified.* Bitmap memory row 0 is the top of the image (confirmed by the pixel scan).
- **Hyphenation** (CFString.h).
  - `CFStringGetHyphenationLocationBeforeIndex(str, idx, limitRange, 0, locale, &hyphenChar)` returned 29 for "internationalization", splitting it as "international", with hyphen U+002D.
  - `CFStringIsHyphenationAvailableForLocale`: en_US = true, **vi = false**.
  - *Verified:* CTTypesetter ignores `NSParagraphStyle.hyphenationFactor = 1` (same break with factor 0 and 1). The positive control, TextKit 1 with the same string at 200 pt, broke as "…brown interna". So `hyphens:auto` needs your own loop: if the line is loose, ask CF for a hyphen point, check `SuggestLineBreak` on a string with the hyphen inserted, and re-typeset. For Vietnamese, CF has no hyphenation data (and the words are monosyllabic), so it is a no-op.

## 3. Experiment results (Times New Roman 18 pt body, TNR Bold cap, LH 27, 600 pt column, 3-line cap "Đ")
**Formula used:** `capSize = ((3−1)·27 + 11.918) / 0.6621 = 99.558 pt`, where 0.6621 is `CTFontGetCapHeight(capBase)/CTFontGetSize(capBase)` and 11.918 is the body cap-height. The resulting cap-height is 65.918 = 54 + 11.918 ✓. I used the CSS half-leading model: baseline₁ = (LH − (asc + desc))/2 + asc = 19.573.

| Check | Measured | Target | Δ |
|---|---|---|---|
| Cap top by metric (baseline − capHeight) | 7.655 | line-1 cap line 7.655 | 0.0000 pt |
| Cap baseline | 73.573 | line-3 baseline 73.573 | 0.0000 pt |
| Glyph ink box (`CTLineGetImageBounds`) | top 7.655 / bottom 73.573 | same | 0 (this Đ has no overshoot) |
| Raster scan at 2x (pixel value < 128) | top 8.00 / bottom 74.00 | 7.655 / 73.573 | +0.34 / +0.43 pt (under 1 px, anti-aliasing threshold) |
| Lines 1–3 | x = 70.40 (ink 66.404 + 4 margin-right), justified to 529.596 | 529.596 | 0 |
| Cap x | −1.701 (left side bearing kerned out, §7.6.2) | | |

`sunk-3-2.png` (baseline on line 2, text pushed down), `raised-3-1.png`, and `short-para.png` (a `“Đúng.”` paragraph: the quote is part of the cap and the exclusion carries into the next paragraph) all rendered as the spec describes, judged by eye.

**Timing** (`-O`, M-series arm64, macOS 27, mean of 100 runs after one warm-up; the page is 11 paragraphs, 33 lines):

| Phase (whole page) | µs |
|---|---|
| **Full layout, CT justification** (attributed strings, typesetters, breaks, lines, justification, drop cap) | **2150–2220** |
| Building attributed strings | 16 |
| `CTTypesetterCreate`, one per paragraph (11) / one for the whole page joined with U+2029 | 121 / 102 |
| `SuggestLineBreak` ×33 | 342 |
| `CreateLine` ×33 | 7 |
| `CTLineCreateJustifiedLine` ×33 | **2110** (≈64 µs per line) |
| Hand-written justification (glyphs + positions, spaces widened) ×33 | **230** |
| Font from bytes (Data → descriptors → CTFont) / from a cached descriptor / `CopyWithAttributes` to a new size | 35 / 0.5 / 0.6 |
| Rendering the page at 2x into a bitmap / PNG encoding 1360×1960 | 1040 / 18 400 |
| First layout of fresh strings | 1570 |

## 4. Performance notes
- **Justification is the hot spot.** Use `CTTypesetterCreateLine`, then take glyphs and positions from each `CTRun` (`CTRunGetGlyphs/Positions/StringIndices`), add `(width − natural)/spaceCount` after every U+0020 that is not trailing, and draw with `CTFontDrawGlyphs`. Expected page layout is about 0.5–0.6 ms [INFERENCE: sum of the phases above]. Keep `CTLineCreateJustifiedLine` for lines with no spaces, if letter-spacing is wanted there at all.
- **Typesetter granularity.** One typesetter per paragraph costs about 11 µs each, close to one per page (121 vs 102 µs). Use one per paragraph: it maps directly to CSS blocks, starts each paragraph at index 0, and repagination can re-typeset a single paragraph.
- **Attributed strings** are cheap (16 µs per page). Build them once per paragraph and keep them alongside the typesetter.
- **Fonts.** Parse the font bytes once per book (35 µs per face) and cache the `CTFontDescriptor`. Create sized fonts on demand (0.5 µs) and cache them by (face, size). Drop-cap sizes come from `CTFontCreateCopyWithAttributes`. [INFERENCE: Apple's Core Text Programming Guide says CTFont and CTFontDescriptor are immutable and thread-safe, so they can be shared across layout threads. Not tested here.]
- **PNG encoding (18 ms)** is about 8× the layout time and belongs only in the CLI or test path, not the reader.

## 5. Recipe (condensed from the verified `main.swift`)
```swift
// body: CTFont, capBase: CTFont (any size), L: line-height, W: column width
let a = CTFontGetAscent(body), d = CTFontGetDescent(body), cap = CTFontGetCapHeight(body)
let b0 = (L - (a + d)) / 2 + a                              // baseline of line 1 (half-leading)
let (letter, rest) = splitFirstLetter(text)                 // leading punct + 1 Character
let ratio = CTFontGetCapHeight(capBase) / CTFontGetSize(capBase)
let capFont = CTFontCreateCopyWithAttributes(capBase, ((CGFloat(n) - 1) * L + cap) / ratio, nil, nil)
let capLine = CTLineCreateWithAttributedString(attr(letter, capFont))
let ink = CTLineGetImageBounds(capLine, nil)                // y-up, pen-relative
var capBaseline = n >= sink ? top + b0 + CGFloat(sink - 1) * L               // §7.6.1 under-align
                            : top + b0 - cap + CTFontGetCapHeight(capFont)   //        over-align
let capTop = capBaseline - CTFontGetCapHeight(capFont)
if capTop < top { let s = top - capTop; top += s; capBaseline += s }        // raised/sunk push down
out.append(Placed(line: capLine, x: -ink.minX, baseline: capBaseline))     // §7.6.2 kerning
excl = Exclusion(bottom: capBaseline - ink.minY, right: ink.width + marginRight)

let ts = CTTypesetterCreateWithAttributedString(attr(rest, body))
let len = (rest as NSString).length; var start = 0, i = 0   // UTF-16 indices
while start < len {
    let lineTop = top + CGFloat(i) * L
    let x = (excl.map { lineTop < $0.bottom } ?? false) ? excl!.right : 0
    let width = Double(W - x)
    let count = CTTypesetterSuggestLineBreak(ts, start, width)
    var line = CTTypesetterCreateLine(ts, CFRange(location: start, length: count))
    start += count
    if start < len { line = CTLineCreateJustifiedLine(line, 1.0, width) ?? line } // not last line
    out.append(Placed(line: line, x: x, baseline: lineTop + b0)); i += 1
}
if let e = excl, e.bottom <= top + CGFloat(i) * L { excl = nil } // else carries to next block (§7.9.2)
// draw: ctx.textPosition = (margin + x, pageH + margin - baseline); CTLineDraw(line, ctx)
```

## 6. Limits of this research
- I did not render the WebKit reference. CoreText numbers agree with the spec formula, not with Safari's output.
- The tests used TTF only, a single font, left-to-right text only, and no rich inline runs (italic, notes) inside lines.
- The hand-written justification ignores bidi and treats only U+0020 as a justification opportunity. U+00A0 and other space characters are not covered.

## Unresolved questions
1. Does WebKit's `initial-letter` (a) set the exclusion to **ink width** (spec §7.5.5) or to **advance width**, (b) kern out the side bearing, and (c) round ascent and descent to whole pixels when placing baselines? Any of these can shift the cap or line 1 by 1–2 px against the reference PNG; check with the WebKit reference.
2. Which font metric does WebKit use for cap-height: OS/2 `sCapHeight` (what `CTFontGetCapHeight` returns) or the measured outline of "H"? Fonts without a v2 OS/2 table need a fallback (for example, the ink top of "H").
3. Should `::first-letter` also take in trailing punctuation, as CSS-Pseudo-4 (not in the local refs) suggests?
4. When the cap's ink extends past line N (a descender) but fewer than N lines fit on the page, does the profile's "move to next page" rule count ink lines or sink lines?
