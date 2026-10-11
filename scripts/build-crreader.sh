#!/bin/bash
# Builds build/CrReader.app: KOReader's crengine (GPL-2, pinned) + CrReader/main.mm.
# Needs: brew install cmake ninja pkgconf freetype harfbuzz fribidi utf8proc zstd libpng jpeg-turbo xxhash zlib
set -euo pipefail
cd "$(dirname "$0")/.."

CRE_REV=ab1981c22e4e67cf9d98be3c301736941d2d271c # koreader/crengine master, 2026-10-08
SRC=build/src/crengine
UB=build/src/unibreak
LIB=build/crengine
APP=build/CrReader.app
# Homebrew's pkg-config, not whatever else is on PATH (Mono ships one); keg-only zlib; our libunibreak.
export PKG_CONFIG=/opt/homebrew/bin/pkg-config
export PKG_CONFIG_PATH=$PWD/$UB/out:/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/lib/pkgconfig
DEPS="freetype2 harfbuzz fribidi libunibreak libutf8proc libzstd libpng libjpeg zlib libxxhash"

if [[ "$(git -C "$SRC" rev-parse HEAD 2>/dev/null)" != "$CRE_REV" ]]; then
  rm -rf "$SRC"; mkdir -p "$SRC"
  git -C "$SRC" init -q && git -C "$SRC" fetch -q --depth 1 https://github.com/koreader/crengine.git "$CRE_REV" && git -C "$SRC" checkout -q FETCH_HEAD
fi
# libunibreak 7.0 as KOReader ships it: crengine uses its private linebreakdef.h API (gone in 8.0, not installed by Homebrew).
if [[ ! -f "$UB/out/libunibreak.a" ]]; then
  rm -rf "$UB"; mkdir -p "$UB/out"
  curl -fsSL https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_7_0.tar.gz | tar xz -C "$UB" --strip-components 1
  (cd "$UB/out" && for c in ../src/*.c; do [[ $c == */tests.c ]] || clang -O2 -mmacosx-version-min=14.0 -c "$c"; done && ar rcs libunibreak.a ./*.o)
  printf 'Name: libunibreak\nDescription: libunibreak\nVersion: 7.0\nCflags: -I%s\nLibs: -L%s -lunibreak\n' "$PWD/$UB/src" "$PWD/$UB/out" > "$UB/out/libunibreak.pc"
fi

if [[ ! -f "$LIB/build.ninja" ]]; then
  off=(); for f in ANTIWORD CHMLIB FONTCONFIG GIF LIBWEBP LUNASVG MATHML MD4C NANOSVG SRELL STB_IMAGE; do off+=("-D$f=OFF"); done
  on=(); for f in FREETYPE FRIBIDI HARFBUZZ LIBJPEG LIBPNG LIBUNIBREAK UTF8PROC ZLIB ZSTD; do on+=("-D$f=ON"); done
  cmake -S "$SRC" -B "$LIB" -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_OSX_DEPLOYMENT_TARGET=14.0 \
    -DPKG_CONFIG_EXECUTABLE=$PKG_CONFIG "${off[@]}" "${on[@]}" > "$LIB.cmake.log"
fi
cmake --build "$LIB" --target crengine > "$LIB.build.log"

rm -rf "$APP"; mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources/hyph"
cp CrReader/Info.plist "$APP/Contents/"
cp "$SRC"/cr3gui/data/{epub,html5}.css "$APP/Contents/Resources/"
cp "$SRC"/cr3gui/data/hyph/* "$APP/Contents/Resources/hyph/"
# shellcheck disable=SC2046,SC2086
clang++ -std=c++17 -O2 -fobjc-arc -mmacosx-version-min=14.0 \
  -I"$SRC/crengine/include" -I"$LIB" $($PKG_CONFIG --cflags $DEPS) \
  CrReader/main.mm "$LIB/libcrengine.a" $($PKG_CONFIG --libs --static $DEPS) \
  -framework AppKit -framework CoreText -framework UniformTypeIdentifiers -Wl,-w -o "$APP/Contents/MacOS/CrReader"
codesign -s - "$APP" 2>/dev/null
echo "built $APP"
