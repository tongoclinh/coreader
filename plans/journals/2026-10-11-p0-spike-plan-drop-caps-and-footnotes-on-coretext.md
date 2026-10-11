---
title: "P0 spike plan: drop caps and footnotes on CoreText"
date: 2026-10-11
summary: "Researched CoreText and WebKit reference, wrote a 4-phase P0 plan, red-teamed it, applied 14 of 15 findings"
---

# P0 spike plan: drop caps and footnotes on CoreText

## What happened
- The advise session was locked into the docs:
  - docs/project-brief.md was rewritten; the owner later asked that the specs be a living baseline;
  - docs/engine-scope.md now records the speed path and the CSS 3-layer architecture;
  - the profile is versioned at 1.0.
- A docs-manager agent created README.md, AGENTS.md and CLAUDE.md, and added a change log to the brief.
- Two research agents ran verified experiments (saved in plans/261011-0250-p0-spike-dropcap-footnote/research/):
  - CoreText: the drop-cap formula is exact by metrics, and a page lays out in 2.2 ms (0.23 ms when justifying by hand); CoreText never hyphenates, and Vietnamese has no CF hyphenation data.
  - WebKit: a windowless WKWebView CLI works; only -webkit-initial-letter is supported; lines start at the cap's advance box edge.
- A 3-reviewer red team found 2 critical issues:
  - c04's one-line drop-cap paragraph would make the "N lines" rule loop forever;
  - verify-resume compared layoutPage against itself.
- The red team also found high-severity issues:
  - no whitespace collapse (notes contain hard newlines);
  - epub:type needs xmlGetNsProp;
  - "Tarif Medium" falls back to Helvetica when looked up by family name;
  - a warm bench hides the cold reopen time (6-20 ms cold vs 0.5-1 ms warm).

## Decision
- The drop-cap box follows WebKit: advance width plus margin-right, side bearing kept (owner). Recorded in the brief's change log.
- Diacritic glitches on drop caps are accepted; caps align on the cap-height metric.
- Pagination does two passes per page; PageStart holds pendingNotes [NoteCursor]; the drop-cap rule is height-based; widows, orphans and heading rules are deferred to P3.

## Next steps
- /ak:cook plans/261011-0250-p0-spike-dropcap-footnote/plan.md, then stop at G1 for the owner's verdict on artifacts/spike/.

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
