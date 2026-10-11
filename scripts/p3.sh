#!/usr/bin/env bash
# P3 layout E2E: regenerates artifacts/p3/ from scratch. Exit 0 = every check passed.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=.build/release/coreader
OUT=artifacts/p3
TMP=build/p3
PRIVATE=Fixtures/private
READER=(--user-css Fixtures/spike/reader.css)
fail=0
bad() { echo "FAIL: $*"; fail=1; }
expect() { # file jq-filter expected label
  local got; got=$(jq -c "$2" "$1")
  if [[ "$got" == "$3" ]]; then echo "ok: $4"; else bad "$4: got $got, want $3"; fi
}

swift build -c release 2>&1 | tail -1
[[ -d "$PRIVATE/profile" ]] || { echo "Fixtures/private missing — see Fixtures/README.md" >&2; exit 1; }
rm -rf "$OUT" "$TMP"; mkdir -p "$OUT/pages" "$TMP"
exec > >(tee "$OUT/summary.txt") 2>&1

echo "== blocks fixture (Fixtures/layout/blocks.xhtml)"
"$BIN" paginate Fixtures/layout/blocks.xhtml --out-dir "$TMP/blocks" --check
L=$TMP/blocks/lines.json
expect "$L" 'length' 2 "h2 break-before: page starts page 2"
expect "$L" '.[1][0] | [.kind, .location]' '["body",0]' "page 2 opens with the h2"
expect "$L" '[.[0][] | select(.kind == "image") | .x]' '[110]' "block image (300 px) centred in the 520 pt column"
expect "$L" '[.[0][] | select(.source >= 3 and .source <= 5) | .x]' '[40,40,40]' "list items indented 40 px"
expect "$L" '[.[][] | select(.kind == "body")] | length' 8 "svg skipped (8 text lines)"
cp "$TMP"/blocks/page-*.png "$OUT/pages/" && for f in "$OUT"/pages/page-*.png; do mv "$f" "${f%/*}/blocks-${f##*/}"; done

echo "== every spine document paginates with --check (notes, widows/orphans, headings, breaks, no blank page)"
book() { # name epub [flags...]
  local name=$1 epub=$2; shift 2
  local n pages=0 empty=0 t0 t1
  n=$("$BIN" book "$epub" | jq '.spine | length')
  mkdir -p "$TMP/$name"
  t0=$(date +%s)
  for ((i = 0; i < n; i++)); do
    local o=$TMP/$name/$i
    if ! "$BIN" paginate --epub "$epub" --spine "$i" --out-dir "$o" --check "$@" > "$o.log" 2>&1; then
      bad "$name spine $i: $(grep -v '^CHECK FAILED' "$o.log" | head -3 | tr '\n' ' ')"
      continue
    fi
    pages=$((pages + $(jq length "$o/pages.json")))
    [[ $(jq '[.[][]] | length' "$o/lines.json") == 0 ]] && empty=$((empty + 1))
  done
  t1=$(date +%s)
  printf '%-16s %3d documents, %5d pages, %d empty documents (skipped by the app), %ds\n' "$name" "$n" "$pages" "$empty" $((t1 - t0))
}
for b in bien-than nguoi-moi-den; do book "$b" "$PRIVATE/profile/$b.profile.epub" "${READER[@]}"; done
for k in k01 k02 k03 k04 k05 k06; do book "$k" "$PRIVATE/$k.epub" "${READER[@]}"; done

# Kept pages: both covers (block images) and the opening of a drop-cap chapter.
# k06's content images point at entries missing from its ZIP, so they are skipped there.
cp "$TMP/bien-than/0/page-001.png" "$OUT/pages/bien-than-cover.png"
cp "$TMP/nguoi-moi-den/0/page-001.png" "$OUT/pages/nguoi-moi-den-cover.png"
cp "$TMP/bien-than/4/page-001.png" "$OUT/pages/bien-than-c04-p1.png"

echo "== P2 + P0 regressions"
scripts/p2.sh > "$TMP/p2.log" 2>&1 && echo "ok: scripts/p2.sh (includes spike.sh all)" || bad "scripts/p2.sh: $(tail -3 "$TMP/p2.log" | tr '\n' ' ')"

[[ $fail == 0 ]] && echo "P3 E2E: PASS" || echo "P3 E2E: FAIL"
exit $fail
