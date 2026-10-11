---
phase: 2
title: "Cascade, registry, fonts, cutover"
status: pending
---

# Phase 2: Cascade, registry, fonts, cutover

## Files
- `Sources/CoReaderEngine/Style.swift`: property registry, rule buckets (id/class/tag/universal), cascade, `ComputedStyle`
- UA sheet embedded as a string in `Style.swift`
- `Sources/CoReaderEngine/Fonts.swift`: `@font-face` + system + generic resolution (C4)
- `Chapter.swift`, `Layout.swift`: consume `ComputedStyle` (adds `text-align: right`, `vertical-align: sub`, `line-height: normal`)
- Delete `SpikeStyle.swift`, `SpikeBook`; CLI drops `--style`/`--fonts`, gains `--user-css <file>` (repeatable) and `--no-book-css`

## Tasks
- [x] Registry: profile §3.3 properties, `margin` shorthand, values parsed once per declaration
- [x] Cascade: 5 origins, specificity, order; inheritance; computed values (C6)
- [x] `::first-letter` → `DropCapRule` (profile §6)
- [x] Fonts from book and user `@font-face`, system families, generics
- [x] Fixtures: `plain.css` without attribute selectors; `frame.css` split into `reader.css` (user CSS, shared) and webref-only page geometry
- [x] `Fixtures/css/user-inject.css`: simple user CSS used by the inject tests (C1)
- [x] Cutover: no `SpikeStyle` left; spike.sh and p1.sh use the new flags
