# EPUB 3 survey for CoReader

Date: 2026-10-11. Spec snapshots are in [`spec/`](spec/README.md).
Citations: "RS" = `spec/epub-rs-34.md`, "Core" = `spec/epub-34.md`,
"SSV" = `spec/epub-ssv-11.md`. Claims not checked against a source are
marked [INFERENCE].

## 1. Versions

| Version | Status | Note |
|---|---|---|
| EPUB 3.3 | W3C Recommendation (core 13 Jan 2026, RS 17 Oct 2024) | Current standard |
| EPUB 3.4 | Candidate Recommendation Draft (core 02 Oct 2026, RS 21 Jul 2026) | Latest; Recommendation expected 2027 |
| EPUB 2.0.1 | Superseded | RS §12: reading systems MUST attempt to open it |

What 3.4 changes for a reflowable reader (RS App. D, Core App. I):

- `rendition:flow`, `rendition:spread` and `rendition:orientation` become
  "outdated" and their RS processing rules are removed. Paginated versus
  scrolled view is a reader choice.
- A new Layout section (RS §6) makes reflowable the MUST and the default.
- AVIF and JPEG XL become core image types.
- The CSS section is rewritten. It now has a SHOULD for using the HTML
  suggested default rendering as the UA stylesheet, and asks implementers to
  document their UA sheet.
- Font obfuscation, OPF 2 legacy features, content fallbacks and `-epub-`
  CSS prefixes are reclassified as "outdated". Existing books still use them.
- Roll layout (a webtoon form of fixed layout) is added. It is irrelevant
  to novels.
- HTML (non-XML) syntax was added in a draft and later removed, so content
  documents remain XHTML.

Net effect: 3.4 adds no work for a novel reader and removes the flow and
spread obligations.

## 2. Publication structure

```
book.epub (ZIP)
├── mimetype                  "application/epub+zip", first, stored
├── META-INF/container.xml    → first <rootfile full-path="…opf">
├── META-INF/encryption.xml   obfuscated fonts (optional)
└── OEBPS/
    ├── content.opf           metadata · manifest · spine
    ├── nav.xhtml             EPUB 3 TOC (manifest property "nav")
    ├── toc.ncx               EPUB 2 TOC (legacy)
    ├── *.xhtml               content documents, in spine order
    ├── *.css, fonts/, images/
```

| Part | Reading-system rules that matter | Source |
|---|---|---|
| ZIP | Store and Deflate only. ZIP64 is supported. Encrypted or split archives are errors. Be lenient about `mimetype`. | RS §4.2 |
| container.xml | Use the first rootfile. Ignore unknown META-INF files. | RS §4.1.3 |
| URLs | One container root; `..` cannot escape it. Block `file:` URLs and top-level `data:` URLs. | RS §4.1.1, §3.5–3.6 |
| XML | Non-validating, namespace-aware, no external DTDs. EPUB 2 files often use `&nbsp;` with an XHTML 1.1 DOCTYPE, so named entities must be resolved without the DTD. | RS §3.7 |
| Metadata | First `dc:title` is the title. `dc:creator` keeps document order. Collapse whitespace. Unknown meta never fails. | RS §5.3 |
| Manifest | `nav`, `cover-image` and `svg` properties. Ignore unknown properties. | RS §5.4 |
| Spine | Render in order from the first linear item. `linear="no"` items may be skipped while paging but are rendered when linked. | RS §5.5 |
| Nav | Expose `toc` nav links. Landmarks and page-list are optional. | RS §8 |
| EPUB 2 | NCX for the TOC, `guide` and `<meta name="cover">` when `version` < 3. | RS §12, §5.7 |
| Fonts | TTF, OTF, WOFF and WOFF2 through `@font-face` (MUST). Deobfuscation (SHOULD): IDPF = XOR of the first 1040 bytes with the SHA-1 of the identifier; Adobe = 1024 bytes, key from the urn:uuid [INFERENCE: not in the spec copies]. | RS §7.4, §4.3; Core §4.4 |
| CSS | MUST "support the official definition of CSS", which no custom engine meets literally. Overriding author CSS is MAY, which is what licenses KOReader-style tweaks. | RS §7.4, §7.4.1 |
| i18n | `lang` and `dir` come from the content, never inherited from the OPF. `page-progression-direction` sets the page-turn direction. | RS §3.8, §5.5 |

## 3. Conformance classification for a reflowable novel reader

