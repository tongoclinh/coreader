---
title: "P4 app shell — a usable reader window"
description: "AppKit document app (XcodeGen) on CoReaderEngine: open .epub, one window per book, page turns, resize, dark mode, footer, links with back stack, user CSS file with live reload."
status: completed
priority: P1
effort: 3d
branch: main
tags: [feature]
blockedBy: [261011-0600-p3-layout]
blocks: []
created: 2026-10-11
---

# P4 app shell: a usable reader window

Scope: [engine-scope "App"](../../docs/engine-scope.md#app) and "Styling" (user CSS files). Saved positions (CFI), the pagination cache and background page counts are P5.

## Decisions
- A1. `NSDocument` app: double-click, Open Recent and one window per book come from AppKit. `project.yml` (XcodeGen) builds `CoReader.app` from `App/` and the local package; `build/` holds the project output.
- A2. A view draws the current page straight into its context through `Canvas(context:)`: no page bitmaps. Text colour and background follow the system appearance; images are not inverted.
- A3. One chapter is laid out at a time and fully paginated on open (page x/y needs the count). Book percent uses the uncompressed sizes of the spine entries from the ZIP directory, so no other chapter is parsed.
- A4. Resize re-lays the chapter out at the end of a live resize and keeps the (block, offset) of the current page start.
- A5. User CSS: `~/Library/Application Support/CoReader/user.css` (global) and `books/<identifier>.css` (per book), merged after the book CSS; the app watches the folder and reloads. "Ignore Book CSS" is a per-book menu toggle. Menu items open the CSS files in the default editor (created empty if missing).
- A6. Links: internal links jump to the anchor and push a back stack (⌘[); external `https:` links open in the browser after a confirmation.
- A7. Refused books (§9) show the `BookError` text in the standard open-failure alert.

## Phases

| # | Phase | Status |
|---|---|---|
| 1 | [App, reader view, verification](phase-01-app.md) | pending |
