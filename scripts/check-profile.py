#!/usr/bin/env python3
"""Check an EPUB against CoReader EPUB Profile 1.0 (docs/coreader-epub-profile.md).

Usage: scripts/check-profile.py book.epub [...]   exit 0 = conforms
Needs: python3 + lxml.
"""
import posixpath, re, sys, zipfile
from lxml import etree

XH, EP = "http://www.w3.org/1999/xhtml", "http://www.idpf.org/2007/ops"
OPF = {"o": "http://www.idpf.org/2007/opf", "dc": "http://purl.org/dc/elements/1.1/"}
ELEMENTS = {"html", "head", "title", "link", "meta", "body", "section", "div", "p", "h1", "h2", "h3",
            "h4", "h5", "h6", "blockquote", "hr", "figure", "figcaption", "header", "footer", "ul",
            "ol", "li", "span", "a", "em", "i", "strong", "b", "small", "sup", "sub", "br", "img", "aside"}
ATTRS = {"id", "class", "lang", "dir", "href", "src", "alt", "role", "rel", "name", "content", "charset",
         "{http://www.w3.org/XML/1998/namespace}lang", f"{{{EP}}}type"}
PROPS = {"font-family", "font-size", "font-style", "font-weight", "text-align", "text-indent", "line-height",
         "margin", "margin-top", "margin-right", "margin-bottom", "margin-left", "display", "vertical-align",
         "break-before", "page-break-before", "hyphens", "initial-letter"}
FIRST_LETTER_PROPS = {"initial-letter", "font-family", "font-weight", "margin-right"}
IMAGES = {"image/jpeg", "image/png", "image/gif", "image/webp"}
SELECTOR = re.compile(r"^(?:[a-z][a-z0-9]*|\*)?(?:[.#][A-Za-z_][\w-]*)*(?:::first-letter)?$")
UNIT = re.compile(r"^-?(?:\d+|\d*\.\d+)(?:em|rem|%|px|pt)?$")


def check_css(name, css, errors):
    css = re.sub(r"/\*.*?\*/", "", css, flags=re.S)
    for m in re.finditer(r"([^{}]+)\{([^{}]*)\}", css):
        head, body = m.group(1).strip(), m.group(2)
        decls = {d.split(":", 1)[0].strip().lower(): d.split(":", 1)[1].strip()
                 for d in body.split(";") if ":" in d}
        if head.startswith("@"):
            if head != "@font-face":
                errors.append(f"{name}: at-rule {head!r}")
            elif not set(decls) <= {"font-family", "src", "font-weight", "font-style"}:
                errors.append(f"{name}: @font-face descriptors {sorted(set(decls))}")
            continue
        first_letter = "::first-letter" in head
        for sel in head.split(","):
            parts = re.split(r"\s*[>+]\s*|\s+", sel.strip())
            for p in parts:
                if not SELECTOR.match(p):
                    errors.append(f"{name}: selector {sel.strip()!r}")
        allowed = FIRST_LETTER_PROPS if first_letter else PROPS
        for k, v in decls.items():
            if k not in allowed:
                errors.append(f"{name}: property {k!r} in {head!r}")
            if k == "initial-letter" and not re.match(r"^[2-5](\s+\d+)?$", v):
                errors.append(f"{name}: initial-letter {v!r}")
            if k.startswith("margin") or k in ("text-indent", "font-size"):
                for tok in v.replace("!important", "").split():
                    if not (UNIT.match(tok) or tok in ("auto", "smaller", "larger")):
                        errors.append(f"{name}: value {k}: {v!r}")
    leftover = re.sub(r"[^{}]+\{[^{}]*\}", "", css).strip()
    if leftover:
        errors.append(f"{name}: unparsed CSS {leftover[:60]!r} (nested blocks?)")


