---
title: "P4 app shell: first usable CoReader.app"
date: 2026-10-11
---

# P4 app shell: first usable CoReader.app

## What shipped
- AppKit NSDocument app (XcodeGen, `scripts/build-app.sh`). Draws straight into the view with theme colours; footer title · x/y · %.
- Keys/click halves/scroll-swipe, chapter boundaries, internal links + ⌘[ back, external link confirm, refused-book alert.
- User CSS: `~/Library/Application Support/CoReader/user.css` + `books/<id>.css`, Edit/Ignore menus, live reload.

## Bugs found while driving the real app
- Directory watcher missed in-place saves → replaced with a 1 s mtime poll.
- Repeated relayouts (zoom out/in, CSS toggle) drifted backwards because each relayout re-derived the anchor from the new page start. Fix: keep a sticky (block, offset) anchor until the user navigates.

## Notes
- CSS `color` is ignored by design (theme owns colours) — users may expect it.
- EPUB 3 without nav is refused (correct per profile, but a hand-made test book tripped on it).
- Deferred: swipe sign on real hardware, stale layout during live resize, saved position/CFI (P5).

> Historical work record — not durable authority. Prefer docs/specs/ADRs for current decisions.
