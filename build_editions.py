# build_editions.py — Etymologiae MMXXVI: EPUB 3 + press-ready 6x9 PDF (via Typst)
# Parses index.html + annexus.html, emits editions/etymologiae-mmxxvi.epub,
# editions/cover.png, and typ/ sources compiled to editions/etymologiae-mmxxvi-6x9.pdf.
import re, os, io, html, uuid, zipfile, datetime

ROOT = os.path.dirname(os.path.abspath(__file__))
TYPD = os.path.join(ROOT, "typ")
OUTD = os.path.join(ROOT, "editions")
os.makedirs(TYPD, exist_ok=True)
os.makedirs(OUTD, exist_ok=True)

with io.open(os.path.join(ROOT, "index.html"), encoding="utf-8") as f:
    SRC = f.read()
with io.open(os.path.join(ROOT, "annexus.html"), encoding="utf-8") as f:
    ANN = f.read()

# ---------------------------------------------------------------- parsing
def strip_tags(s):
    return html.unescape(re.sub(r"<[^>]+>", "", s)).strip()

def parse_verse(vhtml):
    """Return list of ('canto', text) / ('stanza', [line, ...]) preserving order."""
    items = []
    for m in re.finditer(r'<p class="(canto|stanza)">(.*?)</p>', vhtml, re.S):
        kind, body = m.group(1), m.group(2)
        if kind == "canto":
            items.append(("canto", body.strip()))
        else:
            lines = [ln.strip() for ln in body.split("\n")]
            items.append(("stanza", [ln for ln in lines if ln != ""]))
    return items

def parse_books():
    books = []
    for sm in re.finditer(r'<section class="liber" id="liber-(\d+)">(.*?)</section>', SRC, re.S):
        n, body = int(sm.group(1)), sm.group(2)
        b = {"n": n}
        b["num"] = strip_tags(re.search(r'<p class="liber-num">(.*?)</p>', body, re.S).group(1))
        b["titulus"] = strip_tags(re.search(r'<h2 class="titulus">(.*?)</h2>', body, re.S).group(1))
        b["gloss"] = strip_tags(re.search(r'<p class="gloss">(.*?)</p>', body, re.S).group(1))
        b["fontes"] = strip_tags(re.search(r'<p class="fontes">(.*?)</p>', body, re.S).group(1))
        b["argumentum"] = re.search(r'<p class="argumentum">(.*?)</p>', body, re.S).group(1).strip()
        cap = re.search(r'<ol class="capitula">(.*?)</ol>', body, re.S).group(1)
        b["capitula"] = [strip_tags(li) for li in re.findall(r"<li[^>]*>(.*?)</li>", cap, re.S)]
        b["carmina"] = []
        for cm in re.finditer(r'<div class="carmen" id="(liber-\d+-cap-\d+)">(.*?)</div>\s*</div>\s*(?=<div class="carmen"|\Z)', body, re.S):
            cid, cbody = cm.group(1), cm.group(2)
            c = {"id": cid}
            c["num"] = strip_tags(re.search(r'<p class="carmen-num">(.*?)</p>', cbody, re.S).group(1))
            c["title"] = strip_tags(re.search(r"<h3>(.*?)</h3>", cbody, re.S).group(1))
            c["scriba"] = strip_tags(re.search(r'<p class="scriba">(.*?)</p>', cbody, re.S).group(1))
            vs = re.search(r'<div class="verse">(.*)', cbody, re.S).group(1)
            c["verse"] = parse_verse(vs)
            b["carmina"].append(c)
        books.append(b)
    return books

def parse_front():
    pr = re.search(r'<section class="praefatio">(.*?)</section>', SRC, re.S).group(1)
    paras = re.findall(r"<p>(.*?)</p>", pr, re.S)
    app = re.search(r'<div class="apparatus-note">(.*?)</div>', pr, re.S).group(1).strip()
    colo = re.search(r'<footer class="colophon">(.*?)</footer>', SRC, re.S).group(1)
    colo = re.sub(r'<span class="mark">.*?</span>', "", colo, flags=re.S).strip()
    return [p.strip() for p in paras], app, colo