def check(path):
    errors = []
    z = zipfile.ZipFile(path)
    names = z.namelist()
    if names[0] != "mimetype" or z.read("mimetype") != b"application/epub+zip":
        errors.append("mimetype must be first and exact")
    if "META-INF/encryption.xml" in names:
        errors.append("encryption.xml present")
    cont = etree.fromstring(z.read("META-INF/container.xml"))
    roots = cont.findall(".//{urn:oasis:names:tc:opendocument:xmlns:container}rootfile")
    if len(roots) != 1:
        return [f"container.xml has {len(roots)} rootfiles"]
    opf_path = roots[0].get("full-path")
    base = posixpath.dirname(opf_path)
    opf = etree.fromstring(z.read(opf_path))
    if not opf.get("version", "").startswith("3"):
        errors.append(f"package version {opf.get('version')}")
    for f in ("title", "language", "identifier"):
        if opf.find(f".//dc:{f}", OPF) is None:
            errors.append(f"missing dc:{f}")
    if opf.find(".//o:meta[@property='rendition:layout']", OPF) is not None:
        errors.append("rendition:layout present")
    items = opf.findall(".//o:manifest/o:item", OPF)
    props = lambda i: (i.get("properties") or "").split()
    if sum("nav" in props(i) for i in items) != 1:
        errors.append("need exactly one nav item")
    if sum("cover-image" in props(i) for i in items) > 1:
        errors.append("more than one cover-image")
    if opf.find(".//o:spine[@toc]", OPF) is not None or opf.find(".//o:guide", OPF) is not None:
        errors.append("EPUB 2 legacy (spine@toc / guide)")
    for i in items:
        if i.get("fallback") or "remote-resources" in props(i) or "scripted" in props(i):
            errors.append(f"item {i.get('id')}: fallback/remote/scripted")
        mt, href = i.get("media-type"), posixpath.join(base, i.get("href"))
        if mt.startswith("image/") and mt not in IMAGES:
            errors.append(f"{href}: image type {mt}")
        if mt == "text/css":
            check_css(href, z.read(href).decode("utf-8"), errors)
    for r in opf.findall(".//o:spine/o:itemref", OPF):
        if r.get("linear") == "no":
            errors.append(f"itemref {r.get('idref')} linear=no")
    for i in items:
        if i.get("media-type") != "application/xhtml+xml":
            continue
        href = posixpath.join(base, i.get("href"))
        raw = z.read(href)
        if re.search(rb"&(?!(amp|lt|gt|quot|apos|#\d+|#x[0-9a-fA-F]+);)", raw):
            errors.append(f"{href}: non-XML entity")
        doc = etree.fromstring(raw)
        ids = {e.get("id") for e in doc.iter() if e.get("id")}
        is_nav = "nav" in props(i)
        for e in doc.iter():
            if not isinstance(e.tag, str):
                continue
            q = etree.QName(e)
            if q.namespace != XH or (q.localname not in ELEMENTS and not (is_nav and q.localname == "nav")):
                errors.append(f"{href}: element {q.localname}")
            for k in e.attrib:
                if k not in ATTRS and not (k == "rel" or (k == "hidden" and is_nav)):
                    errors.append(f"{href}: attribute {k} on {q.localname}")
            if q.localname in ("style",) or e.get("style"):
                errors.append(f"{href}: inline style")
            if q.localname == "link" and e.get("rel") != "stylesheet":
                errors.append(f"{href}: link rel={e.get('rel')}")
            t = e.get(f"{{{EP}}}type")
            if t == "noteref":
                h = e.get("href", "")
                if not h.startswith("#") or h[1:] not in ids:
                    errors.append(f"{href}: noteref {h!r} not a same-document fragment")
                elif len("".join(e.itertext()).strip()) > 4:
                    errors.append(f"{href}: noteref mark too long")
            if t == "footnote" and q.localname != "aside":
                errors.append(f"{href}: footnote on {q.localname}")
            if q.localname == "aside" and t != "footnote":
                errors.append(f"{href}: aside without epub:type=footnote")
            if t and t not in ("noteref", "footnote") and not (is_nav and t in ("toc", "landmarks")):
                errors.append(f"{href}: epub:type {t!r}")
    return errors


if __name__ == "__main__":
    bad = 0
    for p in sys.argv[1:]:
        errs = check(p)
        print(f"{'OK  ' if not errs else 'FAIL'} {p}")
        for e in sorted(set(errs))[:40]:
            print("   ", e)
        bad += bool(errs)
    sys.exit(bad)
