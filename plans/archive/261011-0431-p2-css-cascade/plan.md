---
title: "P2 CSS — parser, cascade, user CSS injection"
description: "Replace the hard-coded SpikeStyle with a real CSS pipeline: Syntax-3 tokenizer, Selectors subset, property registry, 5-origin cascade, @font-face from the ZIP. The reading look is user CSS, not engine code."
status: completed
priority: P1
effort: 4d
branch: main
tags: [feature]
blockedBy: [261011-0422-p1-container]
blocks: []
created: 2026-10-11
---

# P2 CSS: parser, cascade, user CSS injection

Scope: [engine-scope "Styling"](../../docs/engine-scope.md#styling), profile §3, §6, §9.

## Core idea: the engine has no "look"

The engine knows three kinds of stylesheet and nothing else:

| Origin (weak → strong) | Source | Who owns it |
|---|---|---|
| UA normal | `ua.css`: HTML defaults for profile elements (WebKit `html.css` subset) | engine, fixed |
| User normal | ordered list of user CSS files | user / app |
| Book normal | `<link rel=stylesheet>` of the chapter | book |
| Book `!important` | same | book |
| User `!important` | same user files | user / app |

v1 ships **no** reading preset: without user CSS a book renders as UA + book CSS (as Apple Books). A "look" such as KOReader's `epub.css` would be just one more user CSS file; the engine never special-cases one.

## Decisions

- **C1. No shipped preset, no port of KOReader `epub.css`** (owner, 2026-10-11). `epub.css` is AGPL-3 and mostly crengine compat; the brief rules out KOReader derivation and engine-scope rules out heuristics. A simple test file, `Fixtures/css/user-inject.css`, exercises injection.
- **C2 (superseded 2026-10-11: user CSS now merges after book CSS, see engine-scope). User normal sits below book normal** (CSS Cascade), so user CSS only fills what the book leaves unset; `!important` forces a value over the book.
- **C3. Inheritance trap, documented for user CSS authors.** A declaration on an element beats an inherited value whatever its origin: user `p { text-align: justify }` beats the book's `div.center { text-align: center }`. Inherited properties belong on `html`/`body` in user CSS.
- **C4. Fonts.** `font-family` resolves in order: book `@font-face` (URL relative to the CSS file, read from the ZIP; CSS weight/style matching), user `@font-face` (URL relative to the user CSS file), installed system family by name, then generics (`serif` → Times New Roman, `sans-serif` → Helvetica, `monospace` → Menlo). No synthetic bold/italic.
- **C5. Invalid or unknown CSS.** Parsed per CSS Syntax 3 error recovery. Unknown at-rules (`@media`, `@supports`, …) and unknown properties stay in the parsed stylesheet (counted for diagnostics) but never reach the cascade (profile §9). An invalid selector drops its whole rule (Selectors 4).
- **C6. Units.** 1 CSS px = 1 layout unit (pt on screen, as WebKit on macOS); `pt` = 4/3 px; `rem` from the root `html` font size; `%` per property (font-size: parent size; margins/indent: containing block width).
- **C7. Computed-style parity with WebKit is the main check.** `coreader styles` and `webref --styles` dump the same computed properties per element; a diff names every mismatch. WebKit has no public user-origin stylesheet, so origin ordering is checked against hand-written expectations instead.

## Phases

| # | Phase | Status |
|---|---|---|
| 1 | [Tokenizer, parser, selectors](phase-01-css-syntax-and-selectors.md) | completed |
| 2 | [Cascade, registry, fonts, cutover](phase-02-cascade-fonts-cutover.md) | completed |
| 3 | [Parity, origins, regressions](phase-03-verification.md) | completed |

## Risks
- Rendering drift on cutover: `SpikeStyle` was a hand mirror, so any difference in P0 outputs is either a cascade bug or a mirror bug. Both get named before acceptance.
- `line-height: normal` and `font-size` keywords differ subtly between engines; parity diff will show it.
