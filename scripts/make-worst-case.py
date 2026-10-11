#!/usr/bin/env python3
"""Build Fixtures/private/profile/worst-case.profile.epub from bien-than.profile.epub.

One spine document of ~4 MB (the first spine item, so a fresh open lands on it): bien-than chapter
bodies repeated, with drop caps, the book's own notes, an extra note every 100 paragraphs and a
block image every 200. Ids are prefixed per copy so notes stay unique in the one document.
The text is copyrighted, so the output stays in the git-ignored Fixtures/private/.
Usage: scripts/make-worst-case.py [target MB, default 4]
"""
import re, sys, zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "Fixtures/private/profile/bien-than.profile.epub"
OUT = ROOT / "Fixtures/private/profile/worst-case.profile.epub"
TARGET = float(sys.argv[1] if len(sys.argv) > 1 else 4) * 1_000_000

HEAD = ('<?xml version="1.0" encoding="utf-8"?>\n<html xmlns="http://www.w3.org/1999/xhtml" '
        'xmlns:epub="http://www.idpf.org/2007/ops" lang="vi" xml:lang="vi"><head><title>{t}</title>'
        '<link rel="stylesheet" href="../styles/book.css"/></head><body>\n')

src = zipfile.ZipFile(SRC)
chapters = sorted(n for n in src.namelist() if re.fullmatch(r"OEBPS/text/c\d+\.xhtml", n))
bodies = [re.search(r"<body>(.*)</body>", src.read(n).decode(), re.S).group(1) for n in chapters]

parts, size, copy, paras, notes, images = [], 0, 0, 0, 0, 0

def extra(m):  # after every 100th body paragraph: a note; after every 200th: a block image
    global paras, notes, images
    paras += 1
    s = m.group(0)
    if paras % 100 == 0:
        notes += 1
        s = (f' <a epub:type="noteref" href="#x{notes}">{notes % 1000}</a></p>\n'
             f'  <aside epub:type="footnote" id="x{notes}"><p>Ghi chú thêm số {notes}: một chú thích ngắn để thử '
             f'đặt note ở cuối trang.</p></aside>')
    if paras % 200 == 0:
        images += 1
        s += '\n  <div class="cover"><img src="../images/cover.jpg" alt=""/></div>'
    return s

while size < TARGET:
    copy += 1
    for i, body in enumerate(bodies):
        p = f"w{copy}c{i}-"
        body = re.sub(r'\bid="([^"]+)"', rf'id="{p}\1"', body)
        body = re.sub(r'href="#([^"]+)"', rf'href="#{p}\1"', body)
        body = re.sub(r"</p>(?!\s*</aside>)", extra, body)
        parts.append(body)
        size += len(body.encode())
        if size >= TARGET:
            break

w01 = HEAD.format(t="Worst case") + "".join(parts) + "</body></html>\n"
w02 = HEAD.format(t="Sau") + "<p>Hết.</p></body></html>\n"
opf = src.read("OEBPS/content.opf").decode()
opf = re.sub(r"<dc:identifier([^>]*)>[^<]*", r"<dc:identifier\1>urn:coreader:worst-case", opf)
opf = re.sub(r"<dc:title>[^<]*", "<dc:title>Worst case", opf)
opf = re.sub(r'\s*<item id="(cover|c\d+)" href="text/[^"]+"[^>]*/>', "", opf)
opf = opf.replace('<item id="nav"', '<item id="w01" href="text/w01.xhtml" media-type="application/xhtml+xml"/>\n'
                  '    <item id="w02" href="text/w02.xhtml" media-type="application/xhtml+xml"/>\n    <item id="nav"')
opf = re.sub(r"<spine([^>]*)>.*</spine>", r'<spine\1>\n    <itemref idref="w01"/>\n    <itemref idref="w02"/>\n  </spine>', opf, flags=re.S)
nav = re.sub(r"<ol>.*</ol>", '<ol><li><a href="text/w01.xhtml">Worst case</a></li><li><a href="text/w02.xhtml">Sau</a></li></ol>',
             src.read("OEBPS/nav.xhtml").decode(), count=1, flags=re.S)

with zipfile.ZipFile(OUT, "w") as z:
    z.writestr("mimetype", "application/epub+zip", compress_type=zipfile.ZIP_STORED)
    for n in src.namelist():
        if n == "mimetype" or n.startswith("OEBPS/text/") or n in ("OEBPS/content.opf", "OEBPS/nav.xhtml"):
            continue
        z.writestr(n, src.read(n), compress_type=zipfile.ZIP_DEFLATED)
    for n, s in (("OEBPS/content.opf", opf), ("OEBPS/nav.xhtml", nav), ("OEBPS/text/w01.xhtml", w01), ("OEBPS/text/w02.xhtml", w02)):
        z.writestr(n, s, compress_type=zipfile.ZIP_DEFLATED)

total = w01.count('epub:type="footnote"')
print(f"{OUT.relative_to(ROOT)}: w01 {len(w01.encode()) / 1e6:.2f} MB, {copy} copies of bien-than, "
      f"{paras} paragraphs, {total} notes ({notes} extra), {images} images")
