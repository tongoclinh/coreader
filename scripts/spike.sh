#!/usr/bin/env bash
# P0 spike: regenerates artifacts/spike/ from scratch.
# usage: scripts/spike.sh [dropcaps|footnotes|books|bench|all]   (default: all)
set -euo pipefail
cd "$(dirname "$0")/.."

PART="${1:-all}"
BIN=.build/release
OUT=artifacts/spike
IN=build/spike-input
PROFILE=Fixtures/private/profile

build() { swift build -c release 2>&1 | tail -1; }

need_profile() {
  if [[ ! -d "$PROFILE" ]]; then
    echo "Fixtures/private/profile missing — see Fixtures/README.md" >&2
    return 1
  fi
}

USER_CSS=(--user-css Fixtures/spike/reader.css)

# Extracts a profile EPUB into $2 (webref reads files from disk).
extract() { mkdir -p "$2" && unzip -oq "$PROFILE/$1.profile.epub" -d "$2"; }

# Spine index of a ZIP path in a profile EPUB.
spine() { "$BIN/coreader" book "$PROFILE/$1.profile.epub" | jq ".spine | index(\"$2\")"; }

# WebKit copy of a chapter: webref geometry (frame.css), the book CSS with -webkit-initial-letter, then user CSS (reader.css):
# ours merges user CSS after the book CSS, so the order is the same.
ref_xhtml() { # xhtml css-href reader-href frame-href
  sed -e "s#<link rel=\"stylesheet\" href=\"$2\"/>#<link rel=\"stylesheet\" href=\"$4\"/><link rel=\"stylesheet\" href=\"${2%.css}.ref.css\"/><link rel=\"stylesheet\" href=\"$3\"/>#" "$1" > "${1%.xhtml}.ref.xhtml"
}

# Book stylesheet → WebKit reference: prefixed initial-letter and a red cap.
ref_css() {
  sed -e 's/\([^-]\)initial-letter: \([0-9][0-9 ]*\);/\1-webkit-initial-letter: \2; color: #f00;/' "$1"
}

# One comparison: ours (red cap) vs WebKit, side-by-side PNG and a JSON row.
compare_case() { # name xhtml kind root clip   (webref renders ${xhtml%.xhtml}.ref.xhtml)
  local name=$1 xhtml=$2 kind=$3 root=$4 clip=$5 d=$OUT/dropcap
  "$BIN/coreader" render "$xhtml" "${USER_CSS[@]}" --cap-color red --clip "$clip" \
    --out "$d/raw/$name.ours.png" --geometry "$d/raw/$name.ours.json"
  "$BIN/webref" "${xhtml%.xhtml}.ref.xhtml" --root "$root" --clip "$clip" --out "$d/raw/$name.wk.png" --geometry "$d/raw/$name.wk.json"
  "$BIN/coreader" compare "$d/raw/$name.ours.png" "$d/raw/$name.ours.json" "$d/raw/$name.wk.png" "$d/raw/$name.wk.json" \
    --out "$d/$name.png" --row "$d/raw/$name.row.json" --name "$name" --kind "$kind"
}

FILLER='Buổi chiều hôm ấy, cả xóm nhỏ như chìm trong một màu xám dịu. Tiếng rao của người bán hàng rong vọng lại từ đầu ngõ, lúc gần lúc xa, rồi tắt hẳn khi trời đổ mưa. Lũ trẻ chạy ùa vào hiên nhà, quần áo ướt sũng mà miệng vẫn cười không ngớt. Ông giáo già ở căn nhà cuối dãy pha một ấm trà, ngồi nhìn mưa qua khung cửa sổ, chẳng nói chẳng rằng.'
REST='mưa năm ấy đến sớm hơn thường lệ. Những cơn giông chiều kéo về từ phía biển, quét qua mái ngói rêu phong của dãy phố cũ rồi tan đi rất nhanh, chỉ để lại mùi đất ẩm và những vũng nước nhỏ phản chiếu bầu trời xám bạc. Bà cụ bán chè đầu ngõ vẫn dọn hàng đúng giờ, như thể chẳng có gì trên đời có thể làm bà đổi thói quen đã giữ suốt mấy chục năm.'

