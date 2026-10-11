# CoReader EPUB Profile 1.0

Status: **Baseline (2026-10-11).** Changes are expected as the spike and
implementation show what works. Record each change in the
[change log](project-brief.md#change-log).

Versioned. New CSS or markup support increases the minor version, and the engine accepts every earlier version.

A strict subset of EPUB 3.3/3.4 that CoReader renders exactly. Books outside
the profile still open (§9) but may lose formatting. A future optimizer tool
(out of current scope) will rewrite any EPUB 3 into this profile. Every rule
below is meant to be something such a tool can produce mechanically.

MUST and MUST NOT follow RFC 2119. Section references point to
[`refs/epub/epub3-survey.md`](refs/epub/epub3-survey.md) and the spec copies
in [`refs/epub/spec/`](refs/epub/spec/README.md).

## 1. Container and package

1. The file is a ZIP with entries Stored or Deflated. It has no encryption and no `META-INF/encryption.xml`.
2. `META-INF/container.xml` has exactly one `rootfile`.
3. `package/@version` is `3.0` or higher.
4. The layout is reflowable: there is no `rendition:layout` other than `reflowable`.
5. Metadata MUST include `dc:title`, `dc:language` and `dc:identifier`. `dc:creator` is optional.
6. The manifest has exactly one item with `properties="nav"`, and at most one with `properties="cover-image"`.
7. Every spine `itemref` is linear: there is no `linear="no"`.
8. There are no remote resources, no scripts and no fallback chains.

## 2. Content documents

1. XHTML, UTF-8, well-formed XML. No DOCTYPE entities: only the five XML entities and numeric character references are allowed.
2. Allowed elements:

   | Kind | Elements |
   |---|---|
   | Document | `html head title link[rel=stylesheet] meta body` |
   | Block | `section div p h1–h6 blockquote hr figure figcaption header footer ul ol li` |
   | Inline | `span a em i strong b small sup sub br img` |
   | Notes | `aside` (only as a footnote, §5) |

3. Allowed attributes: `id class lang xml:lang dir href src alt epub:type role`.

## 3. Stylesheets

1. CSS comes only from `<link rel="stylesheet">` to a manifest CSS file. There is no `style` attribute and no `<style>` element.
2. Selectors: type, `.class`, `#id`, compound forms (`p.x`), descendant (space), child (`>`), adjacent sibling (`+`), selector lists (`,`), and `::first-letter` (§6 only).
3. Properties:

   | Property | Values |
   |---|---|
   | `font-family` | family names from `@font-face`, `serif`, `sans-serif`, `monospace` |
   | `font-size` | length, `%`, `smaller`, `larger` |
   | `font-style` | `normal`, `italic` |
   | `font-weight` | `normal`, `bold`, 100–900 |
   | `text-align` | `left`, `right`, `center`, `justify` |
   | `text-indent` | length, `%` |
   | `line-height` | `normal`, number, length |
   | `margin`, `margin-top/right/bottom/left` | length, `%`, `auto` (horizontal centering only) |
   | `display` | `none`, `block`, `inline` |
   | `vertical-align` | `baseline`, `super`, `sub` |
   | `break-before`, `page-break-before` | `auto`, `page` / `always` |
   | `hyphens` | `none`, `auto` |
   | `initial-letter` | §6 |

4. Units: `em`, `rem`, `%`, `px`, `pt`.
5. At-rules: only `@font-face`, with `font-family`, `src: url(...)` pointing to a container OTF or TTF file, `font-weight` and `font-style`.
6. Color, background, borders, padding, floats and positioning are not part of the profile. The reader's theme controls color.

## 4. Images

1. Images use `<img src alt>` with JPEG, PNG, GIF or WebP files from the container. There is no SVG in any form, including covers.
2. An image is either the only child of a block element (`p`, `div`, `figure`), which makes it a block image, or it sits inline in text.

## 5. Footnotes

1. A reference is `<a epub:type="noteref" href="#ID">MARK</a>`. The `href` is a fragment in the **same document**. `MARK` is the marker shown in the text and at the start of the note, for example `1`, `*` or `§`; it should be at most 4 characters.
2. A note is `<aside epub:type="footnote" id="ID">` containing only blocks (`p`, `div`, …). It may sit anywhere in the same document.
3. A back-link inside a note, if present, MUST carry `role="doc-backlink"`.
4. Only `noteref` and `footnote` are recognized. `endnote`, `rearnote`, `note`, the `doc-*` note roles and class-name conventions are not part of the profile.

## 6. Drop caps

1. A drop cap is `X::first-letter { initial-letter: N }`, where N is an integer from 2 to 5 and X is a selector from §3.2. Optionally a second argument M sets the sink: `initial-letter: N M`.
2. The only other properties allowed on `::first-letter` are `font-family`, `font-weight` and `margin-right`.
3. The first letter is leading punctuation + one grapheme + trailing punctuation (css-pseudo-4, as WebKit): `“S`, `Ừ,`.
4. The cap font must carry a cap height (OS/2 table v2 or later). Fonts without one are not supported for drop caps in v1; a fallback (e.g. measuring the `H` glyph) is deferred.

## 7. Navigation

1. The nav document has a `nav[epub:type="toc"]` with an `ol` of `li > a[href]`, nested `ol` for sub-chapters, and every `href` pointing to a spine document, optionally with `#fragment`.
2. Internal links are `<a href="doc.xhtml#id">` to spine documents. External links are absolute `https:` URLs.

## 8. Rendering contract (what the profile guarantees)

| Feature | Behavior |
|---|---|
| Paragraphs | Justification, at least 2 lines for widows and orphans (no hyphenation in v1; `hyphens` is ignored) |
| Headings | Never the last line on a page |
| Page breaks | `break-before: page` starts a new page; so does every spine document |
| Block images | Scaled to fit the page, aspect ratio kept, never split |
| Drop caps | The cap's top aligns with the cap height of line 1, and its baseline with the baseline of line N. Lines 1 to N are shortened by the cap box: the cap's advance width plus `margin-right` (as WebKit), and this exclusion carries into the next block on the same page. If fewer than N lines fit on a page, the cap and its paragraph move to the next page. |
| Footnotes | Every note is removed from the flow and placed at the bottom of the page whose line contains its first noteref, under a separator, in reference order, in a smaller size, starting with `MARK`. A line whose note cannot get at least 2 lines on the page moves to the next page. Longer notes continue on the next page. Back-links are hidden. |

## 9. Books outside the profile

- **Refused with a message**: EPUB 2, fixed layout, encrypted or DRM-protected books, and books without a nav document.
- **Anything else** opens, and non-conforming constructs are ignored:
  - unknown elements render as `div` or `span`
  - unknown CSS rules, properties and at-rule blocks are dropped
  - SVG is skipped
  - notes that do not match §5 stay in the text flow as ordinary blocks