def parse_annexus():
    reg = re.search(r'<p class="regula">(.*?)</p>', ANN, re.S).group(1).strip()
    entries = []
    for em in re.finditer(r'<div class="entry">(.*?)</div>', ANN, re.S):
        eb = em.group(1)
        letter = strip_tags(re.search(r'<p class="letter">(.*?)</p>', eb, re.S).group(1))
        paras = re.findall(r"<p>(?!<)(.*?)</p>", eb.replace('<p class="letter">%s</p>' % letter, ""), re.S)
        paras = [p.strip() for p in re.findall(r"<p>((?:(?!class=\"letter\").)*?)</p>", eb, re.S)
                 if 'class="letter"' not in p and strip_tags(p)]
        entries.append({"letter": letter, "paras": paras})
    return reg, entries

BOOKS = parse_books()
PRAEF, APPARATUS, COLOPHON = parse_front()
REGULA, ANNEX = parse_annexus()
n_carmina = sum(len(b["carmina"]) for b in BOOKS)
print(f"parsed: {len(BOOKS)} books, {n_carmina} carmina, {len(ANNEX)} annexus entries")

# ---------------------------------------------------------------- inline conversion
def inline_xhtml(s):
    """HTML inline fragment -> XHTML for EPUB, rewriting internal hrefs."""
    def href_fix(m):
        h = m.group(1)
        bm = re.match(r"#liber-(\d+)$", h)
        cm = re.match(r"#liber-(\d+)-cap-(\d+)$", h)
        if cm:
            return 'href="liber-%02d.xhtml#liber-%s-cap-%s"' % (int(cm.group(1)), cm.group(1), cm.group(2))
        if bm:
            return 'href="liber-%02d.xhtml"' % int(bm.group(1))
        if h == "annexus.html":
            return 'href="annexus.xhtml"'
        return m.group(0)
    s = re.sub(r'href="([^"]+)"', href_fix, s)
    return s

def inline_typst(s):
    """HTML inline fragment -> Typst markup (links flattened to text)."""
    s = re.sub(r"<a [^>]*>(.*?)</a>", r"\1", s, flags=re.S)
    parts = re.split(r"(<i>|</i>|<b>|</b>)", s)
    out, mode = [], []
    def esc(t):
        t = html.unescape(t)
        for ch in "\\#$[]*_`@<>~":
            t = t.replace(ch, "\\" + ch)
        return t
    for p in parts:
        if p == "<i>":
            out.append("#emph[")
        elif p == "</i>":
            out.append("]")
        elif p == "<b>":
            out.append("#strong[")
        elif p == "</b>":
            out.append("]")
        else:
            out.append(esc(p))
    return "".join(out)

# ---------------------------------------------------------------- EPUB
CSS = """
body { font-family: serif; line-height: 1.5; }
h1, h2, h3 { font-weight: normal; }
.liber-num, .carmen-num { color: #9E2B25; font-variant: small-caps; letter-spacing: 0.08em; margin-bottom: 0; }
h1.titulus { font-size: 1.9em; margin: 0.1em 0 0.2em; }
.gloss { font-style: italic; margin-top: 0; }
.fontes { font-size: 0.85em; color: #6b6357; }
.argumentum { font-style: italic; border-left: 2px solid #9E2B25; padding-left: 0.8em; margin: 1.2em 0; }
ol.capitula { font-size: 0.95em; }
ol.capitula a { color: inherit; text-decoration: none; }
.carmen { margin: 2.5em 0; }
h3.carmen-title { font-size: 1.2em; margin: 0 0 0.1em; }
.scriba { font-size: 0.85em; font-style: italic; color: #6b6357; margin-top: 0; }
.canto { color: #9E2B25; font-variant: small-caps; margin: 1.2em 0 0.4em; }
p.vl { margin: 0; padding-left: 1.5em; text-indent: -1.5em; }
p.vl.sb { margin-top: 0.85em; }
a.xref { color: inherit; text-decoration: none; border-bottom: 1px dotted #9E2B25; }
.letter { color: #9E2B25; font-size: 1.4em; margin: 1.4em 0 0.2em; }
.lemma { font-variant: small-caps; }
.apparatus { font-size: 0.9em; background: #00000010; padding: 0.7em 1em; }
.tp { text-align: center; margin-top: 18%; }
.tp h1 { font-size: 2.6em; letter-spacing: 0.04em; margin-bottom: 0; }
.tp .yr { color: #9E2B25; font-size: 1.4em; letter-spacing: 0.35em; }
.colophon { font-style: italic; margin-top: 3em; }
"""