| Class | Items |
|---|---|
| MUST, in scope | OCF/ZIP, first rootfile, root URL, non-validating XML, metadata/manifest/spine rules, XHTML with HTML semantics, viewport meta ignored, core image types, CSS + TTF/OTF/WOFF/WOFF2, nav TOC, fallback chains with an unsupported-content alert, opening EPUB 2 |
| MUST, deliberately not met | Fixed layout (RS §6.1.2.1, §7.3); MathML rendering (RS §7.1.2.2); full CSS. These are documented gaps, shown to the user as an "unsupported layout" notice or a fallback rendering. |
| SHOULD | Font deobfuscation, lenient file names, HTML-default UA sheet, `-epub-` prefixes, page-list, consent before opening external links |
| MAY or out of scope | Scripting, media overlays and TTS, audio and video, remote resources, collections, forms, landmarks, roll layout |

## 4. Footnotes and endnotes

The spec defines semantics for notes but leaves how they are displayed to the
reader (RS §10 is entirely MAY).

| Term (SSV §12–13) | Element | DPUB-ARIA role | Status |
|---|---|---|---|
| `noteref` | `a` | `doc-noteref` | current |
| `footnote` | `aside` | `doc-footnote` | current |
| `footnotes`, `endnotes` | sectioning content | `doc-endnotes` | current |
| `backlink` | `a` | `doc-backlink` | current |
| `note`, `endnote`, `rearnote(s)` | — | `doc-note`, `doc-endnote`, `doc-rearnote` | deprecated, still common |

KOReader's default (`DEFAULT_GLOBAL_STYLE_TWEAKS["footnote-inpage_epub"] = true`,
`.refs/koreader/frontend/ui/data/css_tweaks.lua:27`) applies
`-cr-hint: footnote-inpage` to these elements (css_tweaks.lua:920-943):

```css
*[type~="note"], *[type~="endnote"], *[type~="footnote"], *[type~="rearnote"],
*[role~="doc-note"], *[role~="doc-endnote"], *[role~="doc-footnote"], *[role~="doc-rearnote"]
```

KOReader also enables `inpage_footnote_font-size_smaller` by default (css_tweaks.lua:29).
The class-name variant (`.footnote`, `.fn`, `.note`, …; css_tweaks.lua:965-988)
is off by default. When a link is not marked up as a note, KOReader's popup
detection (`readerlink.lua:1423-1500`) uses these heuristics: the target has an
id, comes after the source, and is not a TOC target or heading; the source is
in `sup`/`sub` or has a raised vertical-align; and its text is a short number
or letter-digit code.

## 5. How novels are actually built [INFERENCE: producer conventions, no corpus count]

| Producer | Files | Chapters | Notes | Other |
|---|---|---|---|---|
| Standard Ebooks | EPUB 3 | One XHTML per chapter, `section[epub:type=chapter]`, `hgroup` | `endnotes.xhtml` with `li[epub:type=endnote]` and `a[epub:type=noteref]` in `sup` | `hr` scene breaks, verse in `blockquote` |
| Project Gutenberg | EPUB 3 and EPUB 2 | Split every 100–300 KB, so chapter boundaries do not follow files | `a.fnanchor` → `div.footnote` | `hr.tb`, `div.poem > span.i0` |
| Calibre | Mostly EPUB 2 | Split at page breaks or every 260 KB, `calibreN` classes | Varies | SVG-wrapped cover |
| Sigil | EPUB 2 or 3 | One file per chapter | Varies | `p.center` "***" breaks, SVG cover |
| Pandoc | EPUB 3 | One file per h1 | `aside[epub:type=footnote]` at chapter end | Plain `hr` |
| Retail (InDesign) | EPUB 3 or 2 | One file per chapter | `epub:type` or class names | Embedded and obfuscated fonts, drop caps, `.noindent` |

The CSS that novels use, roughly by frequency:

1. `text-indent`, `margin`
2. `text-align`
3. `font-style`, `font-weight`, `font-size`
4. `page-break-*` / `break-*`
5. `font-variant: small-caps`, `text-transform`, `letter-spacing`
6. `display: none|block`, `hyphens`
7. `line-height`, `vertical-align: super`, `::first-letter`
8. `float` (drop caps and images), `width` / `max-width` in %
9. `@font-face`
10. Rare: borders, `@page`, `@media`, `position`, columns, `writing-mode`

Selectors are mostly type, class, descendant, child, `+`, `:first-child`,
attribute (`[epub|type~=…]`), `:not()` and `::first-letter`.

## 6. KOReader UA stylesheet

The default is `epub.css` (`readertypeset.lua:103`), which `@import`s
`html5.css` (`.refs/crengine/cr3gui/data/epub.css:1`). It sets:

- `body { text-align: justify }`
- `p { text-indent: 1.2em; margin: 0 }`
- headings at 150% down to 100% with `hyphens: none`
- `blockquote { margin: 0.5em 1em 0.5em 2em }`
- `sup` and `sub` at 70%
- a smaller font for tables

These defaults are what make "a book look like a book" even when the EPUB
ships no CSS of its own.
