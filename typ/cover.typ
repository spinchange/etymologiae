// cover.typ — CLI splash x scriptorium, 6x9
#let bg = rgb("1E1A15")
#let cream = rgb("E6DFD1")
#let rubric = rgb("D97F6F")
#let dim = rgb("8A8071")
#set page(width: 6in, height: 9in, margin: 0in, fill: bg)
#set text(font: ("Cascadia Mono", "Consolas", "Segoe UI Symbol"), fill: cream, size: 10pt)

#let row(mark: "", name: "", desc: "", ct: "") = {
  grid(columns: (1.4em, 5.4em, 1fr, auto), align: (left, left, left, right),
    text(fill: rubric)[#mark], text(fill: cream)[#name],
    text(fill: dim)[#desc], text(fill: dim)[#ct])
}

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
    #text(fill: rubric)[\$] #text(fill: cream)[dispatch] #text(fill: dim)[--libri 20 --carmina 218 --in verse]
    #v(0.16in)
  #row(mark: "✔", name: "sonnet", desc: "sonnets, pairs & triptychs", ct: "82")
  #row(mark: "✔", name: "opus", desc: "heroic couplets & blank verse", ct: "127")
  #row(mark: "✔", name: "haiku", desc: "haibun, strict 5-7-5", ct: "9")
  #row(mark: "✔", name: "bench", desc: "editorial audit · every line-end", ct: "xxiv")
  #row(mark: "⣿", name: "regula", desc: "etymologiae verae · disputes confessed", ct: "✓")
  #row(mark: "❧", name: "anchors", desc: "omnia inter se ligata", ct: "77")
    #v(0.24in)
    #text(fill: dim, size: 8.5pt)[
      ├─ liber I · mathematica #h(1fr) liber XV · de sacris ─┤ \
      ├─ liber X · vita · bestiae #h(1fr) liber XVIII · historia ─┤ \
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