def xhtml_doc(title, body):
    return f"""<?xml version="1.0" encoding="utf-8"?>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops" xml:lang="en">
<head><title>{html.escape(title)}</title><link rel="stylesheet" type="text/css" href="style.css"/></head>
<body>
{body}
</body>
</html>"""

def verse_xhtml(verse):
    out = []
    ital = False  # italic run continuing from a previous line
    for kind, val in verse:
        if kind == "canto":
            out.append(f'<p class="canto">{inline_xhtml(val)}</p>')
        else:
            for i, ln in enumerate(val):
                cls = "vl sb" if i == 0 else "vl"
                body = inline_xhtml(ln)
                if ital:
                    body = "<i>" + body
                depth = body.count("<i>") - body.count("</i>")
                if depth > 0:
                    body += "</i>" * depth
                    ital = True
                else:
                    ital = False
                out.append(f'<p class="{cls}">{body}</p>')
    return "\n".join(out)

def build_epub():
    files = {}
    files["OEBPS/style.css"] = CSS
    # title page
    files["OEBPS/titlepage.xhtml"] = xhtml_doc("Etymologiae MMXXVI", f"""
<div class="tp">
<h1>ETYMOLOGIAE</h1>
<p class="yr">MMXXVI</p>
<p><i>The twenty books, brought up to the present year — every chapter in verse.</i></p>
<p>After Isidore of Seville<br/>bishop, compiler, d. 636</p>
<p style="margin-top:3em; font-size:0.9em;">scripserunt Sonnet · Opus · Haiku<br/>compiled by spinchange</p>
</div>""")
    # praefatio
    pb = "<h2>Praefatio</h2>\n" + "\n".join(f"<p>{inline_xhtml(p)}</p>" for p in PRAEF)
    pb += f'\n<div class="apparatus">{inline_xhtml(APPARATUS)}</div>'
    files["OEBPS/praefatio.xhtml"] = xhtml_doc("Praefatio", pb)
    # books
    for b in BOOKS:
        cap = "\n".join(f"<li>{html.escape(t)}</li>" for t in b["capitula"])
        parts = [f"""<section id="liber-{b['n']}">
<p class="liber-num">{html.escape(b['num'])}</p>
<h1 class="titulus">{html.escape(b['titulus'])}</h1>
<p class="gloss">{html.escape(b['gloss'])}</p>
<p class="fontes">{html.escape(b['fontes'])}</p>
<p class="argumentum">{inline_xhtml(b['argumentum'])}</p>
<ol class="capitula">
{cap}
</ol>"""]
        for c in b["carmina"]:
            parts.append(f"""<div class="carmen" id="{c['id']}">
<p class="carmen-num">{html.escape(c['num'])}</p>
<h3 class="carmen-title">{html.escape(c['title'])}</h3>
<p class="scriba">{html.escape(c['scriba'])}</p>
{verse_xhtml(c['verse'])}
</div>""")
        parts.append("</section>")
        files[f"OEBPS/liber-{b['n']:02d}.xhtml"] = xhtml_doc(f"{b['num']} · {b['titulus']}", "\n".join(parts))
    # annexus
    ab = ['<h1 class="titulus">Annexus Alphabeticus</h1>',
          f'<p class="argumentum">{inline_xhtml(REGULA)}</p>']
    for e in ANNEX:
        ab.append(f'<p class="letter">{html.escape(e["letter"])}</p>')
        for p in e["paras"]:
            ab.append(f"<p>{inline_xhtml(p)}</p>")
    files["OEBPS/annexus.xhtml"] = xhtml_doc("Annexus Alphabeticus", "\n".join(ab))
    # colophon
    files["OEBPS/colophon.xhtml"] = xhtml_doc("Colophon",
        f'<p class="colophon">&#10087; {inline_xhtml(COLOPHON)}</p>'
        f'<p class="colophon">This edition was composed in verse by dispatched scribe-engines — Sonnet, Opus, and Haiku — '
        f'under an editorial bench, in the year 2026. The living text resides at '
        f'<a href="https://spinchange.github.io/etymologiae/">spinchange.github.io/etymologiae</a>.</p>')
    # cover
    files["OEBPS/cover.xhtml"] = xhtml_doc("Cover",
        '<div style="text-align:center;"><img src="cover.png" alt="Etymologiae MMXXVI" style="max-width:100%; height:auto;"/></div>')
    # nav
    booklis = []
    for b in BOOKS:
        chlis = "\n".join(
            f'<li><a href="liber-{b["n"]:02d}.xhtml#{c["id"]}">{html.escape(c["title"])}</a></li>'
            for c in b["carmina"])
        booklis.append(f'<li><a href="liber-{b["n"]:02d}.xhtml">{html.escape(b["num"])} · {html.escape(b["titulus"])}</a>\n<ol>\n{chlis}\n</ol>\n</li>')
    nav = f"""<nav epub:type="toc" id="toc"><h1>Index Librorum</h1>
<ol>
<li><a href="titlepage.xhtml">Title</a></li>
<li><a href="praefatio.xhtml">Praefatio</a></li>
{chr(10).join(booklis)}
<li><a href="annexus.xhtml">Annexus Alphabeticus</a></li>
<li><a href="colophon.xhtml">Colophon</a></li>
</ol></nav>"""
    files["OEBPS/nav.xhtml"] = xhtml_doc("Contents", nav)
    # opf
    uid = uuid.uuid5(uuid.NAMESPACE_URL, "https://spinchange.github.io/etymologiae/")
    now = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
    spine_ids, manifest = [], []
    order = (["cover", "titlepage", "praefatio"] +
             [f"liber-{b['n']:02d}" for b in BOOKS] + ["annexus", "colophon"])
    manifest.append('<item id="nav" href="nav.xhtml" media-type="application/xhtml+xml" properties="nav"/>')
    manifest.append('<item id="css" href="style.css" media-type="text/css"/>')
    manifest.append('<item id="coverimg" href="cover.png" media-type="image/png" properties="cover-image"/>')
    for oid in order:
        manifest.append(f'<item id="{oid}" href="{oid}.xhtml" media-type="application/xhtml+xml"/>')
        spine_ids.append(f'<itemref idref="{oid}"/>')
    opf = f"""<?xml version="1.0" encoding="utf-8"?>
<package xmlns="http://www.idpf.org/2007/opf" version="3.0" unique-identifier="uid" xml:lang="en">
<metadata xmlns:dc="http://purl.org/dc/elements/1.1/">
<dc:identifier id="uid">urn:uuid:{uid}</dc:identifier>
<dc:title>Etymologiae MMXXVI</dc:title>
<dc:language>en</dc:language>
<dc:creator>spinchange, compiler</dc:creator>
<dc:contributor>Sonnet, Opus &amp; Haiku, scribe-engines</dc:contributor>
<dc:description>A twenty-book Etymologies of the present, after Isidore of Seville — all {n_carmina} chapters in verse, each turning on a true etymology.</dc:description>
<dc:date>2026-08-17</dc:date>
<meta property="dcterms:modified">{now}</meta>
</metadata>
<manifest>
{chr(10).join(manifest)}
</manifest>
<spine>
{chr(10).join(spine_ids)}
</spine>
</package>"""
    files["OEBPS/content.opf"] = opf
    files["META-INF/container.xml"] = """<?xml version="1.0" encoding="utf-8"?>
<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container">
<rootfiles><rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/></rootfiles>
</container>"""
    path = os.path.join(OUTD, "etymologiae-mmxxvi.epub")
    with zipfile.ZipFile(path, "w") as z:
        z.writestr("mimetype", "application/epub+zip", compress_type=zipfile.ZIP_STORED)
        for name, content in files.items():
            z.writestr(name, content, compress_type=zipfile.ZIP_DEFLATED)
        z.write(os.path.join(OUTD, "cover.png"), "OEBPS/cover.png")
    print("epub written:", path)

