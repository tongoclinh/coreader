#!/bin/bash
# Book-open benchmark: CoReader vs CrReader (crengine) vs KOReader.
# Each run launches the app with `open` on a book and times it from the outside (scripts/openbench.swift):
# screen capture at 60 fps until the app's front window is visually complete (99%).
#   warmup: one untimed open per app and book (binaries and fonts into the OS cache)
#   first:  the app is quit and that book's caches/positions are reset (fresh copy of the file)
#   reopen: the app is quit, its caches for the book are warm (the state the first opens left)
# So one app and book is 1 + 2 × RUNS opens.
# Needs: Screen Recording permission for the terminal, Stage Manager off, nobody touching the Mac.
# Env: RUNS (5), APPS ("coreader crreader"; add koreader to compare it too), BOOKS ("bien-than nguoi-moi-den"), APPEND (keep results).
set -uo pipefail
cd "$(dirname "$0")/.."
RUNS=${RUNS:-5}
APPS=${APPS:-coreader crreader}
BOOKS=${BOOKS:-bien-than nguoi-moi-den}
OUT=artifacts/bench
W=/tmp/coreader-bench
KO_CACHE=~/Library/Application\ Support/koreader/cache/cr3cache

summary() { # results.jsonl → summary.md (median of visually complete; runs whose window went quiet < 1.5 s before the end are suspect)
  jq -rs '
    def median: sort | if length == 0 then null elif length % 2 == 1 then .[length/2|floor] else (.[length/2-1] + .[length/2]) / 2 end;
    map(select(.scenario != "warmup" and (.error | not)))
    | group_by([.book, .scenario, .app])
    | ["| book | scenario | app | visually complete, median (ms) | min–max (ms) | runs | quiet < 1.5 s |", "|---|---|---|---|---|---|---|"]
      + map("| \(.[0].book) | \(.[0].scenario) | \(.[0].app) | \(map(.complete_ms) | median) | \(map(.complete_ms) | min)–\(map(.complete_ms) | max) | \(length) | \(map(select(.settled_s < 1.5)) | length) |")
    | .[]' "$OUT/results.jsonl" > "$OUT/summary.md"
  { echo; echo "macOS $(sw_vers -productVersion)"; } >> "$OUT/summary.md"
  cat "$OUT/summary.md"
}
[ "${1:-}" = --summary ] && { summary; exit 0; }

mkdir -p "$OUT/frames" "$W" build
[ -f "$W/.stamp" ] || touch "$W/.stamp" # cache entries newer than this belong to the benchmark
swiftc -O scripts/openbench.swift -o build/openbench 2>/dev/null || { echo "openbench build failed"; exit 1; }
[ -d build/CoReader.app ] || scripts/build-app.sh
[ -d build/CrReader.app ] || scripts/build-crreader.sh >/dev/null
[ "$(defaults read com.apple.WindowManager GloballyEnabled 2>/dev/null)" = 1 ] && { echo "turn Stage Manager off first"; exit 1; }
[ -n "${APPEND:-}" ] || : > "$OUT/results.jsonl" # APPEND=1 adds to an earlier run (e.g. other apps)

name() { case $1 in coreader) echo CoReader;; crreader) echo CrReader;; koreader) echo KOReader;; esac; }
duration() { case $1 in koreader) echo 12;; *) echo 5;; esac; }
running() { if [ "$1" = koreader ]; then pgrep -f KOReader.app; else pgrep -x "$(name "$1")"; fi >/dev/null; }

quit_app() { # graceful quit (KOReader and CrReader save caches/positions on quit), then force after 15 s
  (osascript -e "quit app \"$(name "$1")\"" >/dev/null 2>&1 &)
  for _ in $(seq 30); do running "$1" || break; sleep 0.5; done
  if running "$1"; then echo "  (force-quit $1)" >&2; if [ "$1" = koreader ]; then pkill -f KOReader.app; else pkill -x "$(name "$1")"; fi; fi
  sleep 1
}

reset() { # $1 app $2 book: fresh file, no cache, no saved position
  mkdir -p "$W/$1"; rm -rf "$W/$1/$2.sdr"
  cp "Fixtures/private/profile/$2.profile.epub" "$W/$1/$2.epub"
  case $1 in
    koreader) find "$KO_CACHE" -name "$2.epub.*" -newer "$W/.stamp" -delete;;
    crreader) rm -f ~/Library/Caches/CrReader/"$2".epub.*;;
  esac
}

launch() { # $1 app $2 book → the command, one argument per line
  case $1 in
    koreader) printf '%s\n' /usr/bin/open -a KOReader "$W/$1/$2.epub";;
    *) printf '%s\n' /usr/bin/open -a "$PWD/build/$(name "$1").app" "$W/$1/$2.epub";;
  esac
}

measure() { # $1 app $2 book $3 scenario $4 run
  local png="" cmd r; [ "$4" = 1 ] && png="$OUT/frames/$1-$2-$3.png"
  IFS=$'\n' read -d '' -r -a cmd < <(launch "$1" "$2")
  r=$(build/openbench --owner "$1" --duration "$(duration "$1")" ${png:+--png "$png"} -- "${cmd[@]}" 2>&1 | tail -1)
  if [[ $r != \{* ]]; then echo "  $1 $2 $3 #$4: $r" >&2; r='{"error":true}'; fi
  echo "$r" | jq -c --arg a "$1" --arg b "$2" --arg s "$3" --argjson n "$4" '{app:$a, book:$b, scenario:$s, run:$n} + .' | tee -a "$OUT/results.jsonl"
  quit_app "$1"
}

for app in $APPS; do
  running "$app" && quit_app "$app"
  for book in $BOOKS; do
    echo "== $app / $book"
    reset "$app" "$book"; measure "$app" "$book" warmup 0 >/dev/null
    for n in $(seq "$RUNS"); do reset "$app" "$book"; measure "$app" "$book" first "$n"; done
    for n in $(seq "$RUNS"); do measure "$app" "$book" reopen "$n"; done
  done
done
summary