dc_case() { # name class first-paragraph-html [second-paragraph-html]
  cat > "$IN/dropcap/$1.xhtml" <<EOF
<?xml version="1.0" encoding="utf-8"?>
<html xmlns="http://www.w3.org/1999/xhtml" lang="vi" xml:lang="vi"><head><title>$1</title>
<link rel="stylesheet" href="plain.css"/></head>
<body><p class="$2">$3</p><p>${4:-$FILLER}</p></body></html>
EOF
  ref_xhtml "$IN/dropcap/$1.xhtml" plain.css reader.css frame.css
}

part_dropcaps() {
  rm -rf "$OUT/dropcap" "$IN/dropcap"
  mkdir -p "$OUT/dropcap/raw" "$IN/dropcap"
  cp Fixtures/spike/frame.css Fixtures/spike/reader.css Fixtures/spike/plain.css "$IN/dropcap/"
  ref_css Fixtures/spike/plain.css > "$IN/dropcap/plain.ref.css"
  dc_case M-2 dc-2 "Mùa $REST"
  dc_case M-3 dc-3 "Mùa $REST"
  dc_case M-5 dc-5 "Mùa $REST"
  dc_case M-3-2 dc-3-2 "Mùa $REST"
  dc_case M-3-em dc-3 "Mùa mưa năm ấy đến <em>sớm hơn thường lệ</em>. Những cơn giông chiều kéo về từ phía biển, quét qua mái ngói rêu phong của <strong>dãy phố cũ</strong> rồi tan đi rất nhanh, chỉ để lại mùi đất ẩm và những vũng nước nhỏ phản chiếu bầu trời xám bạc."
  dc_case D-3 dc-3 "Đợt $REST"
  dc_case U-3 dc-3 "Ừ, mùa $REST"
  dc_case A-3 dc-3 "Ặc, mùa $REST"
  dc_case short-3 dc-3 "Mưa lại về trên phố cũ, nhẹ và dai dẳng như mọi năm, chẳng ai còn buồn để ý đến nó nữa."
  dc_case quote-3 dc-3 "“Mùa $REST"

  local name kind
  for name in M-2 M-3 M-5 M-3-2 M-3-em D-3 U-3 A-3 short-3 quote-3; do
    case $name in U-3|A-3) kind=diacritic ;; *) kind=flat ;; esac
    compare_case "$name" "$IN/dropcap/$name.xhtml" "$kind" "$IN/dropcap" 520
  done

  if need_profile 2>/dev/null; then
    local b
    for b in bien-than nguoi-moi-den; do
      extract "$b" "$IN/dropcap/$b"
      local o="$IN/dropcap/$b/OEBPS"
      ref_css "$o/styles/book.css" > "$o/styles/book.ref.css"
      cp Fixtures/spike/frame.css Fixtures/spike/reader.css "$o/styles/"
    done
    local c04="$IN/dropcap/bien-than/OEBPS/text/c04.xhtml" c03="$IN/dropcap/nguoi-moi-den/OEBPS/text/c03.xhtml"
    ref_xhtml "$c04" ../styles/book.css ../styles/reader.css ../styles/frame.css
    ref_xhtml "$c03" ../styles/book.css ../styles/reader.css ../styles/frame.css
    compare_case bien-than-c04 "$c04" flat "$IN/dropcap/bien-than/OEBPS" 700
    compare_case nguoi-moi-den-c03 "$c03" round "$IN/dropcap/nguoi-moi-den/OEBPS" 700
  else
    echo "skip: book drop caps (Fixtures/private/profile missing — see Fixtures/README.md)"
  fi

  { printf '['; awk 1 "$OUT"/dropcap/raw/*.row.json | paste -sd, -; printf ']\n'; } > "$OUT/dropcap/dropcap.json"
  local bad; bad=$( (grep -l '"pass":false' "$OUT"/dropcap/raw/*.row.json || true) | wc -l | tr -d ' ')
  echo "dropcaps: $(ls "$OUT"/dropcap/raw/*.row.json | wc -l | tr -d ' ') cases, $bad out of tolerance → $OUT/dropcap/"
}

# paginate --check, then rebuild every page from pages.json in a separate process.
paginate_case() { # outdir chapter-args... [-- extra paginate flags]   (chapter: <xhtml> | --epub <file> --spine <N>)
  local dir=$1; shift
  local src=() extra=()
  while [[ $# -gt 0 && $1 != -- ]]; do src+=("$1"); shift; done
  [[ $# -gt 0 ]] && { shift; extra=("$@"); }
  "$BIN/coreader" paginate "${src[@]}" "${USER_CSS[@]}" --out-dir "$dir" --check ${extra[@]+"${extra[@]}"}
  "$BIN/coreader" verify-resume "${src[@]}" "${USER_CSS[@]}" --pages "$dir/pages.json" --lines "$dir/lines.json"
}

part_footnotes() {
  rm -rf "$OUT/footnotes"
  local f
  for f in plain footnote-push footnote-split footnote-edge dropcap-bottom dropcap-bottom-move; do
    echo "== $f"
    if [[ $f == footnote-push ]]; then
      paginate_case "$OUT/footnotes/$f" "Fixtures/spike/$f.xhtml" -- --expect-push
    else
      paginate_case "$OUT/footnotes/$f" "Fixtures/spike/$f.xhtml"
    fi
  done
}

part_books() {
  need_profile
  rm -rf "$OUT/books"
  echo "== bien-than c04"
  paginate_case "$OUT/books/bien-than-c04" --epub "$PROFILE/bien-than.profile.epub" --spine "$(spine bien-than OEBPS/text/c04.xhtml)"
  echo "== nguoi-moi-den c03"
  paginate_case "$OUT/books/nguoi-moi-den-c03" --epub "$PROFILE/nguoi-moi-den.profile.epub" --spine "$(spine nguoi-moi-den OEBPS/text/c03.xhtml)"
}

# reopenMs: median of 5 fresh processes (cold); pageMeanMs: one warm run. Reference numbers only, no targets.
part_bench() {
  need_profile
  rm -rf "$OUT/bench" "$IN/bench"
  mkdir -p "$OUT/bench"
  local rows=() spec book ch src runs median warm k
  for spec in bien-than:c04 bien-than:c26 nguoi-moi-den:c03; do
    book=${spec%%:*} ch=${spec##*:}
    src=(--epub "$PROFILE/$book.profile.epub" --spine "$(spine "$book" "OEBPS/text/$ch.xhtml")" "${USER_CSS[@]}")
    "$BIN/coreader" paginate "${src[@]}" --out-dir "$IN/bench/pages-$book-$ch" > /dev/null
    runs=()
    for k in 1 2 3 4 5; do
      runs+=("$("$BIN/coreader" bench "${src[@]}" --pages "$IN/bench/pages-$book-$ch/pages.json" --cold | sed 's/.*: \([0-9.]*\)}/\1/')")
    done
    median=$(printf '%s\n' "${runs[@]}" | sort -n | sed -n 3p)
    warm=$("$BIN/coreader" bench "${src[@]}" --pages "$IN/bench/pages-$book-$ch/pages.json")
    rows+=("{\"chapter\":\"$book/$ch\",\"bytes\":$(unzip -p "$PROFILE/$book.profile.epub" "OEBPS/text/$ch.xhtml" | wc -c | tr -d ' '),\"reopenMsRuns\":[$(IFS=,; echo "${runs[*]}")],\"reopenMsMedian\":$median,\"warm\":$warm}")
    echo "$book/$ch: reopenMs median $median (runs ${runs[*]}), warm $warm"
  done
  { printf '['; (IFS=,; echo -n "${rows[*]}"); printf ']\n'; } > "$OUT/bench/bench.json"
}

case "$PART" in
  dropcaps) build; part_dropcaps ;;
  footnotes) build; part_footnotes ;;
  books) build; part_books ;;
  bench) build; part_bench ;;
  all)
    build
    part_dropcaps
    part_footnotes
    need_profile
    part_books
    part_bench
    ;;
  *) echo "usage: scripts/spike.sh [dropcaps|footnotes|books|bench|all]" >&2; exit 2 ;;
esac