# ---------------------------------------------------------------- Typst book
def verse_typst(verse):
    out = []
    for kind, val in verse:
        if kind == "canto":
            out.append(f"#canto[{inline_typst(val)}]")
        else:
            lines = "\n\n".join(inline_typst(ln) for ln in val)
            out.append(f"#stanza[\n{lines}\n]")
    return "\n".join(out)

def build_typ():
    t = []
    t.append("""// Etymologiae MMXXVI — press interior, 6x9in
#let ink = rgb("26221B")
#let rubric = rgb("9E2B25")
#let faded = rgb("6B6357")

#set document(title: "Etymologiae MMXXVI", author: "spinchange, compiler")
#set text(font: ("Palatino Linotype", "Libertinus Serif"), size: 10.3pt, fill: ink, lang: "en")
#set par(justify: false, leading: 0.62em)
#set page(
  width: 6in, height: 9in,
  margin: (inside: 0.85in, outside: 0.6in, top: 0.72in, bottom: 0.78in),
  binding: left,
  header: context {
    let pg = counter(page).get().first()
    let opens = query(heading.where(level: 1)).filter(h => h.location().page() == here().page())
    let before = query(selector(heading.where(level: 1)).before(here()))
    if opens.len() > 0 or before.len() == 0 { return }
    let book = before.last().body
    set text(size: 8.5pt, fill: faded)
    if calc.odd(pg) {
      grid(columns: (1fr, auto), align: (right, right), column-gutter: 1em,
        smallcaps(book), text(fill: ink)[#pg])
    } else {
      grid(columns: (auto, 1fr), align: (left, left), column-gutter: 1em,
        text(fill: ink)[#pg], smallcaps[Etymologiae MMXXVI])
    }
  },
)
#show heading: set text(weight: "regular")

#let stanza(body) = block(above: 0.9em, below: 0.9em)[
  #set par(hanging-indent: 1.3em, leading: 0.58em, spacing: 0.58em)
  #body
]
#let canto(body) = block(above: 1.1em, below: 0.35em)[
  #text(fill: rubric, size: 9.5pt)[#smallcaps(body)]
]
#let carmenhead(num, title, scriba) = block(breakable: false, above: 2.2em, below: 1.0em, sticky: true)[
  #text(fill: rubric, size: 8.5pt, tracking: 0.08em)[#smallcaps(num)] \\
  #text(size: 12.5pt)[#title] \\
  #text(fill: faded, size: 8.5pt, style: "italic")[#scriba]
]

// ---------- half title ----------
#page(header: none)[
  #v(2.8in)
  #align(center)[#text(size: 17pt, tracking: 0.2em)[ETYMOLOGIAE]]
]
#pagebreak(to: "odd")
// ---------- title page ----------
#page(header: none)[
  #v(1.7in)
  #align(center)[
    #text(size: 30pt, tracking: 0.06em)[ETYMOLOGIAE]
    #v(0.1in)
    #text(size: 15pt, fill: rubric, tracking: 0.45em)[MMXXVI]
    #v(0.45in)
    #emph[The twenty books, brought up to the present year —\\ every chapter in verse.]
    #v(0.45in)
    After Isidore of Seville \\ #text(size: 9pt, fill: faded)[bishop, compiler, d. 636]
    #v(1.15in)
    #text(size: 9.5pt)[scripserunt #smallcaps[Sonnet] · #smallcaps[Opus] · #smallcaps[Haiku]] \\
    #text(size: 9.5pt, fill: faded)[compiled by spinchange]
  ]
]
// ---------- copyright / colophon-recto ----------
#page(header: none)[
  #v(1fr)
  #set text(size: 8.5pt, fill: faded)
  Compiled in the year MMXXVI. \\
  Set in Palatino, in six inches by nine. \\
  The living text, anchor-linked, resides at \\ spinchange.github.io\\/etymologiae \\
  #v(0.2in)
  Every chapter turns on at least one true etymology; \\ disputes are confessed, folk derivations debunked.
]
""")
    # praefatio
    t.append('#pagebreak(to: "odd")')
    t.append('#block(above: 0.5em)[#text(size: 16pt)[Praefatio]]')
    for p in PRAEF:
        t.append("")
        t.append("#par(first-line-indent: 0em)[" + inline_typst(p) + "]")
    t.append("")
    t.append("#block(above: 1.4em, inset: 0.8em, stroke: (left: 1.5pt + rubric))[#set text(size: 9pt)\n" + inline_typst(APPARATUS) + "]")
    # index librorum
    t.append('#pagebreak(to: "odd")')
    t.append('#block[#text(size: 16pt)[Index Librorum]]')
    t.append("#v(0.8em)")
    for b in BOOKS:
        t.append(f'#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), '
                 f'text(fill: rubric)[{inline_typst(b["num"].replace("Liber ", ""))}], '
                 f'[{inline_typst(b["titulus"])} #text(fill: faded, size: 8.5pt)[ — {inline_typst(b["gloss"])}]], '
                 f'text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk{b["n"]}")).first()])')
    # books
    for b in BOOKS:
        t.append('#pagebreak(to: "odd")')
        t.append(f'#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[{inline_typst(b["num"])}]] #label("bk{b["n"]}")]')
        t.append(f'= {inline_typst(b["titulus"])}')
        t.append(f'#text(style: "italic")[{inline_typst(b["gloss"])}]')
        t.append("")
        t.append(f'#text(size: 8.5pt, fill: faded)[{inline_typst(b["fontes"])}]')
        t.append("")
        t.append(f'#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[{inline_typst(b["argumentum"])}]]')
        t.append("#v(0.9em)")
        caps = "\n".join(f"+ {inline_typst(c)}" for c in b["capitula"])
        t.append("#block[#set text(size: 9pt)\n#set enum(numbering: \"1.\", tight: false, spacing: 0.55em)\n" + caps + "\n]")
        for c in b["carmina"]:
            t.append("")
            t.append(f'#carmenhead([{inline_typst(c["num"])}], [{inline_typst(c["title"])}], [{inline_typst(c["scriba"])}])')
            t.append(verse_typst(c["verse"]))
    # annexus
    t.append('#pagebreak(to: "odd")')
    t.append('= Annexus Alphabeticus')
    t.append('#text(style: "italic")[Word-histories, A to Z]')
    t.append("")
    t.append('#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#set text(size: 9pt)\n' + inline_typst(REGULA) + "\n]")
    for e in ANNEX:
        t.append(f'#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[{inline_typst(e["letter"])}]]')
        for p in e["paras"]:
            t.append("")
            t.append("#par(first-line-indent: 0em)[" + inline_typst(p) + "]")
    # colophon
    t.append('#pagebreak(to: "odd")')
    t.append("#v(1fr)")
    t.append('#align(center)[#text(fill: rubric)[❧]]')
    t.append("#v(0.5em)")
    t.append("#par(first-line-indent: 0em)[#emph[" + inline_typst(COLOPHON) + "]]")
    t.append("#v(1.6fr)")
    with io.open(os.path.join(TYPD, "book.typ"), "w", encoding="utf-8") as f:
        f.write("\n".join(t))
    print("typst book source written")

