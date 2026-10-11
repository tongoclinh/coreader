#!/usr/bin/env bash
# P2 CSS E2E: regenerates artifacts/p2/ from scratch. Exit 0 = every check passed.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=.build/release
OUT=artifacts/p2
TMP=build/p2
PROFILE=Fixtures/private/profile
READER=(--user-css Fixtures/spike/reader.css)
fail=0
bad() { echo "FAIL: $*"; fail=1; }

swift build -c release 2>&1 | tail -1
[[ -d "$PROFILE" ]] || { echo "Fixtures/private missing — see Fixtures/README.md" >&2; exit 1; }
rm -rf "$OUT" "$TMP"; mkdir -p "$OUT/parity" "$OUT/degraded" "$OUT/inject" "$TMP"
exec > >(tee "$OUT/summary.txt") 2>&1

# WebKit copy of a chapter: frame.css (webref geometry), the book CSS, then reader.css (user CSS merges after the book).
ref_copy() { # xhtml → ${xhtml%.xhtml}.ref.xhtml, with reader.css/frame.css next to it
  local dir; dir=$(dirname "$1")
  cp Fixtures/spike/reader.css Fixtures/spike/frame.css "$dir/"
  sed -e 's#<head>#<head><link rel="stylesheet" href="frame.css"/>#' -e 's#</head>#<link rel="stylesheet" href="reader.css"/></head>#' "$1" > "${1%.xhtml}.ref.xhtml"
}
parity() { # name xhtml root
  local name=$1 xhtml=$2 root=$3 o=$OUT/parity/$1
  ref_copy "$xhtml"
  "$BIN/coreader" styles "$xhtml" "${READER[@]}" --out "$o.ours.json"
  "$BIN/webref" "${xhtml%.xhtml}.ref.xhtml" --root "$root" --styles "$o.wk.json"
  "$BIN/coreader" compare-styles "$o.ours.json" "$o.wk.json" --out "$o.diff.json" > "$o.txt" || bad "parity $name: $(head -1 "$o.txt")"
  printf '%-34s %s\n' "$name" "$(head -1 "$o.txt")"
}

echo "== computed-style parity with WebKit"
mkdir -p "$TMP/css" && cp Fixtures/css/torture.* "$TMP/css/"
parity torture "$TMP/css/torture.xhtml" "$TMP/css"
for b in bien-than nguoi-moi-den; do
  mkdir -p "$TMP/$b" && unzip -oq "$PROFILE/$b.profile.epub" -d "$TMP/$b"
  while read -r path; do
    parity "$b-$(basename "$path" .xhtml)" "$TMP/$b/$path" "$TMP/$b"
  done < <("$BIN/coreader" book "$PROFILE/$b.profile.epub" | jq -r '.spine[]')
done

echo "== user CSS merged after book CSS (ours only)"
O=Fixtures/css
"$BIN/coreader" styles $O/origins.xhtml --user-css $O/origins-user.css --out "$OUT/origins.json"
"$BIN/coreader" styles $O/origins.xhtml --user-css $O/origins-user.css --no-book-css --out "$OUT/origins-no-book.json"
expect() { # file jq-filter expected description
  local got; got=$(jq -r "$2" "$1")
  [[ $got == "$3" ]] && echo "ok: $4" || bad "$4: got $got, expected $3"
}
expect "$OUT/origins.json" '.[1].align' right "user p.u1 beats book p (specificity)"
expect "$OUT/origins.json" '.[2].align' left "both !important, equal specificity: user (later) wins"
expect "$OUT/origins.json" '.[3].align' right "book !important beats user normal"
expect "$OUT/origins.json" '.[4].align' center "more specific book rule beats user rule"
expect "$OUT/origins.json" '.[5].align' right "equal specificity: user (later) wins"
expect "$OUT/origins.json" '.[7].indent' 7 "inheritance trap: user p beats inherited book text-indent 0"
expect "$OUT/origins.json" '.[8].marginLeft' 0 "selector list with an attribute selector is dropped"
expect "$OUT/origins.json" '.[0].font' Charter-Roman "user CSS names an installed system family"
expect "$OUT/origins-no-book.json" '.[1].align + .[3].align' rightleft "--no-book-css leaves UA + user"

echo "== book @font-face from the ZIP"
c04=$("$BIN/coreader" book "$PROFILE/bien-than.profile.epub" | jq '.spine | index("OEBPS/text/c04.xhtml")')
"$BIN/coreader" styles --epub "$PROFILE/bien-than.profile.epub" --spine "$c04" "${READER[@]}" --out "$OUT/bien-than-c04.styles.json"
expect "$OUT/bien-than-c04.styles.json" '[.[].font] | unique | map(select(startswith("TimesNewRoman") | not)) | length > 0' true \
  "c04 resolves a book @font-face face ($(jq -r '[.[].font] | unique | join(", ")' "$OUT/bien-than-c04.styles.json"))"

echo "== user CSS injection (Fixtures/css/user-inject.css)"
"$BIN/coreader" render Fixtures/spike/plain.xhtml --user-css Fixtures/css/user-inject.css --out "$OUT/inject/plain-user-inject.png" --clip 900
"$BIN/coreader" render Fixtures/spike/plain.xhtml "${READER[@]}" --out "$OUT/inject/plain-reader.png" --clip 900
"$BIN/coreader" styles Fixtures/spike/plain.xhtml --user-css Fixtures/css/user-inject.css --out "$OUT/inject/plain-user-inject.styles.json"
expect "$OUT/inject/plain-user-inject.styles.json" '.[0].font + " " + (.[0].fontSize|tostring)' "Charter-Roman 19" "injected body font and size"
expect "$OUT/inject/plain-user-inject.styles.json" '[.[] | select(.tag == "p")][1].indent' 22.8 "user p text-indent 1.2em (of the injected 19px) beats book p 1.25em"

echo "== degraded books: every spine document styles; ignored CSS reported"
for f in Fixtures/private/k0*.epub; do
  name=$(basename "$f" .epub) n=0
  "$BIN/coreader" css-report "$f" > "$OUT/degraded/$name.css-report.json"
  count=$("$BIN/coreader" book "$f" | jq '.spine | length')
  for ((k = 0; k < count; k++)); do
    "$BIN/coreader" styles --epub "$f" --spine "$k" "${READER[@]}" --out "$TMP/$name-$k.json" 2> "$TMP/err" || bad "$name spine $k: $(cat "$TMP/err")"
    n=$((n + 1))
  done
  echo "$name: $n documents styled; ignored: $(jq -c '[.[] | .ignoredAtRules | to_entries[] | .key] | unique' "$OUT/degraded/$name.css-report.json") at-rules, $(jq '[.[] | .invalidSelectors | length] | add' "$OUT/degraded/$name.css-report.json") invalid selectors, $(jq '[.[] | .unknownProperties | keys[]] | unique | length' "$OUT/degraded/$name.css-report.json") unknown properties"
done

echo "== P0 spike regressions (drop caps vs WebKit, footnotes, books, bench)"
scripts/spike.sh all > "$OUT/spike.log" 2>&1 || bad "scripts/spike.sh all (see $OUT/spike.log)"
grep -E '^dropcaps:|reopenMs' "$OUT/spike.log"

[[ $fail -eq 0 ]] && echo "P2 E2E: PASS" || { echo "P2 E2E: FAIL"; exit 1; }
