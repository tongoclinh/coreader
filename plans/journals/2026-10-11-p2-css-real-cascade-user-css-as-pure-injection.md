---
title: "P2 CSS — real cascade, user CSS as pure injection"
date: 2026-10-11
---

# P2 CSS — real cascade, user CSS as pure injection

## What happened
Owner decided before cooking: no reading preset in v1, KOReader epub.css not ported (AGPL, crengine compat); user CSS is pure injection, a simple `Fixtures/css/user-inject.css` tests it. User CSS may name system fonts.
Built CSS Syntax 3 tokenizer/parser (`CSS.swift`), profile selectors (`Selector.swift`), registry + 5-origin cascade + computed values (`Style.swift`), font resolution book @font-face → user @font-face → system → generic (`Fonts.swift`). Deleted `SpikeStyle`. CLI: `--user-css` (repeatable), `--no-book-css`, `styles`, `compare-styles`, `css-report`; webref `--styles`.

## Evidence (`scripts/p2.sh`, exit 0)
- Computed styles = WebKit on torture fixture + all 52 spine documents of both profile books (0 differences).
- Origins: 7 expectation checks pass (incl. inheritance trap, attribute-selector list dropped, Charter from the system).
- P0 outputs byte-identical after cutover (pages.json, lines.json, drop-cap geometry), so the hand-written SpikeStyle mirror and the real cascade agree.
- k01–k06: all 192 spine docs style without error; ignored CSS counted per file.
- Reopen (reference): c04 13.9 ms, c26 16.6, c03 12.0.

## Bugs the parity diff caught
- Type selectors were lowercased; XHTML matching is case-sensitive (`P.UPPER` must not match `<p>`).
- Negative font-size/line-height accepted; now invalid.
- `text-indent: 1.25em` was re-resolved against each descendant's font size; computed value is px at declaration.
- Test-side: WebKit getComputedStyle leaves `%` unresolved for text-indent and inline margins; webref resolves them.

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