# ---------------------------------------------------------------- cover (CLI splash x scriptorium)
def build_cover_typ():
    guilds = [
        ("✔", "sonnet", "sonnets, pairs & triptychs", "82"),
        ("✔", "opus", "heroic couplets & blank verse", "127"),
        ("✔", "haiku", "haibun, strict 5-7-5", "9"),
    ]
    rows = "\n".join(
        f'  #row(mark: "{m}", name: "{n}", desc: "{d}", ct: "{ct}")' for m, n, d, ct in guilds)
    cov = f"""// cover.typ — CLI splash x scriptorium, 6x9
#let bg = rgb("1E1A15")
#let cream = rgb("E6DFD1")
#let rubric = rgb("D97F6F")
#let dim = rgb("8A8071")
#set page(width: 6in, height: 9in, margin: 0in, fill: bg)
#set text(font: ("Cascadia Mono", "Consolas", "Segoe UI Symbol"), fill: cream, size: 10pt)

#let row(mark: "", name: "", desc: "", ct: "") = {{
  grid(columns: (1.4em, 5.4em, 1fr, auto), align: (left, left, left, right),
    text(fill: rubric)[#mark], text(fill: cream)[#name],
    text(fill: dim)[#desc], text(fill: dim)[#ct])
}}

#place(top + left, dx: 0.55in, dy: 0.5in)[
  #box(width: 4.9in)[
    #text(fill: dim, size: 8.5pt)[╭── scriptorium · mmxxvi ─────────────────────────── v. XX.xii ─╮]
    #v(0.28in)
    #align(center)[
      #text(size: 34pt, tracking: 0.04em, fill: cream)[ETYMOLOGIAE]
      #v(-0.06in)
      #text(size: 13.5pt, fill: rubric, tracking: 0.52em)[M M X X V I]
      #v(0.10in)
      #text(size: 8.5pt, fill: dim)[after Isidore of Seville · bishop, compiler, d. 636]
    ]
    #v(0.32in)
    #text(fill: rubric)[\\$] #text(fill: cream)[dispatch] #text(fill: dim)[--libri 20 --carmina 218 --in verse]
    #v(0.16in)
{rows}
  #row(mark: "✔", name: "bench", desc: "editorial audit · every line-end", ct: "xxiv")
  #row(mark: "⣿", name: "regula", desc: "etymologiae verae · disputes confessed", ct: "✓")
  #row(mark: "❧", name: "anchors", desc: "omnia inter se ligata", ct: "77")
    #v(0.24in)
    #text(fill: dim, size: 8.5pt)[
      ├─ liber I · mathematica #h(1fr) liber XV · de sacris ─┤ \\
      ├─ liber X · vita · bestiae #h(1fr) liber XVIII · historia ─┤ \\
      └─ liber XIII · lingua #h(1fr) liber XX · machinae loquentes ─┘
    ]
    #v(0.30in)
    #align(center)[#text(fill: rubric, size: 13pt)[❧]]
    #v(0.06in)
    #align(center)[#text(fill: dim, size: 8pt)[the tail of the tree returns to its head]]
    #v(0.28in)
    #text(fill: dim, size: 8.5pt)[╰── scripserunt sonnet · opus · haiku ───────── compiled by spinchange ─╯]
  ]
]
"""
    with io.open(os.path.join(TYPD, "cover.typ"), "w", encoding="utf-8") as f:
        f.write(cov)
    print("cover source written")

build_typ()
build_cover_typ()
print("done generating sources")
