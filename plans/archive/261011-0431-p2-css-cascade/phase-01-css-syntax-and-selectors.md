---
phase: 1
title: "Tokenizer, parser, selectors"
status: pending
---

# Phase 1: Tokenizer, parser, selectors

## Files
- `Sources/CoReaderEngine/CSS.swift`: tokenizer (CSS Syntax 3 §4), rule/declaration parser with error recovery, `Stylesheet` model
- `Sources/CoReaderEngine/Selector.swift`: selector AST, specificity, right-to-left matching on the flat DOM
- `Sources/CoReaderEngine/XHTML.swift`: keep `<head>` `link[rel=stylesheet]` hrefs on `Document`

## Tasks
- [x] Tokenizer: idents, strings, numbers/dimensions/percentages, hash, url, delims, comments, escapes
- [x] Parser: qualified rules, at-rules (blocks kept as unknown), declarations with `!important`
- [x] `@font-face` descriptors: family, src url(s), weight, style
- [x] Selectors: type, `*`, `.class`, `#id`, compound, descendant, `>`, `+`, lists, `::first-letter`; anything else invalidates the rule
- [x] Specificity (a, b, c); matching from the rightmost compound
- [x] `Document.stylesheets` from `<head>`
