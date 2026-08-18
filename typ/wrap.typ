// Etymologiae MMXXVI — cover system (CLI splash x scriptorium)
#let bg = rgb("1E1A15")
#let cream = rgb("E6DFD1")
#let rubric = rgb("D97F6F")
#let dim = rgb("8A8071")
#set text(font: ("Cascadia Mono", "Consolas", "Segoe UI Symbol"), fill: cream, size: 10pt)

#let row(mark: "", name: "", desc: "", ct: "") = {
  grid(columns: (1.4em, 5.4em, 1fr, auto), align: (left, left, left, right),
    text(fill: rubric)[#mark], text(fill: cream)[#name],
    text(fill: dim)[#desc], text(fill: dim)[#ct])
}

#let rule-line(lft, rgt) = grid(
  columns: (auto, 1fr, auto),
  align: (left + horizon, horizon, right + horizon),
  text(fill: dim, size: 8.5pt)[#lft],
  box(clip: true, height: 1em, align(horizon, text(fill: dim, size: 8.5pt)[#repeat([─], gap: 0pt)])),
  text(fill: dim, size: 8.5pt)[#rgt],
)
#set document(title: "Etymologiae MMXXVI — paperback wrap")
#set page(width: 13.055in, height: 9.25in, margin: 0in, fill: bg)

// back cover (left panel); lower right of this panel left clear for the barcode
#place(top + left, dx: 0.675in, dy: 0.625in)[
  #box(width: 4.9in)[
    #rule-line("╭── de hoc libro ", " nota ─╮")
    #v(0.26in)
    #text(fill: rubric)[\$] #text(fill: cream)[etymologiae] #text(fill: dim)[\-\-about]
    #v(0.12in)
    #block[
      #set text(size: 9pt)
      #set par(leading: 0.6em, spacing: 1.2em)
      Isidore of Seville ordered all knowledge into twenty books, derived every thing from its name, and invented half of the derivations. This edition repeats the gesture fourteen centuries on, with the errors inverted: the books reordered by emergence — mathematics first, the sacred demoted to Book XV, the talking machine last — and every etymology true, or honestly confessed disputed, or famously false and here debunked.

      All 218 chapters are poems. Sonnets and heroic couplets, blank verse and ottava rima, a pantoum for the states of matter, a villanelle whose refrains are copies, terza rima for the earth's interior, haibun for the beasts. They were written by dispatched scribe-engines — #smallcaps[Sonnet], #smallcaps[Opus], and #smallcaps[Haiku] — under an editorial bench that audited every line-end, for a reader at home in both the terminal and the scriptorium.
    ]
    #v(0.22in)
    #block(inset: (left: 0.75em), stroke: (left: 1.5pt + rubric))[
      #set text(size: 9pt)
      #set par(leading: 0.6em)
      Book Twenty, closing where all making stops: \
      a tool that speaks, and does not know it stops. \
      #text(fill: dim, size: 8pt)[— the edition's last lines]
    ]
    #v(0.24in)
    #text(fill: rubric)[\$] #text(fill: cream)[etymologiae] #text(fill: dim)[\-\-serve]
    #v(0.08in)
    #text(fill: dim, size: 9pt)[the living text, every piece anchored to every piece it names:] \
    #text(fill: cream, size: 9.5pt)[spinchange.github.io\/etymologiae]
  ]
]

#place(top + left, dx: 6.125in, dy: 0.125in)[
  #box(width: 0.805in, height: 9in)[
    #align(center + horizon)[
      #rotate(90deg, reflow: true)[
        #text(fill: dim, size: 10pt)[❧]#h(0.35in)#text(size: 13pt, tracking: 0.14em, fill: cream)[ETYMOLOGIAE]#h(0.22in)#text(size: 13pt, tracking: 0.14em, fill: rubric)[MMXXVI]#h(0.35in)#text(fill: dim, size: 10pt)[❧]
      ]
    ]
  ]
]

// front cover (right panel)
#place(top + left, dx: 7.4799999999999995in, dy: 0.625in)[
  #box(width: 4.9in)[
    #rule-line("╭── scriptorium · mmxxvi ", " v. XX.xii ─╮")
    #v(0.28in)
    #align(center)[
      #text(size: 34pt, tracking: 0.04em, fill: cream)[ETYMOLOGIAE]
      #v(-0.06in)
      #text(size: 13.5pt, fill: rubric, tracking: 0.52em)[M M X X V I]
      #v(0.10in)
      #text(size: 8.5pt, fill: dim)[after Isidore of Seville · bishop, compiler, d. 636]
    ]
    #v(0.32in)
    #text(fill: rubric)[\$] #text(fill: cream)[dispatch] #text(fill: dim)[\-\-libri 20 \-\-carmina 218 \-\-in verse]
    #v(0.16in)
  #row(mark: "✔", name: "sonnet", desc: "sonnets, pairs & triptychs", ct: "82")
  #row(mark: "✔", name: "opus", desc: "heroic couplets & blank verse", ct: "127")
  #row(mark: "✔", name: "haiku", desc: "haibun, strict 5-7-5", ct: "9")
  #row(mark: "✔", name: "bench", desc: "editorial audit · every line-end", ct: "xxiv")
  #row(mark: "⣿", name: "regula", desc: "etymologiae verae · disputes confessed", ct: "✓")
  #row(mark: "❧", name: "anchors", desc: "omnia inter se ligata", ct: "77")
    #v(0.17in)
    #text(fill: dim, size: 8pt)[
      #set par(leading: 0.52em)
      ┌─ liber I · mathematica #h(1fr) liber XI · homo ─┐ \
      ├─ liber II · de fortuna #h(1fr) liber XII · mens ─┤ \
      ├─ liber III · de methodo #h(1fr) liber XIII · lingua ─┤ \
      ├─ liber IV · physica #h(1fr) liber XIV · societas ─┤ \
      ├─ liber V · cosmos #h(1fr) liber XV · de sacris ─┤ \
      ├─ liber VI · de elementis #h(1fr) liber XVI · leges et civitas ─┤ \
      ├─ liber VII · terra #h(1fr) liber XVII · oeconomica ─┤ \
      ├─ liber VIII · vita #h(1fr) liber XVIII · historia ─┤ \
      ├─ liber IX · de origine specierum #h(1fr) liber XIX · artes ─┤ \
      └─ liber X · animalia et herbae #h(1fr) liber XX · machinae loquentes ─┘ \
    ]
    #v(0.17in)
    #align(center)[#text(fill: rubric, size: 13pt)[❧]]
    #v(0.05in)
    #align(center)[#text(fill: dim, size: 8pt)[the tail of the tree returns to its head]]
    #v(0.17in)
    #rule-line("╰── scripserunt sonnet · opus · haiku ", " compiled by spinchange ─╯")
  ]
]
