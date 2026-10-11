#!/usr/bin/env bash
# P1 container E2E: regenerates artifacts/p1/ from scratch. Exit 0 = every check passed.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=.build/release/coreader
OUT=artifacts/p1
TMP=build/p1
PROFILE=Fixtures/private/profile
fail=0
bad() { echo "FAIL: $*"; fail=1; }

swift build -c release 2>&1 | tail -1
rm -rf "$OUT" "$TMP"; mkdir -p "$OUT/books" "$TMP"

# Every spine/TOC/cover path the reader resolved must be a ZIP entry.
check_paths() { # epub json
  local entries; entries=$(unzip -Z1 "$1")
  [[ $(jq '.spine | length' "$2") -gt 0 ]] || bad "$1: empty spine"
  [[ $(jq '.toc | length' "$2") -gt 0 ]] || bad "$1: empty toc"
  local p
  while read -r p; do
    grep -qxF "$p" <<< "$entries" || bad "$1: resolved path not in ZIP: $p"
  done < <(jq -r '.spine[], (.toc | .. | objects | .path? // empty), (.cover // empty)' "$2" | sort -u)
}

echo "== real books (open, every resolved path exists)"
[[ -d "$PROFILE" ]] || { echo "Fixtures/private missing — see Fixtures/README.md" >&2; exit 1; }
for f in "$PROFILE"/*.epub Fixtures/private/k0*.epub; do
  name=$(basename "$f" .epub) json="$OUT/books/$name.json"
  "$BIN" book "$f" > "$json" || bad "$name refused: $(cat "$json")"
  check_paths "$f" "$json"
  printf '%-28s spine %3d  toc %3d  openMs %s\n' "$name" "$(jq '.spine|length' "$json")" "$(jq '.toc|length' "$json")" "$(jq .openMs "$json")"
done

echo "== synthetic books (§9 refusals; odd-but-valid packaging opens)"
# make_book dir version layout nav-props → writes $TMP/<dir>.epub
make_book() {
  local d=$TMP/$1 version=$2 layout=$3 navprops=$4
  mkdir -p "$d/META-INF" "$d/OPS/text dir"
  printf 'application/epub+zip' > "$d/mimetype"
  cat > "$d/META-INF/container.xml" <<'X'
<?xml version="1.0"?><container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container"><rootfiles><rootfile full-path="OPS/pkg.opf" media-type="application/oebps-package+xml"/></rootfiles></container>
X
  cat > "$d/OPS/pkg.opf" <<X
<?xml version="1.0"?><package xmlns="http://www.idpf.org/2007/opf" version="$version" unique-identifier="id"><metadata xmlns:dc="http://purl.org/dc/elements/1.1/"><dc:identifier id="id">urn:x:1</dc:identifier><dc:title>Sample</dc:title><dc:language>vi</dc:language>$layout</metadata>
<manifest><item id="nav" href="nav.xhtml" media-type="application/xhtml+xml" $navprops/><item id="c1" href="text%20dir/c1.xhtml" media-type="application/xhtml+xml"/></manifest><spine><itemref idref="c1"/></spine></package>
X
  cat > "$d/OPS/nav.xhtml" <<'X'
<?xml version="1.0" encoding="UTF-8"?><html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"><body><nav epub:type="toc"><ol><li><a href="text%20dir/c1.xhtml">Một</a><ol><li><a href="./text%20dir/../text%20dir/c1.xhtml#s2">Hai</a></li></ol></li></ol></nav></body></html>
X
  printf '<?xml version="1.0" encoding="UTF-8"?><html xmlns="http://www.w3.org/1999/xhtml"><body><p>Xin chào.</p><p id="s2">Hai.</p></body></html>' > "$d/OPS/text dir/c1.xhtml"
  (cd "$d" && rm -f "../$1.epub" && zip -X0q "../$1.epub" mimetype && zip -X9qr "../$1.epub" META-INF OPS)
}
expect_refused() { # name message-fragment
  local out code=0
  out=$("$BIN" book "$TMP/$1.epub") || code=$?
  echo "$1: exit $code, $out"
  [[ $code -eq 2 && $out == *"$2"* ]] || bad "$1: expected refusal containing \"$2\""
}

make_book ok 3.0 '' 'properties="nav"'
"$BIN" book "$TMP/ok.epub" > "$OUT/synthetic-ok.json" || bad "ok refused"
check_paths "$TMP/ok.epub" "$OUT/synthetic-ok.json"
[[ $(jq -r '.toc[0].children[0] | "\(.title)|\(.path)#\(.fragment)"' "$OUT/synthetic-ok.json") == 'Hai|OPS/text dir/c1.xhtml#s2' ]] \
  || bad "ok: nested TOC entry not resolved"
echo "ok: opens, nested TOC resolved"

make_book epub2 2.0 '' 'properties="nav"';                                                   expect_refused epub2 "EPUB 2.0 is not supported"
make_book fxl 3.0 '<meta property="rendition:layout">pre-paginated</meta>' 'properties="nav"'; expect_refused fxl "fixed-layout"
make_book nonav 3.0 '' '';                                                                    expect_refused nonav "no navigation document"
make_book enc 3.0 '' 'properties="nav"'
printf '<encryption xmlns="urn:oasis:names:tc:opendocument:xmlns:container"/>' > "$TMP/enc/META-INF/encryption.xml"
(cd "$TMP/enc" && zip -X9qr ../enc.epub META-INF/encryption.xml);                             expect_refused enc "encrypted"
printf 'not a zip' > "$TMP/garbage.epub"
code=0; "$BIN" book "$TMP/garbage.epub" > /dev/null 2>&1 || code=$?
[[ $code -ne 0 && $code -ne 2 ]] || bad "garbage: expected a plain error, got exit $code"
echo "garbage: error exit $code"

echo "== chapter from the ZIP = chapter from extracted files"
mkdir -p "$TMP/x"; unzip -oq "$PROFILE/bien-than.profile.epub" -d "$TMP/x"
c04=$(jq '.spine | index("OEBPS/text/c04.xhtml")' "$OUT/books/bien-than.profile.json")
"$BIN" paginate --epub "$PROFILE/bien-than.profile.epub" --spine "$c04" --user-css Fixtures/spike/reader.css --out-dir "$OUT/zip-c04" --check
"$BIN" paginate "$TMP/x/OEBPS/text/c04.xhtml" --user-css Fixtures/spike/reader.css --out-dir "$TMP/file-c04" > /dev/null
for j in pages.json lines.json; do cmp -s "$OUT/zip-c04/$j" "$TMP/file-c04/$j" || bad "c04 $j differs ZIP vs extracted"; done
"$BIN" verify-resume --epub "$PROFILE/bien-than.profile.epub" --spine "$c04" --user-css Fixtures/spike/reader.css \
  --pages "$OUT/zip-c04/pages.json" --lines "$OUT/zip-c04/lines.json"

echo "== reopen from the ZIP (reference only): median of 5 fresh processes"
runs=()
for k in 1 2 3 4 5; do
  runs+=("$("$BIN" bench --epub "$PROFILE/bien-than.profile.epub" --spine "$c04" --user-css Fixtures/spike/reader.css --pages "$OUT/zip-c04/pages.json" --cold | sed 's/.*: \([0-9.]*\)}/\1/')")
done
median=$(printf '%s\n' "${runs[@]}" | sort -n | sed -n 3p)
echo "{\"chapter\":\"bien-than/c04\",\"source\":\"zip\",\"reopenMsRuns\":[$(IFS=,; echo "${runs[*]}")],\"reopenMsMedian\":$median}" > "$OUT/bench.json"
echo "reopenMs median $median (runs ${runs[*]})"

[[ $fail -eq 0 ]] && echo "P1 E2E: PASS" || { echo "P1 E2E: FAIL"; exit 1; }
