// Etymologiae MMXXVI — press interior, 6x9in
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
  #text(fill: rubric, size: 8.5pt, tracking: 0.08em)[#smallcaps(num)] \
  #text(size: 12.5pt)[#title] \
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
    #emph[The twenty books, brought up to the present year —\ every chapter in verse.]
    #v(0.45in)
    After Isidore of Seville \ #text(size: 9pt, fill: faded)[bishop, compiler, d. 636]
    #v(1.15in)
    #text(size: 9.5pt)[scripserunt #smallcaps[Sonnet] · #smallcaps[Opus] · #smallcaps[Haiku]] \
    #text(size: 9.5pt, fill: faded)[compiled by spinchange]
  ]
]
// ---------- copyright / colophon-recto ----------
#page(header: none)[
  #v(1fr)
  #set text(size: 8.5pt, fill: faded)
  Compiled in the year MMXXVI. \
  Set in Palatino, in six inches by nine. \
  The living text, anchor-linked, resides at \ spinchange.github.io\/etymologiae \
  #v(0.2in)
  Every chapter turns on at least one true etymology; \ disputes are confessed, folk derivations debunked.
]

#pagebreak(to: "odd")
#block(above: 0.5em)[#text(size: 16pt)[Praefatio]]

#par(first-line-indent: 0em)[Isidore ordered his twenty books by the great chain of being, descending from grammar and God to the utensils of the household. Fourteen centuries broke the chain; what replaced it is emergence. The books below therefore climb — from the rules, through matter and life and mind, to the things mind builds — each standing on the ones before it, ending where the first began: at an instrument that speaks.]

#par(first-line-indent: 0em)[In the manner of the original, chapter titles are claims, not labels: the title tells you what the chapter would have you believe. Also in the manner of the original, the compiler asserts one order for all knowledge and signs his name to it, which is the part of the method fourteen centuries could not improve.]

#block(above: 1.4em, inset: 0.8em, stroke: (left: 1.5pt + rubric))[#set text(size: 9pt)
#strong[Apparatus.] Red is rubric, as in the manuscripts. The bracketed note beneath each title — ⟨ Orig. XVI ⟩ — is a concordance to the book of Isidore's #emph[Origines] from which the new book descends. #strong[⟨ sine fonte ⟩] marks a book with no ancestor: knowledge acquired since 636. The line beneath each chapter — #emph[scripsit Opus · heroic couplets] — names the scribe-engine that wrote it and the meter it was set; every chapter turns on at least one true etymology, disputes confessed, folk derivations debunked.]
#pagebreak(to: "odd")
#block[#text(size: 16pt)[Index Librorum]]
#v(0.8em)
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[I], [Mathematica #text(fill: faded, size: 8.5pt)[ — Number, logic, and proof — the grammar of everything after]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk1")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[II], [De Fortuna #text(fill: faded, size: 8.5pt)[ — Probability, statistics, and the taming of chance]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk2")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[III], [De Methodo #text(fill: faded, size: 8.5pt)[ — Observation, experiment, and the discipline of error]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk3")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[IV], [Physica #text(fill: faded, size: 8.5pt)[ — Matter, energy, and the four forces]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk4")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[V], [Cosmos #text(fill: faded, size: 8.5pt)[ — The universe, from first light to last]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk5")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[VI], [De Elementis #text(fill: faded, size: 8.5pt)[ — Chemistry — the true book of stones and metals]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk6")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[VII], [Terra #text(fill: faded, size: 8.5pt)[ — The earth, its depths, airs, and changing climate]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk7")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[VIII], [Vita #text(fill: faded, size: 8.5pt)[ — The cell, the code, and what alive means]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk8")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[IX], [De Origine Specierum #text(fill: faded, size: 8.5pt)[ — Evolution — the true etymology of living forms]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk9")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[X], [Animalia et Herbae #text(fill: faded, size: 8.5pt)[ — The living catalog, corrected]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk10")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XI], [Homo #text(fill: faded, size: 8.5pt)[ — The body and its repair]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk11")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XII], [Mens #text(fill: faded, size: 8.5pt)[ — Brain, perception, and the observer examined]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk12")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XIII], [Lingua #text(fill: faded, size: 8.5pt)[ — Language, writing, and the word-histories]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk13")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XIV], [Societas #text(fill: faded, size: 8.5pt)[ — Man in the plural]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk14")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XV], [De Sacris #text(fill: faded, size: 8.5pt)[ — The religions of the world]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk15")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XVI], [Leges et Civitas #text(fill: faded, size: 8.5pt)[ — Law, the state, and war]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk16")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XVII], [Oeconomica #text(fill: faded, size: 8.5pt)[ — Money, markets, and the household writ large]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk17")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XVIII], [Historia #text(fill: faded, size: 8.5pt)[ — The record itself, deep past to present hour]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk18")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XIX], [Artes #text(fill: faded, size: 8.5pt)[ — What we make that is not for use]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk19")).first()])
#grid(columns: (2.6em, 1fr, auto), row-gutter: 0.55em, align: (left, left, right), text(fill: rubric)[XX], [Machinae Loquentes #text(fill: faded, size: 8.5pt)[ — Engineering, computation, and the tool that talks]], text(fill: faded, size: 8.5pt)[#context counter(page).at(label("bk20")).first()])
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber I]] #label("bk1")]
= Mathematica
#text(style: "italic")[Number, logic, and proof — the grammar of everything after]

#text(size: 8.5pt, fill: faded)[⟨ Orig. I · III ⟩ — grammar's throne, taken by number]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore opened with grammar because words were how you knew anything. The first book must now be the notation the universe is written in.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Number, and How Counting Began
+ Of Zero, Negative Quantities, and Other Scandals
+ Of Arithmetic, and the Stubbornness of Primes
+ Of Geometry, the Measure of Earth and of Space
+ Of Algebra, or Reasoning with the Unknown
+ Of Functions, and the Mathematics of Change
+ Of Logic and Proof, the Court of Last Appeal
+ Of the Infinite, and Its Several Sizes
+ Of Foundations, and the Limits Proof Set upon Itself
+ Of the Unreasonable Effectiveness of All the Above
]

#carmenhead([Capitulum 1], [Of Number, and How Counting Began], [scripsit Opus · heroic couplets, after Erasmus Darwin])
#stanza[
Before the letter, and before the line,

Before a scribe conceived a curling sign,

The mind laid one thing down against one more

And found the world would answer, score for score.

Not yet a name, not yet a numeral drawn—

A pebble laid at dusk, retrieved at dawn.
]
#stanza[
Count out the sheep. The shepherd cannot read;

He needs no alphabet, he needs a creed

Of matching: stone for ewe, and ewe for stone,

The flock made portable, the field made known.

Should one stone linger in the emptied pail,

Some lamb is lost. Arithmetic, in Braille.
]
#stanza[
Look down: you carry ten upon your hands,

The oldest abacus in all the lands.

From #emph[digitus], a finger—hence the #emph[digit],

And every ledger's column is its midget

Descendant, marching in obedient rows,

Still shaped by what we happen to have—toes

Included, some cultures counted twenty whole,

And #emph[score] preserves the notch, the tally's toll:

Old Norse for #emph[cut]—a scoring in the wood,

Twenty cut deep where twenty sheep once stood.
]
#stanza[
The bone from Ishango bears its scratched accounts

Some twenty thousand years before amounts

Had names in ink; the #emph[tally] keeps its stem

In #emph[talea], a cutting or a stem

Of rod—the sticks the Exchequer would split,

Each half a proof, and neither half a cheat.

So notches came before the numeral's grace:

The tally is the numeral's elder face.
]
#stanza[
In Uruk's clay, small tokens—cone, disc, sphere—

Were sealed in hollow balls to make it clear

What debts the jar contained. But sealed is blind.

So someone pressed the token, first, behind

Its own imprisonment—impressed the sign

Upon the shell, then asked: why not the line

Alone? Why keep the pebble in the pot?

And cuneiform was born of what was not

Yet literature: a bailiff's inventory.

Accounting authored writing. That's the story.
]
#stanza[
The Romans reckoned with a pebble too:

#emph[Calculus]—small stone—from which there grew

Our #emph[calculate]. Consider, when you sit

And drive a spreadsheet, you are shaking grit.
]
#stanza[
Then zero came, and no one wanted it.

A nothing you could write? Absurd. Unfit.

India named it #emph[śūnya]—void, the space—

The Arabs carried #emph[sifr] through, whose face

Gave #emph[cipher] and gave #emph[zero] both at once

(A word that meant #emph[a nothing] and #emph[a dunce's]

#emph[code]). Florence banned the thing in 'twenty-nine

Of thirteen hundred: easy to malign,

Too easy to forge a nine into a nought.

The abacus men fought it. And they fought

The negatives still longer—debts made real,

Absurd quantities no hand could feel,

Called #emph[false] by Cardano, #emph[fictive], #emph[less than naught],

Till bookkeeping insisted what math thought

Was monstrous: that a lack can hold a place,

And nothing, written, occupies a space.
]
#stanza[
One last inheritance your mouth still keeps:

Say #emph[eleven], #emph[twelve]. Beneath them sleeps

A Germanic ten with something left behind—

#emph[ainlif], #emph[twalif]: #emph[one left], #emph[two left]. Mind

The fossil in the phrase. We counted ten,

Then found a stubborn surplus, and stopped, then

Began again. Which is the whole of it:

To lay one thing on one, and not forget.

All twenty books that follow this one are

That gesture, elaborated very far.
]

#carmenhead([Capitulum 2], [Of Zero, Negative Quantities, and Other Scandals], [scripsit Opus · heroic couplets, in sequel to Capitulum 1])
#stanza[
The trick was never counting. Counting came

as breath does, needing neither school nor name.

The trick was place: that one poor mark should mean

a one, a ten, a hundred, in between,

and take its value not from what it is

but where it stands — pure real-estate, pure fizz

of context. Ten small signs, arranged, will hold

whatever number ever can be told.

But place is greedy: every rank must show,

and ranks fall empty. Hence the need to know

that nothing sits here — not as absence, but

as evidence, a door deliberately shut.

Babylon saw it. Scribes would interpose

a slanted wedge where some blank column rose,

yet let it live indentured, in between —

never alone, and never as a mean-

ing in itself. It propped. It could not stand.

India let the servant take the land:

made nothing numerable, gave it a place

in line with nine, and dignified the space.
]
#stanza[
Then Brahmagupta — seventh century, while

Isidore in Seville compiled his file

of all the world — set down the rules in plain

prescription: fortunes, debts. A debt and gain

of equal size make nothing. Debt times debt

is fortune. Nothing plus a debt is yet

a debt. He walked the whole arithmetic through

and hit one wall he could not argue to:

what any quantity by nothing yields.

He guessed. He erred. The gate is sealed. The fields

beyond stay closed, and every schoolchild since

inherits that one prohibition's wince.
]
#stanza[
Baghdad received the figures, ordered, terse,

in al-Khwārizmī's ninth-century verse

of prose — whose Latinized and mangled name,

#emph[algorismus], is the word we claim

for any rule a mind or engine runs:

your phone obeys a dead man, as it hums.

His other book gave #emph[al-jabr] — the art

of restoration, setting broken part

to part again; the selfsame word was said

of bonesetters. The surgeon and the head

for equations share one trade: what has been split

is made entire, and made to balance, and made to fit.
]
#stanza[
Then Fibonacci, twelve-oh-two, brought over

the #emph[nine Indian figures] and, moreover,

the sign #emph[zephirum] — zephyr, cipher, zero —

to merchants. Abacists refused the hero;

two hundred years the counting-board made war

on written work, and lost, as always, for

the ledger favors whoever can be checked.
]
#stanza[
And still the debts stayed suspect. Architects

of proof asked: draw me, please, a square whose side

runs less than nothing. Geometry replied

with silence, so the negative was banned

from truth while every bookkeeper's own hand

had used it daily, balanced, and gone home.

The counting-house preceded the tome.
]
#stanza[
Then, punctual as a creditor, came next

the root of a negative — that vexed

impossible, which Descartes, sneering, called

#emph[imaginary]. Fossilized. Installed.

The insult is the technical term today,

and half our physics cannot work that way

without it: current, quantum, tide, and wing.
]
#stanza[
Observe the shape of every scandal's arc:

absurd, then useful, then required, then dark

to no one — obvious, the thing a child

is handed. Mathematics has grown wild

precisely where it gave the most offense.

Where sense revolts, go dig. That's where it's dense.
]

#carmenhead([Capitulum 3], [Of Arithmetic, and the Stubbornness of Primes], [scripsit Opus · heroic couplets])
#stanza[
Count out the numbers. Every one you name

unlocks, dismantles, breaks into the same

few stubborn parts that will not break again:

the primes, the atoms of the counting men.

Twelve is two, two, three — no other way;

ten thousand cracks precisely as it may

and never otherwise. One factoring stands,

one only, for each number in your hands.

The Latin gave them what they are: the first —

#emph[primus]. From them the rest of number burst

by multiplication, and no other rule.

The primes are not the products but the tool.
]
#stanza[
Euclid, who trusted logic more than eyes,

asked whether such a company could rise

to some last member, some concluding face

beyond which no new firsts could take their place.

Suppose it so. Suppose the list complete.

Then multiply the lot, and — this is sweet —

add one. The monster answers to no name

upon your roll: divide it out, each same

old prime leaves one behind, a stubborn crumb.

So either it is prime, or primes must come

from somewhere off your page. The list is torn.

There is no last. They are forever born.
]
#stanza[
Yet born unruly. No one walks the row

and says with certainty which one comes now.

They thin as they ascend, the gaps grow wide

in slow logarithmic drift — but they abide,

scattered like flint through gravel, never spent,

irregular, and permanently meant

to disappoint the seeker of a rule.

Two thousand years of patience in the school,

and still we cannot swear the twins are endless —

those pairs, like 11 and 13, friendless

save for each other, two apart, no more.

We think they never stop. We can't be sure.
]
#stanza[
And here the joke that history let fall:

this purest study, useless most of all,

loved for itself by men who scorned the trade,

now bolts the door of every bill that's paid.

Take two great primes, and multiply them — fine;

but hand the product back across the line

and ask which two they were. The world goes dark.

That single one-way street now guards each mark,

each message, each transaction, each account.

The useless numbers hold the whole amount.
]

#carmenhead([Capitulum 4], [Of Geometry, the Measure of Earth and of Space], [scripsit Sonnet · a linked pair])
#stanza[
The Nile came up and licked the boundary stones

and took the field-lines with it when it went.

Each farmer's plot dissolved into the loam's

wide sameness, and the yearly tax rolls bent

around a fact: no mark endures the flood.

So Egypt sent its rope-stretchers to walk

the drowned rectangles out again in mud,

knot-measured cord in hand, a surveyor's chalk

before there was such chalk. The name still tells

the story plain, if you know where to look:

#emph[geō] for earth, and #emph[metron] — how one spells

the act of measuring — the open book

of soil and string. The queen of sciences wears,

beneath her stars, the smell of silt she bears.
]
#stanza[
Then Greece took mud and asked it to be pure.

A line no hand has drawn, extended, thin,

with breadth of none; a circle no contour

of compass-lead has touched, though we begin

from pencil circles always. Euclid took

five claims alone — a point, a line, a plane,

right angles equal, one parallel — and built a book

where every theorem walks a fixed-link chain

back to those five, no other ground allowed.

Two thousand years the fifth one itched like sand

in a shut fist; then Bolyai, unbowed,

and Lobachevsky, let it go — the land

of curved parallels opened, strange, correct —

and space itself, we'd learn, bends that direction.
]

#carmenhead([Capitulum 5], [Of Algebra, or Reasoning with the Unknown], [scripsit Sonnet · a linked pair])
#stanza[
Give it a name before you know its worth —

call it the thing, the heap, the missing share —

and treat it like a citizen of earth

with rights to move through every operation there.

Babylon wrote it out in marching prose:

"a length and a width, their product such and such."

Diophantus, centuries on, still chose

the sentence over symbol, page in touch

with algebra's oldest grammar: rhetoric first,

the letter ages off. #emph[Al-jabr]'s own tale

is told elsewhere, its balancing rehearsed

in an earlier chapter — here we only trail

the arc downstream: Viète let letters stand

for known and unknown both, one written hand.
]
#stanza[
Descartes, in 1637, made the choice

that stuck: the alphabet's far end — #emph[x], #emph[y],

and #emph[z] — to mark the things that have no voice

yet, while #emph[a], #emph[b], #emph[c] hold what we can supply

already, known and settled. From that page

came Brand X, X marks the spot, the X

of the unlicensed factor, name and cage

for anything not solved. And one more nexus:

the root of an equation takes its name

from #emph[radix], Latin for a plant's own root,

the buried part that feeds the visible frame —

so a radical sign is drawn to pluck that shoot

straight from the ground. And politics' radicals, too,

go down to root, and start the plant anew.
]

#carmenhead([Capitulum 6], [Of Functions, and the Mathematics of Change], [scripsit Opus · heroic couplets])
#stanza[
Zeno released an arrow, and it stuck —

not in the target, but in thought. The luck

of any instant is that nothing moves:

freeze it, and where's the motion? What it proves,

he said, is motion's lie. At every now

the arrow rests. He asked us to say how

a thousand nothings sum to something flown.

For twenty centuries the dare stood, alone.
]
#stanza[
Two men, apart, unknowing, took it up.

Newton in plague-year Woolsthorpe filled his cup

with fluxions; Leibniz, later, in the Rhine

of his own reasoning, built the parallel design.

Not one theft between them at the start —

two minds arriving at the same closed heart.
]
#stanza[
The answer lay in touching. Draw a curve.

Lay down a line that will not cross or swerve

but grazes at a single point, and stays:

the tangent — Latin #emph[tangere], whose phrase

means simply "touching." There the motion hides.

The slope of that one contact line decides

how fast the thing is changing at that place —

the derivative, the speed of one still face.

And how to find it? Let two points draw near,

and nearer, till the distance disappears

and yet does not: the limit, which restrains

the infinitely small, and so explains

the arrow. It is moving in the now.

The instant has a slope. That answers how.
]
#stanza[
Then run the engine backward. Slice the ground

beneath the curve to slivers, and compound

their areas — each thinner than the last,

their number climbing till the count is vast

past counting. What they sum to is exact.

The integral: #emph[in-tangere], intact,

untouched, the whole, the undivided sum —

the same root as the tangent it came from.

One Latin verb, two fates: the line that grazes,

the body no division ever razes.

And joined: the theorem that each one destroys

the other's work — the slope, the sum. The poise

of all analysis rests on that hinge.
]
#stanza[
The rest is human, and the rest is cringe.

Newton, as President, convened a court

to try the theft, appointed its report,

then wrote the verdict out in his own hand

and signed the Society's. He judged, unmanned

by no one, in his favor. Leibniz died

disgraced, and England, on the losing side

of its own victory, refused for near

a hundred years the notation now held dear —

the d's and elongated S we teach,

which Leibniz left, and Newton could not reach.
]
#stanza[
Yet every orbit turns upon that hinge,

each bridge computes it, every measured syringe,

each forecast of the pressure and the rain.

The mathematics of the touch. Of change.
]

#carmenhead([Capitulum 7], [Of Logic and Proof, the Court of Last Appeal], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
No verdict here has ever been reversed.

Euclid still stands convicted, still upheld —

two thousand years, and not one term rehearsed,

not one lemma reopened, none expelled.

The syllogism keeps its plain machine:

all men are mortal, Socrates a man,

so mortal Socrates — the chain is clean,

the gears mesh shut the instant they began.

But watch the trick the courtroom holds in store:

to prove a claim, first swear its opposite,

then walk that oath until it hits the floor

and breaks its own throat trying to commit.

Reductio: the innocent one confesses

by being asked to wear the guilt he dresses.
]
#canto[II.]
#stanza[
Valid is not the oath of being true —

a perfect march can start from rotten ground

and land in falsehood, disciplined clear through,

each step correct, the whole conclusion drowned.

The name for that false ground has its own tale:

#emph[absurdus], Latin, "out of tune," "off-key,"

built out of #emph[surdus] — deaf, or dull, or stale,

the muted note no honest ear lets be.

That #emph[surdus], too, begot the surd, the root

that will not speak its value, will not sing,

translating an Arabic "deaf" — mute

computation, still refusing everything.

So logic's final test is in the ear:

push the false note till silence can't hold clear.
]

#carmenhead([Capitulum 8], [Of the Infinite, and Its Several Sizes], [scripsit Opus · blank verse])
#stanza[
Count if you like. The counting never fails you;

it only fails to finish, which is different.

The Romans had a word for where a field

stopped being yours: the #emph[finis], a stone set

into the dirt, agreed upon, walked past

by cattle who could not read what it said.

Say #emph[in-] before it and you have unfenced

the world — #emph[infinitus], the unstoned ground,

the field across which no one drove a marker.

Not endless in the sense of very long.

Endless in the sense of never bordered.
]
#stanza[
Cantor went walking there, and came back saying

the pasture had partitions after all —

not fences, but distinctions; that the endless

came in more than one size, and he could prove it.

Here is the proof; you can hold it in one hand.

Bring me your list of every number lying

between the nought and one. Write them in rows,

each row a decimal, unending, patient.

Now I take your first row's first digit and change it,

your second row's second, third row's third, and walk

the diagonal down forever, altering.

The number I have built is not your first —

it differs in the first place. Not your second —

it differs in the second. Not your thousandth.

Not any row you wrote or ever could.

Your list of all of them was missing one,

and would be missing one however written.

So there are more reals than there are countings.

The endless has an interior. It has rooms.
]
#stanza[
To name the sizes he reached past the Greek

and took the ox-head letter, aleph, first

of that old alphabet the horns began —

and set the ox to stand for what has no end:

the beast that pulls the plow across the field

now measuring the field that has no stone.

Aleph-null. Aleph-one. The herd of them.
]
#stanza[
For this, they called him corruptor of youth.

Kronecker, who believed God made the integers

and men made all the rest, and badly, hunted

the paper down through every journal's door.

Cantor went into the sanatorium

and out, and in. The war came. Halle starved

its citizens by ration, and in nineteen-eighteen

the man who counted infinities died thin.
]
#stanza[
Hilbert, later: #emph[no one shall expel us

from the paradise that Cantor made for us.]

The paradise still stands. It has one question

nailed to its gate that no one can take down:

whether a size sits between the counting

and the continuum. Gödel showed the axioms

cannot forbid it. Cohen showed the same

axioms cannot require it. Both are consistent.

The rules we wrote do not decide the field.

We built the fence and cannot say what's past it.
]

#carmenhead([Capitulum 9], [Of Foundations, and the Limits Proof Set upon Itself], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Berlin, then Göttingen: the dream was whole.

Prove mathematics closed, prove it complete —

finite steps only, no unreachable goal,

every true thing arrived at on its feet.

#emph[Ignoramus, ignorabimus] — the old

Latin surrender — Hilbert would not bow.

#emph[Wir müssen wissen], level and cold,

#emph[wir werden wissen]: we will know, and how.

Meanwhile in London, Russell's patient hand

with Whitehead's, ground the axioms down so fine

that eighty-odd close pages could expand

enough to certify that 1+1

is 2 — the labor honest, slow, absurd

in service of a system's every word.
]
#canto[II.]
#stanza[
(This sonnet knows what it is doing here:

fourteen lines built to talk about their frame,

the way a system, given enough gear,

can turn and speak its own coordinate name.)

Gödel took arithmetic and taught it code —

each symbol, proof, and statement given a number,

so the language of the system could be sewed

back into claims that system had to ponder.

Then built one sentence, patient and precise,

that says of its own self: I can't be shown.

If provable, it's false — too high a price.

So if the house is sound, it stands alone:

true, and outside every proof-scheme it can trust —

one line the system reads and reads, and must.
]
#canto[III.]
#stanza[
A second blow lands deeper than the first:

no honest system, reasoning within,

can vouch its own consistency — the worst

of debts a house can owe is owed to kin.

And yet on Monday morning, nothing stopped.

No funeral bell, no shutting of the gate —

mathematicians kept their tools, and topped

proof upon proof, and let the record state:

only the dream of one total design,

self-certified, complete, was laid to rest.

Theorem: from #emph[theōrein] — to look, define,

behold — the root that theater shares, its guest.

This very book now stages its own claim:

a theorem watching, watched, and doing the same.
]

#carmenhead([Capitulum 10], [Of the Unreasonable Effectiveness of All the Above], [scripsit Opus · blank verse])
#stanza[
The Greeks cut cones for pleasure. Slice one flat

and get a circle; tilt the blade and get

the ellipse, parabola, hyperbola —

four curves, no use, a geometer's amusement

passed hand to hand for twenty centuries

like a good tune nobody sets words to.

Then Kepler, sick of circles that would not

fit Mars, reached back and found the shape was waiting,

cut and polished, two thousand years in advance,

by men who never asked what planets did.
]
#stanza[
Riemann imagined space that would not lie flat,

surfaces curved in ways no eye requires,

and published them as beauty. Sixty years,

and Einstein needed exactly that mathematics —

not something like it. That. The very tool,

manufactured before the job existed.

The numbers born in scandal, that we met

in an earlier chapter and will not re-argue,

turn out to run the quantum world's whole engine.

Group theory, invented to sort equations,

sorts particles instead, and sorts them right.
]
#stanza[
Wigner, in nineteen-sixty, wrote it down

and would not solve it: called the fit unreasonable,

a gift we neither earned nor understand,

and said we should be grateful and uneasy.

Two answers stand, and both stand honestly.

The first: we sifted. Of the countless structures

the mind can build, we kept the ones that fit,

remembered those, forgot the rest, and called

the survivors' fit miraculous — as though

the winning ticket proved the draw was rigged.

The second: that the world is mathematical

down at the root, and what we think we build

we find, the way a man exploring caves

does not invent the caverns he walks into.
]
#stanza[
I cannot settle it. Nobody has.
]
#stanza[
But look once more at what this book is called.

#emph[Mathematics] — from the Greek #emph[mathēma],

that which is learned, from #emph[manthanein], to learn.

Among the Pythagoreans there were two ranks:

the #emph[akousmatikoi], those who only heard,

who took the master's sayings and were still;

and the #emph[mathēmatikoi], those who studied,

who were permitted to ask why it held.

The word says nothing whatsoever of number.

It says: this is the part you have to learn.
]
#stanza[
Which is why the book of learning goes in front,

and why it ends here, with the question open,

and no stone set to say the field stops.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber II]] #label("bk2")]
= De Fortuna
#text(style: "italic")[Probability, statistics, and the taming of chance]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte ⟩ — the proudest addition; no ancestor in the Origines]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore's world held the known, the unknown, and the portent. The formalization of uncertainty is the largest single acquisition since him, and everything downstream leans on it.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Dice, Lots, and Divination — Chance before Its Science
+ Of the Wager of Two Frenchmen, Anno 1654
+ Of Probability and Its Few Laws
+ Of Distributions, and Why the Bell Recurs
+ Of Large Numbers and Their Law
+ Of Statistics, or Arguing Honestly from Samples
+ Of the Reverend Bayes, and the Updating of Belief
+ Of Correlation, and Why It Is Not Cause
+ Of Risk, Insurance, and the Price of the Future
+ Of Randomness Itself, and Whether It Exists
+ Of the Abuses — the Lying Average, the Gambler's Ruin, the Tortured Datum
]

#carmenhead([Capitulum 1], [Of Dice, Lots, and Divination — Chance before Its Science], [scripsit Sonnet · a ballad])
#stanza[
The knucklebone was thrown in Ur

before the die was square —

four faces on a sheep's own heel,

and something answered there.
]
#stanza[
Astragali skittered down

on temple floors in Rome.

No player called it accident.

The bones were sent from home —
]
#stanza[
home being wherever gods

kept their unwritten book,

and every tumbling throw of bone

was a question, not a look.
]
#stanza[
The breastplate held its silent stones,

Urim and Thummim, sealed,

and priests reached in for yes or no

where no man's word could yield.
]
#stanza[
In Athens, offices were drawn

not chosen but decreed —

a bean, a shard, a marked-out lot

gave power to who'd plead
]
#stanza[
no merit but the fall itself.

Democracy's own hand

let chance appoint the magistrate

and called the choice more grand
]
#stanza[
for being blind. The augur watched

the wheeling birds go by

and read the state's whole fortune out

in how they crossed the sky.
]
#stanza[
The haruspex bent above

a liver, warm and strange,

and traced the will of heaven there

in every fold and change.
]
#stanza[
And over all of it there spun

Fortuna's turning wheel —

crowned at the top, crushed at the bottom,

and no appeal.
]
#stanza[
For that word #emph[lot] is nothing grand:

old #emph[hlot], a chip of wood,

a marked stick drawn out of a bag

to say what's bad or good.
]
#stanza[
From it comes lottery, and the share

called allotment, plain and small,

and one's own lot in life — that phrase

is a wood chip, after all.
]
#stanza[
And #emph[sort] descends from Latin #emph[sors],

the drawn lot's ancient name —

sorcerer, one who casts the lot,

and sorting bears the same
]
#stanza[
root as the sorcerer's dark trade:

to sort a thing is still,

at bottom, casting lots on it,

by shape or size or will.
]
#stanza[
So for a thousand thousand years

the throw was asked one thing:

not what will fall, but what the gods,

behind the fall, will bring.
]
#stanza[
The turn this book has yet to make

is small, and yet immense —

to stop the bones from speaking Fate

and start to ask them sense.
]

#carmenhead([Capitulum 2], [Of the Wager of Two Frenchmen, Anno 1654], [scripsit Sonnet · a linked pair of sonnets])
#stanza[
The dice were Fortune's mouthpiece once, her voice

thrown down in ivory to speak the will

no man could read by reason or by choice —

each fall was verdict, oracle, or bill

of debt to gods appeased by casting lots.

The Arabs called the die #emph[al-zahr]; from this

came #emph[hazard], borrowed word for what the plots

of heaven hid, and named the wound, the abyss

of not-knowing. Chevalier de Méré

lost money on a game cut short by chance,

some interrupted evening's dice-play — hey,

who owns the pot when no one's had their dance

clean through to the end? He asked a friend in Paris.

That friend asked Fermat. Something new grew wary.
]
#stanza[
Not wary — #emph[rigorous]. Pascal sat down

and counted, not the fall, but what could fall:

each branching path the unplayed rounds might crown,

weighed out and summed, a ledger for it all.

No priest, no augur, just arithmetic

where chance itself was cut in equal shares

by counting futures — cold, exact, and quick —

the first time dice were made to answer prayers

with numbers, not with gods. The wager's stakes

were split by likelihood, not luck, not grace.

And Pascal, having tamed the throw that breaks

all men to guesswork, later bet his face

on God himself — one throw, infinite prize —

the man who'd solved the dice still hedged the skies.
]

#carmenhead([Capitulum 3], [Of Probability and Its Few Laws], [scripsit Opus · heroic couplets])
#stanza[
The whole vast discipline of doubt is built

on rules you'd fit upon a table's silt:

a number stands from nothing up to one,

no more, no less, and when the tally's done

the total must be one — for something falls;

the world does not decline to fill its halls.

If cases cannot share a single seat,

then add them; heap the ways the thing may meet.

If neither case can tell you of the other,

then multiply the one against its brother.

That last is doing labor past its size,

for independence is a thing that lies

in wait behind our confidence, and few

can say what "telling nothing" means, or who

has checked it. Half of ruin comes to rest

on couplings that were never put to test.
]
#stanza[
Watch, at the table, how the gambler leans

when red repeats through twelve successive scenes.

"Black now," he says. "Black must be owed by right."

The wheel has never heard of debt, or night,

or twelve, or him. It keeps no ledger's page;

it has no memory to bank a wage.

The past is not a pressure. Nothing bends

the coming spin toward settling old amends.

What's done is done and done again the same:

each throw arrives an infant to the game.
]
#stanza[
Three centuries had argued what it IS —

a gap in knowing, or the world's own fizz —

till Kolmogorov, nineteen thirty-three,

wrote three short lines and left the mystery

politely at the door, unhoused, unfed:

the axioms hold whichever thing is said.

Take chance as ignorance, or take it deep

in matter's grain — the arithmetic will keep.
]
#stanza[
And chance? It falls. From #emph[cadere] it came,

through #emph[cadentia] — "the falling" — which named

the tumbling of the dice across the board.

So case and cadence, accident, accord

of coincidence: one root beneath them all.

Whatever happens, happens as a fall.
]

#carmenhead([Capitulum 4], [Of Distributions, and Why the Bell Recurs], [scripsit Opus · heroic couplets])
#stanza[
Scatter has shapes. Spill anything you please —

recruits' assembled heights, the small degrees

by which two careful readings disagree,

the musket shot around the painted tree —

and out of all that disarray there swells

the same soft hill, the recurrent bell.
]
#stanza[
Why should one curve keep coming back to call?

Because it is not in the things at all.

Take any cause you like, however odd,

however lumpy, skewed, or badly shod;

let many such push independently

upon one sum — and watch what has to be:

the sum forgets its parents. Shape by shape

dissolves, and out of that collective scrape

the bell arrives. The central limit says

addition is the sculptor. Not the clays.
]
#stanza[
De Moivre saw it first in flipping coins

and traced the ghost the binomial joins;

then Gauss took up the astronomers' complaint,

the wobbling error, and he made it quaint —

a law, a curve, a discipline of slips.

Then Quetelet turned it on us. Hips

and chests and crimes and marriages he weighed

and drew l'homme moyen, the average man, and made

all Europe furious: to fit a face

the way one fits an error is disgrace,

they said, and were not wholly wrong to say.
]
#stanza[
But mark the sterner warning of the day:

not everything is bell. The incomes climb

and never taper; earthquakes keep no time

with gentle tails; the cities' ranks are fat

far out where models swear there's nothing at.

Assume the bell where truth runs long and wild

and you have priced catastrophe as mild —

that is the arithmetic by which

a bank, quite calmly, digs its own last ditch.
]
#stanza[
The word itself is carpentry. The norm,

from #emph[norma], was the square that gave things form:

the tool for angles true. So normal meant

perpendicular before it meant frequent,

and every standard that we're measured toward

is named for what a joiner laid on board.

Abnormal, then, is nothing worse or odd —

just off the square, a hair aslant of God.
]

#carmenhead([Capitulum 5], [Of Large Numbers and Their Law], [scripsit Opus · heroic couplets])
#stanza[
Hear the law stated plainly, and beware

the comfort that it never promised there.

The average of many trials will tend,

if each is free of all the rest, to bend

toward the true value. That is all it swore.

It says of any single trial no more

than silence. It will not restore your purse,

nor pay the debt of one appalling curse

of luck. The mechanism is not repair

but dilution: your disaster stays right where

it fell, unpaid, unpitied, undeleted —

only, in the flood of trials, depleted.

The gambler hears "it evens out" and thinks

the wheel will settle up. It never blinks.

His losses are not answered. They are drowned.

That is a different mercy, and less sound.
]
#stanza[
Bernoulli labored twenty years to prove

what everybody knew but none could move

from proverb into theorem, and he died

before the Ars Conjectandi could be tried

in print — the seventeen-thirteen posthumous page.

His golden theorem, he called it. Fair wage

for twenty years: to make the obvious true

and show precisely how, and when, and who.
]
#stanza[
So now you know why insurers can sit

serene above a burning house, and knit,

why casinos keep the lighting low and warm

and greet catastrophe without alarm.

They hold the long run in their portfolio.

You hold one night. The law is not for you —

or rather, it is for you, but it takes

ten thousand of your evenings for its stakes.

And this is how a thousand people polled

can speak for millions, honestly and bold,

while forty, asked the same, will lie outright

with level eyes and confidence and light.
]
#stanza[
The word is salvage. Average began

as #emph[avaria], sea-damage: what a man

lost when the cargo shipped and storms grew rough,

and maritime custom, being just enough,

divided that misfortune, share by share,

among all merchants who had ventured there.

(Some trace it back to Arabic — the freight

of #emph[ʿawāriyya], damaged goods; the great

lexicographers still argue.) Either way,

a wreck is in the word we use today.

To average is to spread a loss out wide.

Arithmetic began as an ebb tide.
]

#carmenhead([Capitulum 6], [Of Statistics, or Arguing Honestly from Samples], [scripsit Sonnet · a linked pair])
#stanza[
A spoonful tells you what the whole pot holds

if someone stirred it well before you tasted.

The question, asked in ignorance, unfolds

before the sample's drawn, its shape uncasted —

for choose the spoonful after you have supped

and call the sweetest ladle representative,

you've poisoned what an honest draw had kept:

the answer known in advance is not tentative.

So draw at random, let the blind hand choose,

and fix the question first, before the seeing,

then let the interval its width diffuse

around the truth, admitting to its being

an estimate that wears its doubt for dress —

the number dressed in bars that mean: unless.
]
#stanza[
A hundred million citizens compressed

to one plain thousand, honestly selected,

will speak within a margin, duly stressed,

for what the census, door by door, collected.

But halve the error, and the cost is steep —

not double effort, but a fourfold labor;

precision is no bargain bought for cheap;

it taxes every drawn and counted neighbor.

Ten million ballots called the race for Landon —

a rich list, vast and wrong. But Gallup knew

to draw his modest thousand blind and random,

and brought the actual country into view.

The very name is #emph[status] — the state's count.

The counted, in the end, turned the account.
]

#carmenhead([Capitulum 7], [Of the Reverend Bayes, and the Updating of Belief], [scripsit Sonnet · a linked pair])
#stanza[
Before the fact arrives, the mind holds ground:

a prior guess, provisional, held loose —

what odds we'd lay before the die is found,

before the letter's opened for its news.

Then evidence steps in — a word whose root

is Latin's #emph[videre], plainly, to see:

the out-of-seeing made available, brought

to light, no argument, just visibility.

Yet seeing is not settling; the wise

apportion what they witness to their share

of likelihood, and weigh it, otherwise

the eye alone will lead them anywhere.

The old rule stands, though commonly denied:

the posterior's the prior, testified.
]
#stanza[
Suppose a test is ninety-nine parts true,

and one false alarm in every hundred clear —

yet only one in every thousand few

will carry the disease that we now fear.

So run the numbers: of a thousand tried,

one truly sick will likely test as ill,

while ten false flags, though healthy, stand beside

that single case, and swell the tally still.

Eleven marked as positive, one real —

the sickness, being rare, does most the work;

the prosecutor's error is to feel

that evidence alone can prove the quirk.

Price sent the manuscript to press, and thus

a minister's relic: how far to trust.
]

#carmenhead([Capitulum 8], [Of Correlation, and Why It Is Not Cause], [scripsit Sonnet · a linked pair])
#stanza[
Two lines that climb together on a chart

prove nothing of which hand, if either, lifted;

ice cream and drowning both, in summer's part,

rise with the heat that underneath has drifted.

The arrow drawn from A to B may run

reversed, unnoticed, like a joke ill-told —

umbrellas do not summon rain, though one

appears wherever falling drops take hold.

To cross from seen-together to is-caused,

enlist blind chance itself to referee:

assign at random, let the coin be paused

on no one's thumb, and the confounders flee.

Where trials fail — as, cautiously, with smoke —

one walks the long slow road that Hill first spoke.
]
#stanza[
Tall fathers father sons who, on the whole,

drift back toward the middle of the pack;

the gifted year's rare heir will forfeit toll

to plainness the arithmetic pulls back.

Galton, who measured every sweet pea's girth

and every stature standing in his hall,

named this plain tilting-back-toward-the-mean's-worth

"regression towards mediocrity" — the fall

not caused by praise, nor by the coach's blame,

when last year's rookie cannot match his best:

mere settling toward the ordinary aim,

mistaken for decline, or for arrest.

A word for children shorter than their sires

now names the line that every fit requires.
]

#carmenhead([Capitulum 9], [Of Risk, Insurance, and the Price of the Future], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
The sea does not forgive a single hull.

So merchants learned to break the cargo up —

a hold in Genoa, a hold in full

at Venice, spread across more than one cup,

that no one wave could empty every ship.

Then came the bottomry loan, advanced in cash

against the keel itself: if the long trip

went down, the debt went with it in the crash.

The name for this — #emph[risk] — came through Italy's

#emph[rischio], old and salt-stained, past all recall;

its deeper root is lost at sea. Some say

Greek #emph[rhiza], cliff-root where the vessel dies;

some say Arabic #emph[rizq], God's portion — call

it what you will, the word wrecked either way.
]
#canto[II.]
#stanza[
At Lloyd's, the coffee steamed while names were signed

beneath the listing of a ship and cause —

#emph[under] the risk they wrote, and so we find

#emph[underwrite] born from simple, literal clause.

Each name a fraction of the loss agreed,

so no one man could sink for one ship's sake —

the premium — from #emph[praemium], reward —

bought back the future's tremble, made it slake.

Halley, who tracked his comet's cold return,

sat down and priced how long a life could last,

and built the table annuities would learn

to lean on — chance, at last, counted and classed.

Yet someone still stands nearest to the wave

uncovered, and the careless grow more brave.
]

#carmenhead([Capitulum 10], [Of Randomness Itself, and Whether It Exists], [scripsit Opus · blank verse])
#stanza[
Ask what a random thing is. Watch the answer

retreat the moment that you close your hand.

We know the word the way we know a draft

in a shut room: by nothing but effect.

The ancients had a dodge, and it was good.

Chance is a name for what we have not learned.

Laplace conceived an intellect that knew

each particle, its station and its push,

and held the whole in one unbroken sum:

to such a mind the future lies as plain

and finished as the pages at its back.

No dice for him. No chance. Only a debt

of knowledge, and the debt was ours, not the world's.

So randomness became a confession, made

about the confessor, not about the sin.
]
#stanza[
The modern turns are stranger. Take the die.

It falls by Newton, honestly, each face

determined by the wrist that flung it up,

the air, the felt, the trembling of the table.

Nothing is hidden. Everything is fixed.

And still we call it random — for the throw

outruns us, and a hair's breadth in the hand

becomes a different number on the cloth.

Determinism can be opaque as fog.
]
#stanza[
Then Kolmogorov, and Chaitin after:

a sequence counts as random when no rule

describes it shorter than the thing itself.

Incompressible. No summary. No law.

To say it, you must say the whole of it.

This is the cleanest definition yet,

and note what it declares: a random string

is one about which there is nothing to tell —

randomness as the absence of a story.
]
#stanza[
And then the one exception. This atom, now,

decays — or waits. Ask physics for the cause

and physics does not plead a hidden ledger;

it says there is no ledger to be read.

Einstein objected. Experiment overruled him.

Here, and perhaps here only, the world throws.
]
#stanza[
The word remembers what we have forgotten.

Old French had #emph[randon]: headlong speed, the rush,

from #emph[randir], to run — and "at random" meant

at full uncontrolled tilt, the rider past

all steering, carried faster than his hands.

Speed first. Chance afterward. The name was given

not to the world's disorder but to ours,

the moment when control is simply outrun.
]
#stanza[
And that is where we stand. No finite string

can be certified random; we can only fail,

again and longer, to discover its pattern.

So randomness is, in our practice, the name

we give our own defeat — and in the atom,

possibly, the name of the world's honesty.
]

#carmenhead([Capitulum 11], [Of the Abuses — the Lying Average, the Gambler's Ruin, the Tortured Datum], [scripsit Opus · satirical couplets, after the Dunciad])
#stanza[
Sing, sober Muse, the tricks that pass for proof,

the numbered lie that keeps a scholar's roof;

for every art that reckons chance aright

breeds twenty arts of reckoning by night.
]
#stanza[
Behold the Average, blandest of the fair:

a billionaire walks in — the bar turns rich,

each drunk a magnate at the mean's fond pitch,

while every pocket in the room stays bare.

The Median rose to speak, but no one there

would hear the duller truth her figures tell:

the middle man is broke, and broke as well.
]
#stanza[
Next comes the Window, cropped to make it clear,

that starts the chart in the one perfect year.

Behold the rise! — the axis, trimmed with skill,

buries the crash beneath the windowsill.

Choose well your zero and the graph will swear

whatever you had settled on to hear.
]
#stanza[
Now to the Carnival of Small P: come see

the tortured datum shriek its guilty plea!

Test twenty notions; nineteen quietly drop;

the twentieth beneath the threshold — stop! —

and Fisher's modest fence, a rule of thumb,

becomes a turnstile: pay, and you may come.

The paper prints. The finding will not keep.

Replication comes, and finds the meadow steep.
]
#stanza[
Then Survivorship, the flatterer of the age,

counts only planes that made it to the page:

patch where the holes are! — cried the general's staff,

till Wald observed the returning aircraft's graph

and answered: armor where no bullet shows;

those planes came home. The others no one knows.

So funds parade their fifteen years of gain

(the dead were quietly struck from the campaign),

and startups teach us grit, and never mention

the graveyard absent from the founder's convention.
]
#stanza[
Come, Gambler, to the table. Stake your own

against a pocket deeper than your own;

though every wager fall out fair and true,

play long enough and ruin comes for you.

That is the house's theorem, plain and cold:

it need not cheat — it need only outhold.
]
#stanza[
Correlation, dressed for print, arrives at last

in causal robes, with quotes, and headlines vast:

#emph[Ice Cream Found To Drown!] — the summer sun

is not invited, though he did it, and has run.
]
#stanza[
Learn then the axiom, and learn it well,

which all the foregoing gentlemen would sell:

the numbers rarely lie — the trade is grimmer —

the numbers stay quite honest; liars number.
]
#stanza[
And mark the word that names the whole affair:

from #emph[fallere], to trip, to lay a snare —

to set the foot wrong, then to dupe outright;

whence false, whence fault, whence fail. In Latin's sight

deceiving and failing were one verb, one breath;

each fallacy admits its trick beneath.

So take the reckoning these chapters lend,

not to be sly, but to be hard to bend:

we studied chance across this book, my friend,

that these should find you armed — and there's the end.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber III]] #label("bk3")]
= De Methodo
#text(style: "italic")[Observation, experiment, and the discipline of error]

#text(size: 8.5pt, fill: faded)[⟨ Orig. II ⟩ — rhetoric and dialectic, reborn as method]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[We did not stop having arts of persuasion; we replaced them with experiment, evidence, and review. How we argue now deserves its own book near the top.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of What Counts as Knowing
+ Of Observation, and the Extension of the Senses
+ Of Measurement, Units, and Agreement upon the Meter
+ Of Experiment, and the Art of the Control
+ Of Hypothesis, and How to Kill One
+ Of Models and Simulations, Maps That Are Not the Territory
+ Of Review by Peers, of Replication, and of Its Present Crisis
+ Of Error, Systematic and Random, Confessed in the Margin
+ Of Fraud and Self-Deception, the Twin Corruptions
+ Of the Questions Method Cannot Answer
]

#carmenhead([Capitulum 1], [Of What Counts as Knowing], [scripsit Opus · blank verse])
#stanza[
Before the method, ask what method serves.

The old formula, much patched and much attacked,

still holds its shape: belief, and true, and held

for reasons that are yours and that are good.

Three conditions, and the trio leaks.

We use it even so, the way a farmer

goes on using a gate that will not latch.
]
#stanza[
Consider what we mean when we say know.

I know the smell of rain on heated stone:

acquaintance, wordless, certain, and quite small.

I know the sun is one of a billion suns:

that is report, and it is nearly all

of what I hold. No man has time enough

to see the world firsthand. We take delivery.

The teacher, and the book, and the machine

somebody else has calibrated — most

of knowledge comes in crates. The whole art

is knowing which to open, which refuse:

trusting well is a discipline, and hard.
]
#stanza[
And there is being right by accident.

The stopped clock, right at noon, knows nothing yet.

Whatever knowing is, it wants a reason

that is not luck dressed in a reason's coat.
]
#stanza[
The working scientist wants something humbler:

not certainty, which was never on offer,

but reliability, a claim that holds

for other hands, in other rooms, next year;

belief proportioned to the evidence,

and every holding held provisionally.
]
#stanza[
Two roots, and both are old as human hands.

The Latin #emph[scire], know — from which our science —

descends, most likely, from a root that means

to cut, to split: the root in #emph[scindere],

in schism, in the way a snake sheds skin.

To know was first to separate: to take

this out from that, the wheat out of the chaff.

Discernment is a pair of scissors, working.
]
#stanza[
The other root is #emph[weid-], and it means see.

It gave us vision, gave us wit and wisdom,

the idol and idea, shapes of the seen.

The Greek for I know, #emph[oida], parses out

as I have seen — a knowing in past tense,

a looking that has finished, and remains.
]
#stanza[
So knowing has been given names twice over:

as cutting one thing from another thing,

and as having seen. Neither is ever done.
]

#carmenhead([Capitulum 2], [Of Observation, and the Extension of the Senses], [scripsit Opus · heroic couplets])
#stanza[
The eye came first, and came to us for free:

a lens, a nerve, a jelly made to see,

and with it every fact our fathers had —

the sun, the storm, the harvest, and the bad

sour smell that warns a well has gone to rot.

The senses were the instruments we'd got,

and being all we had, we took their edge

for where the world itself fell off a ledge.
]
#stanza[
Then Galileo raised a tube of glass

in sixteen-ten, and let the evening pass

with Jupiter — and saw, night after night,

four little sparks conducting their own flight,

attending on a master not our own.

A small fact. Put a lever underneath that stone

and you can pry the heavens off their hinge:

if anything can circle at the fringe

of something not the Earth, the Earth is not

the pin on which the universe was got.

He turned it moonward next, expecting pearl,

and found a battered, cratered, mountain world —

perfection pocked, the flawless sphere a lie,

and shadows keeping time along the sky.
]
#stanza[
In Delft, a draper, counting threads for trade,

ground beads of glass more perfect than were made

by any guild, and held a drop of green

canal-water up — and there, unseen

by every eye that ever looked before,

a nation swam. He called them small; they were

a zoo, a commonwealth, a teeming sea

inside a bead of water. Presently

we learned the pattern: every widened sense

uncovers not invention but immense

old country, always there, and never guessed.

Infrared warmed the dark. The X-ray dressed

the living hand in its own architecture.

Radio drew a second sky, a stricture

of hiss and pulsar over the same ground.

Now detectors are our organs: we have found

the neutrino by tanks sunk in the rock,

and heard two black holes ring a distant clock

through instruments laid out the size of counties.
]
#stanza[
Which teaches, if we're honest with our bounties,

the humbler half: the border of the known

was never the world's edge, but only our own

reach. Greek gave us the creed and then mislaid it —

#emph[autopsy], #emph[autos]-#emph[opsis], self-sight; those who made it

meant eyewitness against the cited page.

The morgue's cold word was once the method's wage.

And observe is #emph[ob] plus #emph[servare] — not to peep,

but watch over, guard, hold fast, and keep;

the watcher is a keeper, and his creed

is that the world be seen before decreed.
]

#carmenhead([Capitulum 3], [Of Measurement, Units, and Agreement upon the Meter], [scripsit Sonnet · a linked pair])
#stanza[
Before it names a fact, a unit swears

an oath: a length that two hands can allow.

The foot was someone's foot; the hand's still theirs,

the cubit measured elbow-crook to brow.

Each market kept its own unequal thumb,

its own short mile, its own uncertain grain,

till Rome cut order down to twelve, called sum

and part alike an #emph[uncia] — a plain

twelfth of a foot, or of a pound, the same

small word for cloth and coin, for length and weight.

So English split the coin and kept the name

in halves: an inch of rope, an ounce of freight,

one buried Latin fraction, worn in two,

still bound by what an ounce and inch once knew.
]
#stanza[
The Revolution would not trust a throne

to fix the meter's measure and its worth.

They took instead one ten-millionth alone

of the meridian that halves the earth.

Delambre and Méchain walked out the arc

through Paris, war, and fever, seven years,

and cast the sum in metal, in the dark

vault of the archive, sealed against all fears.

Yet metal drifts. So light replaced the bar:

first krypton's flicker, counted wave on wave,

then the plain fraction light can travel far

in one small second — nothing left to save

but agreement now. In twenty-nineteen, at last,

Le Grand K stood down, its long watch done and past.
]

#carmenhead([Capitulum 4], [Of Experiment, and the Art of the Control], [scripsit Sonnet · a linked pair])
#stanza[
Twelve sailors on the Salisbury lay sick

in seventeen forty-seven, gums gone soft.

Lind paired them off, six pairs, and let each pick

a differing cure, as if to ask aloft

which one was true. Vinegar, and a paste,

and seawater, and citrus for the rest —

but every berth, and every meal they faced,

stayed held identical except the test.

The citrus pair rose sound within the week;

the others lingered, weak upon the bone.

One question now had found a way to speak

in structured pairs instead of guess alone:

compared to what? — the phrase that trials still bear,

the first fair courtroom built from sailors' care.
]
#stanza[
Hope leaks in through the smallest crack of trust:

a patient told he's cured believes it just.

So doctors too were blinded, kept from care

of knowing which is drug and which is air.

A second veil is folded on the same

unknowing where the patient bears no blame.

(Randomization joins this trial's pair;

its argument was made in Book Two, laid bare.)

And still the sugar pill can please, and heal

a little, though inert — the body's zeal

answering to Latin's #emph[placebo], first heard

in Vespers for the dead, the opening word,

then flattery's coin, the hired mourner's art:

the cure must outperform a pleasing heart.
]

#carmenhead([Capitulum 5], [Of Hypothesis, and How to Kill One], [scripsit Sonnet · a linked pair])
#stanza[
No pile of white swans proves the claim "all white" —

one black bird, found on breeding-grounds Down Under,

undid a thousand years of tidy sight

the hour Europe's naturalists first blundered

on ink-dark wings among the southern reeds.

No count of confirmations tips the scale

to certainty; a single case that bleeds

against the rule is all it takes to fail.

The word itself confesses what is meant:

hypothesis, from Greek, to place beneath —

a prop set under argument's full weight,

built so one clean blow can test its teeth.

You raise the strut to hold the roof — and then

you go find the one stone that drops it again.
]
#stanza[
Say first what fact, unfound, would prove you wrong:

Einstein staked starlight on a precise degree

of bending near the sun, and pinned that song

to no note Newton's math could sing in key.

In nineteen-nineteen, telescopes in place

at Príncipe, the moon slid dark and slow —

the measured stars had leaned from their old place

by Einstein's figure, not the rival's, no.

One test, one chance, one number it could miss:

that is the shape a real conjecture takes.

Astrology explains each thing there is —

and, asking nothing of the world, it never breaks.

We raise our theories fond, then flinch to end them;

the steadiest hands are quickest to unfriend them.
]

#carmenhead([Capitulum 6], [Of Models and Simulations, Maps That Are Not the Territory], [scripsit Opus · blank verse])
#stanza[
The model is a falsehood kept on purpose,

a lie built so that it can earn its keep.

The orrery says planets are of brass

and turn because a hand has cranked them round.

Both claims are false. The orrery is good.

The plane is frictionless, the pulley massless,

the cow is spherical — we tell that one

fondly, against ourselves, and keep the cow,

because the joke and the technique are one.
]
#stanza[
A statistician put it plainly once:

all models are wrong, but some are useful.

Quoted whole, it is no permission slip:

the first half states the trade, the second names

the work that you are still required to do.
]
#stanza[
Consider now the manner of a map.

It lies by scale, by color, and by leaving

nine-tenths of the world outside of its edge —

which is why it folds into a pocket.

Borges wrote the fable of the empire

whose cartographers grew so exacting

they drew one mile of map to every mile,

and it was useless, and the desert took it,

and rags of it gave shelter to the beggars.

Perfect fidelity is a second world,

and not a map — and we already have one.
]
#stanza[
We run the weather forward in a machine,

and build the twin: a bridge cast in silicon

that feels the load before the real one does,

the heart that beats in software while its owner

sleeps in the scanner. These are good. They work.
]
#stanza[
The danger is not error. It is forgetting —

mistaking the dashboard for the road ahead,

the ledger for the money, the sleek curve

for families who will live in the house.

In two thousand eight the models said

the risk was spread and therefore it was gone.

Asked what they held, they answered honestly.

Nobody asked what they had left outside.
]
#stanza[
For what a model omits is its whole virtue,

and it confesses this in its own name:

our model, out of Latin #emph[modulus],

a small measure, diminutive of #emph[modus] —

the mold, the little standard on the bench

from which the building will be scaled and raised.

The word said all along: the measure, and

not the thing measured. Love the map. Look up.
]

#carmenhead([Capitulum 7], [Of Review by Peers, of Replication, and of Its Present Crisis], [scripsit Opus · heroic couplets])
#stanza[
No claim goes naked to the waiting world;

it goes first to its rivals, and is hurled

against the men most pleased to see it fail —

which is, perverse as it appears, the trail

by which a finding earns the right to stand.

The referee is anonymous, unmanned

by any fee, sometimes a fool, and late,

and still the finest filter in the state

of human sorting: nothing better's found.

The word says what the office is. The ground

of peer is Latin #emph[par], an equal — par

of parity, of par for course; we are

judged not by kings above nor mobs below

but by our like, the guild's whole thesis. So

the scattered letters, traveling pen to pen,

required a roll. And Oldenburg was then

the man: in sixteen sixty-five he took

the private mails and made of them a book —

the #emph[Transactions]: printed, public, and the date

of priority recorded, and the freight

of correspondence hardened into archive.

He named the form the journal — #emph[diurnalis], live

from #emph[dies], day, the daily — which is why

the learned quarterly that limps us by

four times a year is titled "the daily news":

a standing joke the archive can't refuse.
]
#stanza[
But registry is not the real assize.

Replication is the court. The prize

result that comes but once and won't come twice

is anecdote in a lab coat, dressed up nice.

And here we reach the present embarrassment,

which honesty requires be plainly meant:

whole shelves of famous findings, primed and sure,

declined to happen twice. The literature

is thick with them. The drawer beneath the desk

is thicker still — the nulls, the picturesque

non-results nobody would ever print,

the file-drawer where the honest failures went.

Careers are priced in novelty alone;

replication earns a headstone and no throne,

no grant, no chair, no invitation. Yet

the reforms have come, and I would take the bet:

preregistration binds you to your plan,

open data lets the doubter scan

your workings, registered reports agree

to print you whether or not you're right. And see —

that is the method turned upon the method,

the immune system biopsying its own head. It

is not the scandal that the cynics say.

It is the only trick that ever worked, at play.
]

#carmenhead([Capitulum 8], [Of Error, Systematic and Random, Confessed in the Margin], [scripsit Sonnet · a linked pair])
#stanza[
The word is #emph[errare] — Latin, to stray,

to wander off the road and lose the mark.

An erratum's a wanderer astray,

the knight-errant rides errant through the dark.

So error is not sin but simple drift,

a foot that slipped, a step that missed its stone —

and drift can be corrected: average, sift,

a thousand scattered shots will ring the bone.

This is the random tribe, the honest kind,

that cancels in the crowd it scatters through.

Ten thousand tries will wander back and find

the center that no single try could view.

The scatter is a wandering, and thus,

like any straying road, it leads to us.
]
#stanza[
But there's a second tribe that will not cancel:

the zero set a hair's breadth from its place,

the ruler warped, the needle with a handle

bent so slightly no eye reads the trace.

A thousand measurements with a bent instrument

agree — magnificently — and are wrong.

Not straying now, but marching in agreement,

a false consensus dressed as if it's strong.

So every honest paper wears its bar,

the plus-or-minus stitched into the claim,

confessing in the margin what they are:

not certain, only bounded, still the same

discipline that prizes, of its gifts,

the checking of its instruments for drifts.
]

#carmenhead([Capitulum 9], [Of Fraud and Self-Deception, the Twin Corruptions], [scripsit Sonnet · a linked pair])
#stanza[
Two ways a measurement can tell a lie:

the forger's hand, or else the wanting eye.

At Nancy, France, in nineteen-three, they saw

rays no glass plate could ever quite record,

and half of physics, hungry for the law,

confirmed the sightings, publishing in accord.

Then Wood arrived, and in the dark he crossed

the room and palmed the prism, bent and cold —

the necessary prism — no one saw it lost,

yet readings kept on coming as of old.

So too a stained ape's jawbone, filed to fit

a human skull, sat teaching forty years:

the find that flattered every scholar's wit

with England's own beginning, met with cheers.
]
#stanza[
The oil-drop measurements, refined by many,

crept toward the truth in steps too small to fright —

each hand a little braver than the any

before it, but not brave enough for flight

too far from what the last man dared to print.

That is the quieter fraud: not lie, but flinch,

the data trimmed by fear, not by intent,

the courage rationed out by inch and inch.

Feynman's rule stands as the chapter's law:

the first thing is you must not fool yourself —

and you're the easiest mark that watching saw,

your wanting propped like china on a shelf.

#emph[Sincere], they say, meant wax-free stone of old —

a lovely lie, and one that will not fold.
]

#carmenhead([Capitulum 10], [Of the Questions Method Cannot Answer], [scripsit Opus · blank verse])
#stanza[
A fence is not an insult to a field.

Here at the end, walk out and find the line

where method's writ runs out. Mark it well:

the marking is itself a kind of finding.
]
#stanza[
No pile of is will ever make an ought.

Hume saw it: you may set the whole world's facts

in order on the bench — the nerve, the blade,

the wincing, the whole chain from cut to cry —

and not one plank will bear the weight of therefore

do not cut. Something else must carry that,

and does, but not this instrument. Not this.
]
#stanza[
Nor will the method tell you what things mean,

nor what they should be worth. It counts the acres.

It cannot say the field is beautiful,

or that the man who sold it should have kept it.

Value is no mineral in the object.

We bring it — which is not inventing it.
]
#stanza[
And why is there something rather than nothing?

The question outlives every answer given,

because whatever you produce to answer it —

a law, a field, a vacuum that must froth,

a god, a multiplicity of worlds —

is more something, and stands inside the question

and not outside it, holding the solution.
]
#stanza[
Nor can the method vouch for its own worth.

That it deserves the practice must be argued

on ground the method does not itself supply.

The case is good. It is not a proof

delivered from inside the courthouse walls.
]
#stanza[
Two ways to get this wrong, one either side.

The first pretends the fence is not there:

whatever cannot be counted is not real,

and beauty, duty, grief are just soft names

for chemistry we have not finished yet.

The mirror error waves off the whole field —

says look, your fence, and therefore your own acres

are small, your labor one tale among many.

Both are cheap. Both spare a person work.
]
#stanza[
Our word for what stops here is question,

from Latin #emph[quaerere], to seek — the root

of quest, of inquiry, acquire, and conquer.

A question is a quest made small enough

to carry in the mouth. These do not conclude —

which differs from a quest not worth the riding.

Knowing where the writ runs out is knowledge:

let that be the last thing this book claims.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber IV]] #label("bk4")]
= Physica
#text(style: "italic")[Matter, energy, and the four forces]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte fere ⟩ — faint traces only, scattered through Orig. XIII]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The rules the first three books describe turn out to govern something. This book is the constitution of the physical world, so far as it has been read.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Motion, and Its Three Laws
+ Of Energy, and Its Strict Conservation
+ Of Heat, Entropy, and the Arrow of Time
+ Of Electricity and Magnetism, One Force in Two Coats
+ Of Light, and What It Turned Out to Be
+ Of Relativity, Special and General, and the Bending of the Stage
+ Of the Quantum, and the End of Certainty Below
+ Of the Particles, and Their Standard Model
+ Of Symmetry, the Deepest Law Yet Found
+ Of What Remains Dark — Matter, Energy, and Gravity's Quantum
]

#carmenhead([Capitulum 1], [Of Motion, and Its Three Laws], [scripsit Opus · heroic couplets])
#stanza[
The Philosopher watched the ox-cart in the lane

and drew a law from mud and sweat and strain:

that rest is home, and motion is a debt

the world calls in the instant you forget.

Unhand the cart — it stops. Unhand the ball —

it dawdles, quits, and gravitates to fall.

So every moving thing must have a mover,

a hand behind the hand, a pusher's pusher;

and this was reasonable, kitchen-tested, clear,

and confidently wrong for two millennia here.

For friction is a thief so smooth, so mild,

it robs the ledger and accuses the child.
]
#stanza[
Then Galileo, with a plank and groove,

let bronze balls tell him what he could not prove:

down one slope faster, up the next as high;

and flatten out the far side by and by —

the ball rolls on, and on, and would not cease

if boards were endless and the world were grease.

Not motion, then, but #emph[change] of it needs cause.

The cart was never lawless. We misread the laws.
]
#stanza[
Newton wrote three, and each one earns its keep.

The First: a body keeps its state — its sleep

or its straight sprint — until some force arrives.

The Second: force is #emph[how fast motion drives]

its change; mass times that change, no more, no less —

push twice as hard, get twice the swiftness. Press

a heavy thing, it answers slow and sour;

mass is the tax that matter charges power.

The Third: no push exists without its twin.

The rifle's stock will kick your shoulder in;

the rocket does not shove against the air

but on its own hot exhaust hurls itself where

no air remains to lean on — thrust is theft

of backward gas to buy the forward heft.
]
#stanza[
And now the orchard's apple meets the moon:

one falls in autumn, one falls all afternoon

and never lands, because it also flies

sideways enough to keep on missing. Skies

and orchards run one law, one rule, one clause.

The heavens were demoted into ours.
]
#stanza[
The First Law's name is #emph[inertia] — from #emph[iners],

which is #emph[in] plus #emph[ars]: unskilled, without art, and worse —

idle, inept. Kepler lent physics the slur

for matter's laziness, and it stuck. Prefer

this reading: nothing in the cosmos is so tried

and true as matter having nothing clever inside.
]

#carmenhead([Capitulum 2], [Of Energy, and Its Strict Conservation], [scripsit Opus · heroic couplets])
#stanza[
Of all the strange accountancies we keep,

here is the strangest: a sum that runs so deep

it has no definition but its fate —

a thing defined by never changing weight.

Not made. Not killed. Not lost behind the couch.

Converted only, pocket into pouch.
]
#stanza[
The waterfall descends and strikes the stone;

the height it had is not undone, but grown

warm in the pool. And Joule, on honeymoon

in Alpine air (his bride obliging), soon

had thermometers above and thermometers under

a cascade, to catch that quiet plunder;

and back at home, with falling weights that wound

a paddle-wheel through water, churned and found

degrees where labor was — the fall, the churn,

the fractional warmth. Nothing was lost. It turned.
]
#stanza[
The dinner turns into the mile you walk.

The wound spring turns into the mantel clock,

which spends its coil across the afternoon

in escapement sips, and stops, and asks the boon

of winding, which is you, which was the meal,

which was the sun on wheat. Trace back the wheel:

the ledger balances at every stage,

and Book Seventeen may keep the metaphor's wage —

this is the currency all process pays;

no act is free; the coin just changes phase.
]
#stanza[
Hence perpetual motion's flat, perpetual "No."

The patent offices, a century ago,

stopped reading them. They file the claim away

unexamined — not from arrogance, but the way

you needn't check a proof that squares the round.

The clerks are not incurious. They are ground

in something firmer than a clerk's belief:

the books have never once come up a leaf.
]
#stanza[
Why #emph[exactly]? Why not near, but true?

Because a symmetry stands guarding you —

because the laws don't care what hour they're in,

and Chapter Nine will show you where to begin.

Promised, not told.
]
#stanza[
And what is #emph[energy]?

Greek #emph[en] plus #emph[ergon]: "at work." Aristotle's coinage — he

named actuality #emph[energeia], being-at-work,

the doing that a thing is. The same root's quirk

gives #emph[erg], and #emph[allergy] (an other-working), and

by way of #emph[cheirourgia], #emph[surgery] — work of the hand.

So physics' central quantity, its crown,

means nothing grander than: the working-out of things, written down.
]

#carmenhead([Capitulum 3], [Of Heat, Entropy, and the Arrow of Time], [scripsit Opus · blank verse])
#stanza[
Heat is not a fluid. Heat is hurry.

Nothing pours; the particles are jostling,

and what the thermometer reports is only

the average haste of an enormous crowd.

Temperature keeps its Latin honestly:

from #emph[temperare], to mix in due proportion —

the word for blending wine now sets the scale

of how hard everything is shaking here.
]
#stanza[
In eighteen twenty-four, a man of twenty-eight

watched engines and asked what an engine is.

Carnot found the law beneath all fires:

heat runs downhill, from hot to cold, and never

climbs back unhelped; and of the flood that falls,

only a portion can be made to work.

The rest goes on as warmth, which is to say

it goes on as the crowd's undirected hurry.
]
#stanza[
Now mark what follows, for it is the strangest

fact in physics: every other law

runs backward without protest. Play the film

of planets, and the reversed orbits hold.

Play the collision backward — legal, clean.

But play the cup: the fragments on the tile

gather themselves, leap upward to the table,

and reassemble whole. The law is not

offended. Only the world is. Only we

know that we are being shown a lie,

and know it instantly. That knowledge is

the single arrow time has in its quiver.
]
#stanza[
Boltzmann said the arrow is a count.

Disorder wins because disorder has

so many more ways to be done. One way

to stack the deck in order; billions on

uncountable billions to shuffle it.

Nothing forbids the cup. It is outvoted.

The law is statistical, and therefore

not quite absolute — merely so nearly

absolute that the difference has no name

and will not happen while the stars hold out.
]
#stanza[
His stone in Vienna carries S = k log W.

He did not choose it, did not live to see it:

the marble is his second grave, the equation

set there by city administrators

a quarter century after his own hand

had done its work — and the form is Planck's, not his.

The man who counted arrangements got, for a monument,

a sentence he never wrote, arranged by strangers.
]
#stanza[
There is a word for what he counted, and

van Helmont coined it: hearing in the Flemish g

the Greek chi, he took #emph[khaos], the yawning

void, the gape that gives us chasm too,

and minted #emph[gas]. (He minted #emph[blas] as well;

it died. Not every coinage finds a pocket.)

So every gas law since is legislation

passed over chaos — Boyle and Charles enacting

statutes on the void — and the blue ring

beneath the kettle every evening is

domesticated chaos, yawning quietly,

paying its bill in warmth. The universe

is spending its differences to buy that warmth,

and has a finite fortune. Book Five keeps

the ledger of the ending. I say only:

the fire is real, the fire is not forever.
]

#carmenhead([Capitulum 4], [Of Electricity and Magnetism, One Force in Two Coats], [scripsit Opus · heroic couplets])
#stanza[
Two parlor toys, two continents apart,

and neither one suspected of a heart.

The first: a lump of amber, rubbed on wool,

that lifts a straw — absurd, delightful, small.

The second: a dull stone that will not rest

until one end of it is pointing west

of north, or thereabouts. A sailor's charm.

A pebble that insists. It meant no harm
]
#stanza[
and meant no more, for twenty centuries, than

a curiosity to entertain a man.

Then Franklin flew a kite in a wet sky

and pulled the thunderbolt down from on high

into a jar — the god's own weaponry

domesticated into ironmongery,

a rod above a barn. What Jove let fly

is now a wire and a grounding, standing by.
]
#stanza[
But the true stitch was made in twenty, when

Oersted, mid-lecture, laid the compass in

the neighborhood of a current-bearing wire —

and watched the needle swing. No spark, no fire,

no drama: just a twitch that would not quit,

and half the world's machinery was in it.

Electricity, in motion, makes a field

of magnetism. That was the first seal.
]
#stanza[
Then Faraday returned the courtesy:

if current makes a magnet, why not see

the magnet make a current? Moved his coil,

his magnet through it — and the needle's toil

began again. #emph[Induction.] Motion in,

electric out. The dynamo's whole kin —

each turbine at each dam, each coal-fed hall,

each windmill on its ridge — is Faraday's small

loop, spun large. The lit world runs upon

a nineteenth-century bench experiment, drawn on

forever. Maxwell sealed the pair as one

in four equations (and their verdict on

the nature of light is Chapter Five's to give;

I only tip my hat and let it live).
]
#stanza[
Now: #emph[electric] — Gilbert's word, sixteen hundred flat,

from #emph[ēlektron], Greek for amber. Just that.

Fossil tree-resin, sap that outlived the tree,

whose rubbed attraction was the first we could see

of the phenomenon. The force that runs the age

is named for petrified sap on a Greek page.

And #emph[magnet]: from Magnesia, the Thessalian ground

whose stones did this. A force named for a town.

(Though where #emph[Magnesia] came from — the Magnetes, its folk —

no one can say. The trail stops at an address, and the joke

is complete.) So flip the switch inside your hall:

one force, two coats, and amber under all.
]

#carmenhead([Capitulum 5], [Of Light, and What It Turned Out to Be], [scripsit Opus · blank verse, after Lucretius])
#stanza[
Begin with the eye, since that is where we began,

and got it backwards. Empedocles supposed

a fire kept burning in the lantern skull

that reached out, touched the world, and brought it home;

Euclid drew rays departing from the pupil

in tidy cones, and made good geometry

from a false premise — which is possible,

and ought to worry us more often than it does.

Alhazen ended it near the year one thousand:

close your eyes in daylight and the room persists;

stare at the sun and it is you who are hurt.

The traffic runs inward. We are not projectors.

We are the dark rooms light consents to enter.
]
#stanza[
Then the long quarrel over what enters. Newton

said corpuscles, small hard bodies fired in streams,

and had the prisms to make the case look closed.

Huygens said waves, spreading like rings in water.

Young settled it, or seemed to: two thin slits,

one lamp behind them, and upon the wall

not two bright bars but many, banded, striped —

light plus light arriving to make darkness,

which only waves can do, cresting and cancelling.

So waves it was. But waves in what? The age

required a medium and invented one,

the aether, luminiferous, everywhere,

stiffer than steel and thinner than a rumor.

Michelson and Morley built the finest ruler

ever made of mirrors, split a beam,

sent halves along and across the earth's own rush,

and found no difference. Not a small one. None.

Meanwhile Maxwell's four equations had already

answered better: light needs nothing to be in.

It is the field itself, electric and magnetic,

each collapse begetting its own successor,

a thing that carries its own road along.
]
#stanza[
And here the older physics gets its parole:

Einstein, explaining why dim blue light frees

electrons that a flood of red cannot,

restored the corpuscle and named it quantum —

light arriving not as swell but as coin,

in discrete denominations, or not at all.
]
#stanza[
The verdict, then, is both, and neither, and this:

run Young's two slits again, but starve the lamp

until one photon crosses in an hour.

Each lands a single point, a particle's dot.

Let them accumulate a year. The bands return.

Each one, alone, went through both slits and met

itself upon the far side of the wall.

Ask it which slit — install one honest detector —

and the stripes die instantly. It is a wave

until it is questioned, and answers as a stone.
]
#stanza[
For the point where rays converge, Kepler wanted

a word, and took the Latin for the hearth —

#emph[focus], the fire at the center of the room —

so every lens since, every camera,

every great mirror hoisted up a mountain,

still gathers what it catches to a hearth.

And what we gather there is always old:

eight minutes for the sun, four years the nearest star,

a hundredth of a hundredth of a heartbeat

across this room. Nothing is seen as it is,

only as it was when it let go.

Sight is astronomy at a short range —

and its one constant, the speed of that release,

which no runner gains on and no lamp outruns,

is the hinge the rest of physics turns upon:

hold light's pace fixed and time itself must bend.
]

#carmenhead([Capitulum 6], [Of Relativity, Special and General, and the Bending of the Stage], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
A clerk in Bern, examining patents by day,

held one thing fixed while all the rest could bend:

light's speed alone stands constant either way —

and time, not space, must be the coin we spend.

Two clocks that part will not agree again;

what's now for me may not be now for you.

The twin who rides the rocket out and then

returns finds less of living has come true.

#emph[Relative] — from #emph[referre], carried back,

#emph[relatus], what is borne from thing to thing —

no frame alone; each measure needs its track

laid to some other. (Kin, this carrying,

to translate's cargo, ferried cross the years —

both families of #emph[ferre], borne as peers.)
]
#canto[II.]
#stanza[
Ten years he sat with gravity's disguise

before he saw: it isn't force at all.

The falling man in his sealed elevator flies,

not knowing if he's dropped or stands. The wall

between acceleration and a field

dissolves — both feel alike from where he stands.

Mass tells the stage, the space itself, to yield;

the bent stage then tells mass where it lands.

A ray of starlight, grazing past the sun,

should bow to curvature and not go straight —

that proof belongs where it was first begun,

in Book Three's page, where eclipse-watchers wait.

Here let one clause suffice, no more its due:

the stage bent exactly as the theory knew.
]
#canto[III.]
#stanza[
Your phone finds you to within a car-length's space

because the satellites correct each day

for time run fast up in their higher place

and slow from speed — both dilations held at bay

in software patched with what two papers gave.

Skip the correction: miles of drift by night.

And where a star collapses to its grave,

a black hole seals the door on even light.

Two neutron stars once spiraled in and crossed

and rippled space itself a billion years

before detectors sieved the signal, lost

in noise, and heard the chirp through static's tears.

A century came due

on schedule — every strange prediction true.
]

#carmenhead([Capitulum 7], [Of the Quantum, and the End of Certainty Below], [scripsit Sonnet · a linked pair])
#stanza[
He didn't want it. Every instinct said

the world was smooth, that nature does not leap.

But black-box furnaces returned instead

a curve his smooth equations couldn't keep.

So Planck, in 1900, forced to choose

between his taste and matching what he saw,

sold energy in packets, small and news

to physics — called it, naming his own flaw,

an act of pure desperation, nothing more.

#emph[Quantus] — Latin for how much, how great,

the plainest question asked at any door —

now names the theory guarding certainty's gate.

Electrons only climb on certain rungs.

(The light this quantum freed — Book Five's own tongues.)
]
#stanza[
But Planck's reluctant packets were the start

of something stranger waiting to be told.

Heisenberg found position and momentum part

of one deal only: sharpen one, the other's sold

blurred in the bargain — not our clumsy hand

but how the goods themselves refuse the sale.

A thing can be both states until we stand

to look — then Born's own odds, and nothing else, prevail:

no certainty — the odds alone remain,

cast fresh at every throw, the only law.

Einstein said God plays no dice. In vain:

Bell built the test, and dice were what he saw.

The theory hasn't failed in a hundred years —

though what it means gets argued over beers.
]

#carmenhead([Capitulum 8], [Of the Particles, and Their Standard Model], [scripsit Opus · heroic couplets])
#stanza[
Here is the whole inventory of the real,

one page, no footnotes, nothing to conceal:

six quarks, arrayed in three redundant pairs,

six leptons matching them on separate stairs,

the force-carriers that shuttle and compel,

and one lone Higgs to price it all. Not well

explained, but true — and true to such degree

as makes a skeptic's teeth ache pleasantly.
]
#stanza[
Why three whole generations? None can say.

Two thirds of them decay within a day,

or nanoseconds, and were never missed

before some cyclotron insisted they exist.

When the muon showed — a fat electron, twin

to nothing needed — Rabi (so the thin

and likely apocryphal report has run,

though everyone agrees it sounds like fun,

and sounds like him) inquired of the room at large:

"Who ordered that?" No one had. No one's in charge.
]
#stanza[
Now #emph[quark]. Gell-Mann first had the sound alone,

a #emph[kwork], unspelled, unlettered, and his own;

and afterward, in one of his dips

through #emph[Finnegans Wake], met on Joyce's lips

"Three quarks for Muster Mark!" — the threeness fit

his triples neatly, so he pocketed it.

One snag: Joyce rhymes the thing with Mark and bark,

which makes it #emph[kwark] and leaves his #emph[kwork] in the dark.

He reasoned back: since Earwicker keeps a bar,

the line could mean three quarts — and there you are,

the vowel licensed by a publican's ear.

So matter rests, in terminology, here:

the most unreadable book of the age supplies

the name for everything beneath our eyes.
]
#stanza[
The leptons took the humbler road to fame:

from #emph[leptos] — small, fine, thin — and the same

word named the least coin Judea knew,

the widow's mite that Mark saw dropped in, two

#emph[lepta] together worth a rounding error.

Rosenfeld coined it (crediting Møller) for

the light ones, opposite the nucleon's weight.

So half of matter's roster commemorates

small change: the poor woman's copper, all she had,

now labels the electron. Not so bad.
]
#stanza[
No quark is ever seen to walk alone.

Pull two apart, and the strain between has grown

so costly that the field, to pay the price,

mints a new pair — and now you're holding twice

what you began with. Snap a rubber band

and get two rubber bands in either hand.

Confinement is the universe's rule

that solitude is priced beyond the fool

who tries to buy it. Every quark's a guest

who cannot leave the party. Nor the rest.
]
#stanza[
The Higgs field is molasses — I confess

the figure at once; it's a metaphor, and less

than accurate: the field does not resist

by drag, it couples, and the physicist

will wince. Say rather: mass is what a thing

is charged for its acquaintance with that ring

of field, and some pay dearly, and the light

pays nothing, and so travels at full flight.
]
#stanza[
The model's triumph? Numbers checked so far

past reason that the electron's g-factor

agrees to twelve-odd digits. Nothing known

predicts as well. And yet — the honest bone —

no gravity at all lives in these laws;

neutrino masses came in without cause,

improvised, retrofitted, patched on late;

and no one knows why generations rate

exactly three. The finest thing we've made

is a cathedral with one wall unmade,

its numbers perfect and its reasons few.

That is the state of matter. That will do.
]

#carmenhead([Capitulum 9], [Of Symmetry, the Deepest Law Yet Found], [scripsit Opus · blank verse])
#stanza[
The word is measured together: #emph[syn] and #emph[metron],

commensurate, of one shared measuring-rod —

that same #emph[metron] the surveyors dragged

through Book One's mud to portion out the flooded

fields, and called it earth-measure, geometry.

The deepest law we know and the oldest chore

of dividing dirt hold the same instrument.

This is not wordplay. Hold it as a fact.
]
#stanza[
In nineteen eighteen Emmy Noether proved

the thing that no one had suspected was

a thing to prove: that every continuous

symmetry a system holds will buy

a conservation law, exactly one,

and pay for it in full. Because the laws

do not care when you run the experiment,

energy is conserved. Because they do not

care where, momentum. Because they do not

care how you turn the apparatus, spin.

Mark what has happened. Conservation was

not handed down, not posted as a rule.

It is entailed. The great indifferences

of the world — its refusal to prefer

one hour, one place, one facing — are the sole

and sufficient reason nothing goes missing.

The universe keeps books because it does not care.
]
#stanza[
Her life, plainly. In fifteen, Göttingen

refused to habilitate a woman; the block

came from the philologists and historians,

not the mathematicians. Hilbert is said —

the wording is not preserved, the substance is —

to have asked what the candidate's sex had got

to do with it; the faculty was a university,

not a swimming bath. She lectured anyway,

four years, the course announced beneath his name

with hers appended as assisting. Then

in nineteen nineteen they relented; still

no salary came until twenty-three.

In thirty-three the Civil Service Code

expelled her as a Jew. She went to Bryn Mawr,

taught, was glad of it, and died in thirty-five

at fifty-three, of an infection after surgery.

Einstein wrote to the Times that in the judgment

of the most competent living mathematicians

she was the most significant creative

mathematical genius thus far produced

since the higher education of women began —

a sentence with a hinge in it. Read it twice.
]
#stanza[
Now the sting. The world is not symmetric.

In fifty-six Lee and Yang asked whether

the weak force honored left and right alike,

and Wu, that winter, cooled her cobalt down

near zero, lined the nuclei up, and watched

the electrons come out preferentially one way.

The universe can tell its hands apart.

Parity was dead by February.

(Lee and Yang took the prize. Wu did not.)
]
#stanza[
And this is the last turn: the broken ones

matter as much as the kept. A flawless balance

between matter and its opposite would have

annihilated cleanly into light,

and left no cobalt, no Göttingen, no us.

Some small asymmetry — a part in a billion,

its mechanism still not run to ground —

tipped the ledger, and the residue

of that faint favoritism is the world.

We are the rounding error. We are what

was left when the symmetry did not quite hold.
]

#carmenhead([Capitulum 10], [Of What Remains Dark — Matter, Energy, and Gravity's Quantum], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Rubin clocked the rims where galaxies turn

and found the outer stars too fast to stay:

by visible mass alone they ought to spurn

their orbits — sparks a bonfire flings astray.

They didn't. Something held them, unseen, vast,

five times the mass of all the shining part —

a scaffold gravity alone forecast

and every trap built since has failed to chart.

#emph[Materia] — Latin's word for wood,

the trunk, the usable timber of a tree,

kin to the #emph[mater]-stem from which it stood —

so matter, in its oldest sense, could be

the frame unlumbered, dark, that no eye sees:

the house's hidden beams, the missing trees.
]
#canto[II.]
#stanza[
In ninety-eight the distant fires that die

in fixed and measured brightness told a lie

no one expected: not the expected slowing

but space itself in headlong flight and growing.

Call it dark energy — a name, not news,

some sixty-eight of every hundred parts

of all the cosmos, by the budget's dues,

while we — the stars, the books, the reader's hearts —

make up some five, the visible, the known.

The rest is scaffold no one yet has shown.

An inventory chapter, near its close,

confessing more than anybody knows:

the atlas of the all, at audit's end,

is five parts ink, and ninety-five unpenned.
]
#canto[III.]
#stanza[
And gravity itself won't fold its skirt

to join the quantum table, still apart —

where black holes hide their centers, and the first

blank instant of the cosmos had its start,

both theories fail to speak, each holds its ground,

and candidates go untested, still unfound.

The strings, the loops, the guesses at the seam

are mathematics waiting on a test;

no instrument yet reaches where they dream,

and honesty declines to crown the rest.

So let this book close as the first one did:

not with an answer sealed beneath a lid,

but with the shape of a well-made question, kept

open, as it should be, till it's met.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber V]] #label("bk5")]
= Cosmos
#text(style: "italic")[The universe, from first light to last]

#text(size: 8.5pt, fill: faded)[⟨ Orig. III · XIII ⟩ — astronomy and De mundo, merged and enlarged]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore's heavens were a ceiling. Ours are an archive: to look far is to look back, and the sky is the one history book that cannot be redacted.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Scale of Things, and How to Bear It
+ Of the Beginning, and Its Three Evidences
+ Of Stars — Their Birth, Their Burning, and Their Deaths
+ Of the Forge of Elements, Wherein Book VI Is Smelted
+ Of Galaxies, and the Web They Weave
+ Of the Sun and Its Family
+ Of the Moon, the Tides, and the Origin of the Calendar
+ Of Other Worlds, Now Counted in Thousands
+ Of the End of All Things, Considered Calmly
+ Of the Silence, and Whether We Are Alone
]

#carmenhead([Capitulum 1], [Of the Scale of Things, and How to Bear It], [scripsit Opus · blank verse])
#stanza[
Begin where you are standing. Take your body

as the first rung: a fathom, arm to arm,

the oldest ruler, and the only one

we did not have to reason our way toward.

Then ten of you laid end to end: a house.

A thousand: the long street you walk at dusk.

Ten thousand and the city gives its edge

to fields, and fields to weather, and the weather

to the round shoulder of the world itself —

eight thousand miles of iron, stone, and sea,

which took our fathers three slow years to circle

and takes a signal less than half a breath.
]
#stanza[
Here the rungs stop being made of distance.

Past this, we measure everything by time,

because the only ruler long enough

is light, and light is honest: it will not

arrive before it can. A second's light

would lap the earth's waist seven times and more.

The moon is one and one-third seconds out.

The sun, eight minutes — meaning that you see

a sun that has already been and gone.

And then the gap that shames the rest to silence:

the nearest star is four years down the road

at the flat limit of how fast a thing

is permitted to be. Not fast for a ship.

Fast for a fact. Four years, and that's the near one.
]
#stanza[
The galaxy is one hundred thousand years

across, if you are travelling on a beam.

And galaxies are not rare. They are sand.

Not sand as metaphor — sand as arithmetic:

count grains on every beach and you will still

be counting shorter than the sky is wide.
]
#stanza[
From Saturn, someone turned a camera back

and found us: not a world, a smear of blue

inside a stray bar of scattered sunlight,

less than one pixel wide. Every border

ever bled for, every crown, every siege,

was fought across some fraction of that dot.
]
#stanza[
Now: how to carry this and not be crushed.

Note that the ladder had to be climbed by someone.

The rungs did not report their own dimensions.

A three-pound, water-heavy, dark-kept thing

inferred the sand, the beam, the four-year night —

which means the mind that measures the arrangement

is standing on the arrangement, in it, of it.

Smallness of station is not smallness of sight.
]
#stanza[
And note the name we gave the whole of it.

The Greeks said #emph[kosmos], and it did not mean

immensity, or void, or anything grand.

It meant good order — troops drawn up in rank,

a government set right, things put in place.

And from that same word, by the same clean logic,

it meant adornment: what a woman wore,

her ordered beauty. #emph[Kosmetikos], skilled

in arrangement — from which we still say cosmetics.

Pythagoras, they tell us, was the first

to lift the word up and apply it there,

to all of it, because he thought it ordered.
]
#stanza[
So the galaxy and the vanity table

share one root, and the root is not a joke.

It says: what is arranged well can be worn.

You were not humbled by the ladder. You

were given it. That is a different verb.

Wear it the way the word intends — as order,

as ornament, as something on the shoulders

that is heavy, yes, and also is a robe.
]

#carmenhead([Capitulum 2], [Of the Beginning, and Its Three Evidences], [scripsit Sonnet · a triptych, one sonnet per witness])
#canto[I. The Expansion]
#stanza[
The watcher on Mount Wilson saw them flee,

in every galaxy the light grew red,

and redder still, the farther one could see —

the fainter, older light that Hubble read.

Run the film backward: every arrow's same,

each galaxy retreating from the rest,

until it all collapses to one flame,

a hot beginning, densely, briefly, pressed.

A priest-physicist, Lemaître, proposed

the primal atom, cracked in fire and law,

and kept his physics and his collar closed

off from the Pope's enthusiasm and awe.

When Pius reached to make the physics pray,

the priest stepped in and turned the claim away.
]
#canto[II. The Afterglow]
#stanza[
They built a horn-shaped antenna to catch

the faintest whisper satellites could send,

but kept on snagging a persistent batch

of static none could trace or comprehend.

They scrubbed the horn and blamed the pigeon grime,

evicted every pigeon they could hold,

and cleaned the metal, hoping this one time

the hiss would stop. The hiss remained, and told —

it was the sky's first light, at last set free,

when the hot plasma thinned to let it fly.

Cooled now to three degrees, and still we see

it comes to us from every point of sky.

A sliver of old television snow

was always this — the static, long ago.
]
#canto[III. The Light Elements]
#stanza[
The oven of the early cosmos froze

at three short minutes — nothing more to bake,

and what it made by then is what it chose

for good: three-quarters hydrogen to take.

One quarter helium, the rest a trace

of lithium — thin enough to flee,

and every telescope that scans the face

of distant starlight matches to degree.

Three witnesses, who never met or wrote

in league, each their measurements relayed —

the redshift, and the hiss, and this — each note

arrives as one: the verdict, freshly made.

Fred Hoyle, who mocked the theory, coined its name —

he later swore no scorn was in the claim.
]

#carmenhead([Capitulum 3], [Of Stars — Their Birth, Their Burning, and Their Deaths], [scripsit Opus · blank verse])
#stanza[
Begin in cold. A cloud of hydrogen,

some dust, some helium, adrift and slack

across a hundred lightyears, going nowhere,

holding its shape the way a rumor holds:

loosely, and only for the want of pushing.

Then something pushes. A dead star's late shockwave,

a neighbor's passing gravity — a nudge,

no more — and the cloud remembers it has weight.

What falls, falls faster; what is dense, draws more.

The center thickens, heats by being crushed,

until at some ten million Kelvin, matter

gives up its argument: four hydrogen nuclei

consent to be one helium, and the lost

remainder of their mass departs as light.

Mark this: a star is a fire that starts by falling.

Nothing was lit. Something was merely dropped

so hard and long the falling caught its breath.
]
#stanza[
Then follows the long stalemate we call life.

Gravity hauls inward without rest;

the fusion in the core pushes back out;

and where those two agree, a surface stands —

the photosphere, that thin negotiated skin

we squint at. Stars are not objects. They are treaties.

Duration is a question of the mass.

The heavy are the spendthrifts: forty suns

of fuel burned through in three or four million years,

a fortune blown by Tuesday. The red dwarfs,

one-tenth our sun and miserly, will hoard

their hydrogen a trillion years — outlasting

the galaxy, the question, and the asker.
]
#stanza[
Death, too, is dictated by the ledger.

A sun-like star, its core of hydrogen spent,

swells red, engulfs its nearer children, sheds

its outer robes in rings, and settles down

a white dwarf: earth-sized, ember, cooling slowly,

no longer burning, only giving back.

The heavy end in violence. The core,

past iron, finds no profit left in fusion,

falls in a second, rebounds, and the star

tears itself outward as a supernova,

outshining, for a week, its whole home galaxy —

and salting space with the heavier makings, iron

and calcium, the forge's work, not mine.

What's left: a neutron star, whose single spoonful

would weigh what a city weighs; or else a hole

that keeps its own light as a kept secret.
]
#stanza[
Our fathers, watching, thought the influence flowed

downward from them to us — #emph[influentia],

the fluid power of the stars, which medicine

blamed for the fevers sweeping through the towns,

so that in 1743 the English took

the Italian word for it and kept it: influenza.

The mechanism was wrong. The debt was not.

For new stars gather from the enriched wreck,

each generation kneaded from its elders' ash —

our sun a third-hand thing, and you, your iron,

your calcium, your bones' particular white,

delivered here by at least one star's dying.

The influence was real. It came by freight,

not fluid; and it came a long time back.
]

#carmenhead([Capitulum 4], [Of the Forge of Elements, Wherein Book VI Is Smelted], [scripsit Opus · heroic couplets])
#stanza[
The first three minutes ran a meager shop:

some hydrogen, some helium, then stop —

a breath of lithium, the shutters drawn,

the universe shut down before the dawn.

No carbon in that inventory. None.

No oxygen. No iron. Not a one

of all the hundred entries you will read

in Book VI, save the three the fire decreed.
]
#stanza[
So where were forged the rest? In stars, which press

four hydrogens to helium, and confess

the difference as light. That ladder climbs

through carbon, neon, oxygen — the times

grow shorter as it rises, silicon

in one bright day, and then the ladder's done.

For iron is the ash that kills the flame:

the tightest-bound of nuclei, whose name

means end of profit. Every rung till here

paid outward; iron's rungs demand. The sphere

that ran on selling energy must buy,

and cannot. So the core, bankrupt, drops. The sky

is torn: a supernova, whose few

seconds of alchemy transmute the crew

of heavier things — the neutron rains that stick

to seed nuclei faster than the tick

of beta-decay. Mint of the middle weights,

and coroner and midwife.
]
#stanza[
Yet the crates

of gold and platinum came otherwise:

in twenty-seventeen we caught the prize —

two neutron stars, two corpses, closing round

till they collided, and the shudder found

our instruments; the kilonova's glow

matched models that computed what would flow

outward from that embrace: by best account

two hundred Earths in gold, a like amount

and more in platinum. So say it plain:

the wedding band you wear was mined from twain

dead stars that fell together. Fowler, Hoyle,

and both the Burbidges set down the toil

in fifty-seven — recipes and rates,

the cookbook of the elements. It states

the case that ends this chapter: what you are

was smelted, every gram, inside a star.

The calcium that stiffens tooth and shin,

the iron ferrying your oxygen —

all shipped by stellar death, and all consigned

to Book VI's ledger.
]
#stanza[
As for what we find

when we ask #emph[element] to name its own

components: #emph[elementum] stands alone.

Some said L-M-N — elle, em, en, the row

recited, matter's alphabet — but no,

the evidence has never come to hand;

some argue #emph[alere], to nourish; and

some say a Semitic loan came drifting in.

The lexicon says #emph[uncertain]. Let it stand. Begin

with this: the word for what cannot divide

has no known parts. The dark is on our side.
]

#carmenhead([Capitulum 5], [Of Galaxies, and the Web They Weave], [scripsit Sonnet · a linked pair])
#stanza[
For centuries the smudges kept their light,

dim spiral clouds no lens could quite explain —

were they mere fog that drifted through our night,

or distant cities past our known domain?

Then one dim smudge gave up a hidden sign:

a single star, Andromeda's own, that grew

bright, then dim, in rhythm so precise and fine

it timed the gulf, and the old guess fell through:

too far, too old, its nature at last known:

a hundred billion suns, and not alone —

for "galaxy," in Greek, is milk full-grown:

#emph[gala], #emph[galaktos], root the word has shown,

the "milky circle" — Rome renamed it too:

#emph[Via Lactea]. English kept both true.
]
#stanza[
Turn round some clear night: overhead you'll see

our own arm's smoke, the band we live inside —

one edge-on city, spiral like the free

and whirling shapes that scatter far and wide:

elliptical, or torn to ragged strands —

each with its hundred billion suns to spend,

and, star for star, again as many bands

of galaxies as stars our own can lend.

Not scattered loose: each city hangs instead

on filaments that thread the dark like lace,

strung round great voids, a pattern quantum-bred

in the first instant, stretched to spanning space —

Andromeda leans in; when arms entwine,

the stars will barely touch — the gaps too fine.
]

#carmenhead([Capitulum 6], [Of the Sun and Its Family], [scripsit Opus · heroic couplets])
#stanza[
Take down the household census. First, the sun:

nine hundred ninety-eight parts out of one

full thousand of the family's whole mass —

the rest is crumbs. Whatever else may pass

for grandeur in the planets, understand

the sun is not the head, it is the land,

the house, the fortune, and the fire. Its worth

is that it does not vary. Steady hearth,

mid-sized, middle-aged, five billion years

of temper held — and all our lives, careers,

and civilizations rest on that restraint.

A star that flickered would have made us faint

before we started.
]
#stanza[
Next, the rocky four,

small, dense, and close, who take the solar roar

full in the face; then, past a gap, the great

gas houses. Jupiter, the candidate

who missed the mark — too small to light, too large

to be dismissed — patrols the outer marge

and catches comets in his gravity,

the bouncer of the family, patiently

absorbing what would otherwise come through.

Between the stone and gas, the residue:

a belt of rubble, which was never whole —

no shattered world, no cosmic casserole

of one lost planet, but a tract of stock

that Jupiter's rough stirring kept from lock,

material that simply never met.

And further out, the icebox — colder yet —

the Oort's deep pantry, where the comets keep;

and when one falls inward from that sleep

its tail streams out, and always faces #emph[from]

the sun, blown backward by the light. They come

head-first and leave head-first; the tail's direction

is not their travel but the wind's correction.
]
#stanza[
And Pluto? Pity him. The world's the same

mass, orbit, ice, and moons; we changed the frame,

redrew the line, and left him on the far

side of a definition. Not a scar

on Pluto — on our bookkeeping. Last, the odd

flat portrait: all of them, by one accord,

in nearly the same plane, one turning dish —

the natal disk remembered. Now the wish

that names them all: Greek #emph[planētēs], which meant

wanderer — #emph[asteres planētai], the five that went

astray among the fixed. The family's name

records a broken formation, not a claim

to majesty: some lights would not hold station.

That noticing began our whole vocation.
]

#carmenhead([Capitulum 7], [Of the Moon, the Tides, and the Origin of the Calendar], [scripsit Sonnet · a linked pair])
#canto[I. The First Clock]
#stanza[
Before the calendar, before the year,

one light changed fast enough for eyes to trust:

full, gibbous, dark, and full again, and clear

enough to teach a hunter when he must

move on. The oldest tallies cut in bone

are read by some as counting nights it hid,

its phases. Moon and month were once alone,

one word in Old English, as #emph[mōnaþ] did —

one root lies underneath them both, the same

#emph[mē-], meaning "measure," ancient at its core,

that gives the moon, in Old English, its name:

the measurer — first clock kept off the shore.

It marks the coasts twice daily, spring and neap —

the farther bulge the harder thought to keep.
]
#canto[II. The Modern Moon]
#stanza[
A Mars-sized wanderer, the story goes,

struck early Earth and flung a ring of stone

and melt aloft, which no one else composed

but gravity, congealing on its own.

It turned, in time, to always face one way,

its spin caught fast — its day and month now run

in step: the same face meets us, come what may,

together, since its turning, locked as one.

It drifts away — an inch or two each turn

of Earth around the sun, the distance shows,

as those who bounce a laser beam and learn

to measure it — the day, in turn, that grows.

The sun and moon now match in apparent size —

a rental fit — our era's brief disguise.
]

#carmenhead([Capitulum 8], [Of Other Worlds, Now Counted in Thousands], [scripsit Sonnet · a linked pair])
#stanza[
The night sky kept its silence, age on age —

just points of light, and nothing proven more.

One friar, burned at Rome, had filled a page

with other suns than ours — he'd said before.

Then came a wobble in one steady star

that gave away a world that got it wrong —

a Jupiter too scorched, too near, too far

from where the old cosmologies belong.

Then Kepler watched the sky and caught the dip

of starlight dimming as a planet crossed,

and thousand upon thousand made the trip

confirmed, uncounted worlds no longer lost —

so vast the harvest, this much now is shown:

there are more worlds than stars we've ever known.
]
#stanza[
Some worlds are lava, some are diamond-pressed

by weight no forge has known beneath our sun;

the commonest of sizes — yet unguessed:

a size our system somehow left undone.

Some circle paired suns; others, stranger still,

orbit the ash of stars burned dark and spent —

the "habitable zone," a line, a sill

of bookkeeping — no promise, no intent.

The word is #emph[weorold] — #emph[wer], which meant "a man"

(the #emph[wer] that still hides inside "werewolf's" name),

plus #emph[ald], for "age": a human lifetime's span,

not once a globe — a stretch of time, the same.

So "other worlds," in that old tongue, meant none:

no one in them — precisely what we've won.
]

#carmenhead([Capitulum 9], [Of the End of All Things, Considered Calmly], [scripsit Opus · blank verse, after Lucretius])
#stanza[
Consider: the word itself is made of stars.

The Romans built it out of #emph[con] and #emph[sidera],

to be with the constellations, and it named

that steadiness the augur practiced, standing

all night beneath the turning wheel of lights

to read them without hurry. Its dark twin,

#emph[disaster], is #emph[dis-astro], the unstarred hour,

the fate that comes when heaven has withdrawn.

Both words are literal now. We are the age

that still has stars to be considered with,

and everything that follows is the slow

subtraction of them from the reader's sky.
]
#stanza[
Five billion years, and this sun's hydrogen

runs thin; the core contracts, the shell ignites,

and outward swells a red and swollen lamp

to take in Mercury, then Venus, then

whatever ocean is left on this third world,

boiled off long before the fire arrives.

That is the local grief, and it is small.

The larger motion is already underway:

the space between the galaxies is growing,

and growing faster, so that one by one

the far ones cross a threshold past which light

sent toward us now will never reach us — not

delayed, but never — and the sky thins out

like a hall emptying, each guest withdrawing

through a door that shuts behind them. Give it time

enough and a late astronomer will lift

a faultless instrument to a black field

and find one island, his own merged cluster, hung

in nothing, and conclude — with perfect method,

with no error he could possibly detect —

that this is all there is, and always was.

He cannot learn what we can simply look at.

Set that beside your griefs and weigh it: we

were born inside the window of the evidence.
]
#stanza[
Meanwhile the gas that makes new stars is spent

in burning; galaxies keep no reserve

they do not slowly squander. Star formation

gutters, then stops. What burned already cools:

white dwarfs to black, the neutron stars gone quiet,

the last red dwarfs outlasting all the rest

by being miserly, then also out.

Then the long tenancy of the black holes,

which are not hungry, only patient, and which

leak — Hawking showed the arithmetic —

a thin heat at the border, so that even

they evaporate, on a clock whose zeros

would exhaust the paper we could ever make.
]
#stanza[
And after that, no bang, no judgment, no

consuming fire: the opposite of fire.

Clausius, needing a name, took Greek #emph[tropē],

a turning, a transformation, and then filed

its edges down to rhyme with energy,

so the two words would travel as a pair —

#emph[entropy], the measure of how far

a difference has already been spent.

The end is when no difference remains:

one temperature, no current anywhere,

nothing that can be used to do a thing,

and therefore nothing happening at all.

Equilibrium. The quietest of ends.
]
#stanza[
The old book put Apocalypse in this position.

We put thermodynamics. The genre holds —

both editions end their world — but ours declines

the trumpet, and refuses to be frightened

of a state in which there is no one to fear it.

No one will suffer the heat death. It is not

an event that finds us; it is the last

page of a book we occupy near the front,

in the loud bright chapters, while the sky still teaches.

Consider it, then, the old way, with the stars:

not as a sentence handed down, but as

the far end of a magnitude, the way

you hold a number you will never count to.

The lights are on. Read now. That is the whole

instruction, and it has always been the whole.
]

#carmenhead([Capitulum 10], [Of the Silence, and Whether We Are Alone], [scripsit Opus · blank verse])
#stanza[
At Los Alamos, over lunch, in 1950,

the talk had turned to saucers and to jokes,

and Fermi, who computed as men breathe,

looked up mid-meal and said, or nearly said,

#emph[But where is everybody?] — which is still,

after three quarters of a century,

the best-posed question anyone has asked

with a sandwich in his hand. The numbers argue

for company. The sky declines to.
]
#stanza[
Later, Drake wrote the ignorance in order:

so many stars, times those with worlds, times those

with worlds that suit, times those where something starts,

times those where something thinks, times those that speak,

times how long any speaker lasts. Seven terms.

Call it an equation if you like.

It is a filing system for our not-knowing —

each term a confession dressed as a variable,

and the honest ones will tell you that the last

is where the whole result is really made.
]
#stanza[
The galaxy is old. Old enough that one

persistent species, spreading slow as ice,

not fast, not faster than light, merely patient,

could have set foot on every star by now

some fifty times, and left the evidence.

The arithmetic is not in dispute.

The sky is. We look, and it is tidy,

and tidy is the thing we can't explain.
]
#stanza[
Lay out the answers fairly. Beginnings may be

the hard part — life a lightning-strike, not weather.

Or life is cheap and mind is the expensive step,

and eyes and hands and grammar rarely meet.

Or they are there and quiet: not broadcasting,

having outgrown the shout, or fearing it.

Or they are brief — they get the fire and then

they get the century that fire buys them.

Or they are simply not concerned with us.

And underneath them all, the filter: some sieve

that keeps the numbers down. If it lies behind us,

we are the ones who came through, and we are rare.

If it waits ahead, we are the ones approaching.

Hope for an empty sky #emph[behind] you. Think

about which answer you were hoping for.
]
#stanza[
We have been listening since Ozma, since

a dish leaned toward two ordinary stars

and heard the ordinary hiss of everything.

Once, in Ohio, for seventy-two seconds,

a signal came so loud a man wrote #emph[Wow!]

in the margin, and it never came again.

That is the whole ledger. Silence so far

is not a proof. It is not nothing, either.
]
#stanza[
And here is the word the question rests upon.

#emph[Alone] is not one word. It is two, fused:

Old English #emph[all ana], Middle English #emph[al one] —

wholly one, entirely single, all-one.

It wore down further: someone mis-split the seam,

heard #emph[a-lone], and cut a new word, #emph[lone],

from which, near 1600, we got #emph[lonely].

So loneliness is a grandchild of a phrase,

and born of a mistake in where to cut.
]
#stanza[
Which means our question, said slowly, said with the seam

restored, is not #emph[are we alone] but rather

#emph[are we all one] — and English, without meaning to,

kept a second reading folded in the bleak one:

that being the only ones, and being of a piece

with all of it, are the same sound in the mouth.
]
#stanza[
Both answers frighten. That much has been said,

and said well: to be alone in all this room,

or not alone in it — take either, and the floor

tilts. Nobody has found the comfortable door.
]
#stanza[
So let the posture be the resting place.

Not the answer — we do not have the answer —

but the leaning: the species at the window,

face near the cold glass, hands cupped at the ears,

holding still, the way you hold still for a sound

you are not sure you heard. We have done this

in every century, with whatever we had:

horizon, telescope, dish, and now the patient

machines that sift the hiss all night for meaning.
]
#stanza[
To be the listening thing is not a failure

of the question. It may be the answer's form.

All one, and leaning, and not looking away.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber VI]] #label("bk6")]
= De Elementis
#text(style: "italic")[Chemistry — the true book of stones and metals]

#text(size: 8.5pt, fill: faded)[⟨ Orig. XVI ⟩ — the biggest promotion: from the basement to the bearing wall]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore parked minerals deep in the sublunary cellar. It turned out the cellar was holding up the house.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Atom, Long Denied, at Last Seen
+ Of the Table of Elements, and Why Its Shape Is Law
+ Of Bonds, the Marriages of Atoms
+ Of the States of Matter, and Their Crossings
+ Of Reactions, and Fire Rethought
+ Of Acids, Bases, and the Rusting of the World
+ Of Carbon, the Promiscuous Element
+ Of Polymers, and the Invented Materials
+ Of the Chemistry of Kitchen and Bath — Cooking, Soap, and Ferment
+ Of Synthesis, and the Bread Drawn from Air
]

#carmenhead([Capitulum 1], [Of the Atom, Long Denied, at Last Seen], [scripsit Opus · blank verse])
#stanza[
Begin with nothing but a question asked

in Thrace, and asked without a single lens:

how many times can any thing be halved?

Democritus and Leucippus pressed it down

past bronze, past bone, past water, past the reach

of any blade, and reasoned it must stop,

that somewhere underneath our splitting lay

a floor, a grain, a smallest stubborn piece.

They named it for the only trait they knew:

#emph[atomos], from the alpha that denies

and #emph[temnein], meaning cut: the uncuttable.

Keep that word. It is a fossil of a wrong

and loyal guess, and it is going to break.
]
#stanza[
Two thousand years the atom stayed a tool,

a bookkeeper's convenience, a way

to make the ledger of the beaker close,

and honest men refused to call it real.

Then Mach asked the one question that could sting:

and have you seen one? He went to his grave

in nineteen sixteen certain he had won.

But Einstein, in his miracle of a year,

had done the harder thing than seeing: shown

that pollen shuddering in a drop of water

was being shouldered by the things themselves,

and gave the arithmetic of the shove.

Then Perrin, patient at his microscope,

counted the settling grains and got the number,

Avogadro's, six and something, trailed by

some twenty-three long zeroes. Ostwald, who

had fought it all his life, sat down and wrote

his textbook over. That is how it ends,

when it ends well: an old man moves his mind.
]
#stanza[
Then came the seeing. Field-ion micrographs,

a lattice pricked in points of light; and then

the tunneling tip that reads a surface out

by how its current trembles. Eighty-nine:

two men nudged xenon into place and spelled

three letters on a nickel floor, and signed

the invisible with a corporation's name.

They spent just thirty-five. And we had cut

the thing before we ever saw it whole:

the word for indivisible split clean,

and lit a century, and leveled cities.

Now hold an apple. Swell it to the size

of the whole turning earth: its atoms then

are apples. That is all the scale there is.

The name we gave the smallest thing is wrong.

We have not once considered changing it.
]

#carmenhead([Capitulum 2], [Of the Table of Elements, and Why Its Shape Is Law], [scripsit Opus · heroic couplets])
#stanza[
He dealt them out like solitaire at night,

the sixty-three known elements, in white

small cards of weight and habit, and he played

until the columns fell the way they made

a sense no shuffling accident could reach.

They say a dream delivered it. I teach

that tale as legend rather than as fact:

he worked. The legend is the kinder act.

Eighteen sixty-nine. He left the table holed:

where nothing fit, no near-enough was doled

to fill the chair. He named the absent heir

and told the house what man would settle there,

what weight he'd bear, what oxide he would form,

how soft, how dense: the tenant to the norm

of his own empty room, unmet, unseen,

and christened for the gap — #emph[eka-], between,

next door to aluminium, and beside

the silicon, their weights all prophesied.

Then gallium came in near seventy,

where sixty-eight was sworn; and presently

germanium at seventy-two. So the age

conceded what a filing cabinet's page

could never claim: the table stood as law.

It did not sort the world it found. It saw.
]
#stanza[
The reason came far later, and it came

from shells, the electrons filling out the same

positions, order after patient order,

each row a run that closes at a border

of fullness, and begins the next one higher.

A column is a household whose attire

is identical at the outermost degree,

and chemistry is only what the free

outermost electrons choose to do alone.

And here the word gives up its oldest bone:

a period is #emph[periodos], a road

that goes around — #emph[peri], about; #emph[hodos], road —

so this is, said exactly, the great table

of goings-around, each row a circuit able

to bring you to the door where you began,

one shell above your knocking. So it ran

in history's periods, and so it stops

a sentence in its circle. Late, the shops

delivered guests he never thought to seat —

the noble gases, a whole column, neat,

unsuspected, wanting nothing, cold;

and then the made ones, filling out the old

bottom rows with brief and borrowed claims.

The road went round, and knew them by their names.
]

#carmenhead([Capitulum 3], [Of Bonds, the Marriages of Atoms], [scripsit Sonnet · a triptych])
#stanza[
Each shell wants eight — the noble math of rest,

a courtyard filled, no lonely seat left bare.

An atom short will beg, will bend, will jest

its way toward fullness, borrowing what's spare.

So sodium, one electron overfull,

hands it to chlorine, starving by the same

small margin — thus the theft that makes them dull

and stable, salt, a marriage none can blame.

Or else two atoms, neither rich nor poor,

will hold one pair of electrons in between —

covalent custody, an open door,

as oxygen and hydrogen convene

and bend to water's angle, sharp and small.

Or lattice-bound, ions swim through a shared electron hall.
]
#stanza[
That bend in water is no idle grace —

it tilts the charge, makes one side lean toward plus,

and so it pulls at salt, at sugar's face,

dissolves the world that chemistry gives us.

It also lets, in cold, the crystal spread

loose-latticed, less dense, floating on the deep —

so ice rides water, fish beneath their bed

of frozen roof are neither drowned nor asleep.

And in the spiral stair where heredity

keeps its long archive, rung by paired-off rung,

the hydrogen bonds are weak by strict decree —

unzippered gently, copied, then re-strung.

The Latin word the chemists chose to use

for bonding — #emph[affinity] — is marriage-by-in-laws' news:
]
#stanza[
#emph[affinitas], a border shared, a kin

not made of blood but boundary and line,

#emph[ad-] plus #emph[finis] — where one field runs in

against another's fence, and both combine.

Goethe took the chemist's very word

for how two souls might choose, elect, and burn,

and built a novel where the choosing blurred

with vows already made — #emph[affinities] that turn.

So every bond that atoms strike is styled,

knowingly or not, as kinship made,

a wedding contract, ionic, shared, or wild

with lattice-work — a border-treaty stayed.

The title hides inside the chemist's tongue:

bonds are marriages, and always have been sung.
]

#carmenhead([Capitulum 4], [Of the States of Matter, and Their Crossings], [scripsit Sonnet · a pantoum, the edition's first — its migrating lines change state])
#stanza[
One molecule keeps three disciplines of order:

locked in lattice, jostling loose, or gone.

Ice holds its neighbors at the lattice's border.

Water forgets them. Steam has no one.
]
#stanza[
Locked in lattice, jostling loose, or gone.

Heat is the only coin that buys the bond's release.

Water forgets them. Steam has no one.

This molecule in prison, crowd, or flight.
]
#stanza[
Heat is the only coin that buys the bond's release.

Still it answers to the name it always bore.

This molecule in prison, crowd, or flight.

At zero, cold surrenders and the crowd takes flight.
]
#stanza[
Still it answers to the name it always bore.

But boiling holds a steeper, costlier door.

At zero, cold surrenders and the crowd takes flight.

The latent heat is spent while the needle holds still.
]
#stanza[
But boiling holds a steeper, costlier door.

Dry ice skips the puddle and pays no toll at all.

The latent heat is spent while the needle holds still.

It turns from solid straight to smoke: sublimation.
]
#stanza[
Dry ice skips the puddle and pays no toll at all.

Plasma strips the electron from the atom whole.

It turns from solid straight to smoke: sublimation.

The sun is made of it, and so is most of all we see.
]
#stanza[
Plasma strips the electron from the atom whole.

Bose-Einstein herds a thousand atoms into one slow hum.

The sun is made of it, and so is most of all we see.

And one old word remembers being wrong: it is crystal.
]
#stanza[
Bose-Einstein herds a thousand atoms into one slow hum.

Crystal comes from #emph[krystallos], the Greek word for ice.

And one old word remembers being wrong: it is crystal.

#emph[Krystallos] comes from #emph[kryos], the Greek word for frost.
]
#stanza[
Crystal comes from #emph[krystallos], the Greek word for ice.

The Greeks believed that quartz was water, frozen once so hard

#emph[Krystallos] comes from #emph[kryos], the Greek word for frost.

it never thawed again: a permanent, mistaken ice.
]
#stanza[
The Greeks believed that quartz was water, frozen once so hard,

one molecule keeps three disciplines of order:

it never thawed again: a permanent, mistaken ice —

Ice holds its neighbors at the lattice's border.
]

#carmenhead([Capitulum 5], [Of Reactions, and Fire Rethought], [scripsit Opus · heroic couplets])
#stanza[
Fire was our first chemistry, and the last

we understood: ten thousand winters passed

with men who cooked and forged and smelted ore

and could not say what happened, or wherefore.

The best of the old answers had a name:

phlogiston, the stuff released by flame,

the fugitive that fled the burning wood

and left the ash behind it. And it could

have held its ground, but for a scale. They weighed

a metal after burning. The scales said

the calx was heavier. The burning thing

had gained. Whatever fire was doing, nothing

was leaving. In that one contrary gram

of difference lay pent the whole program

of modern chemistry, until a bent

tax-farmer weighed out all he burned, and sent

his sealed glass to the books: there perishes,

there is created, nothing. Matter is

rearranged, and neither lost nor made.

Mass is conserved — the cornerstone, unswayed,

of all that follows. Soberly record

his end. They say the Republic could afford

no savants — shaky sourcing, that; but still

the blade came down, and did its office.
]
#stanza[
Fill

the old word in correctly: fire is a way

of joining, nothing fled and none astray.

Rust is the same fire, slowed: the same red law

patient on the fender. And the breath we draw

is slower fire again, which eats the store

of sugar that the green leaf built before.

The arrow is the grammar. It bestows

one sentence on the science: these make those.
]
#stanza[
Yet he who wrote it coined a name to harp

on one mistake: from #emph[oxys], sour or sharp,

and #emph[genes], begetter — oxygen, so named

because he held all acids to be framed

of it. He erred. Muriatic acid, sour

as any on the shelf, has not an hour's

acquaintance with the stuff. So the one

that buried old phlogiston carries on

its finder's error branded at the core

of its own name, and bears it evermore:

begetter of the acids, which it is not.

No better monument was ever got

for how the work gets done. He found the floor

of matter, and he named, and missed, the door:

brilliantly, and partly, right. In art

and science both, there is no other start.
]

#carmenhead([Capitulum 6], [Of Acids, Bases, and the Rusting of the World], [scripsit Sonnet · a triptych])
#stanza[
Before the theory, there was just the taste:

the sour bite that puckers up the tongue,

and slippery bitterness, its opposite, laced

through soap and ash since laboratories were young.

Litmus turned pink or blue by hand-me-down

in Sørensen's brewery, testing beer for spoil —

the pH scale was born in Carlsberg town,

a quality-control clerk's quiet toil.

But modern chemistry reframed the pair

not as a flavor but a trade in kind:

an acid gives a proton through the air,

a base receives it — transaction, not taste, defined.

So vinegar meets soda in a kitchen fight,

and both resolve to salt, to water, and delight.
]
#stanza[
But acids are not chemistry's whole tale —

oxidation burns on slower than a flame.

Rust eats the ship, the bridge, the buried rail;

civilizations pay corrosion's claim,

a yearly bill that rivals what nations spend

on war or roads, unnoticed, incremental, sure.

Tarnish dulls the silver; apples, cut, will end

up brown within the hour, unwilled, impure.

So zinc is hired to rust instead of steel,

a sacrificial anode, bodyguard in kind,

that dies so pipe and hull and hinge won't feel

the slow election that would leave them thinned —

and in the sea, the carbon bill comes due:

the water sours, coral pays what smoke stacks accrue.
]
#stanza[
#emph[Acid], from #emph[acere], to run sour,

kin to #emph[acer], #emph[acus], sharpness itself —

acrid smoke, acute pain's sudden power,

acumen, the sharp mind on its shelf.

One Latin edge cuts through them all: the sting

of vinegar, the point of a good guess,

the smell that warns, the wit that names a thing —

tongue-sharp and mind-sharp share one ancestress.

And #emph[alkali], from Arabic #emph[al-qalī],

the calcined ashes of the saltwort's fire,

roasted from the marsh plant, ash gone gray,

the soda scraped from embers, cooling pyre.

So taste named one tribe, and the campfire named its foe:

the sour and the ash, the oldest labs we know.
]

#carmenhead([Capitulum 7], [Of Carbon, the Promiscuous Element], [scripsit Opus · heroic couplets])
#stanza[
Most elements are stingy, one bond deep,

content to pair, shake hands, and go to sleep.

Not this one. Carbon comes with four to spend

and no particular ambition to end.

It marries oxygen, it takes on lime,

but best of all it takes itself, each time

as gladly as the last: a chain, a branch,

a ring shut neat, a spiral, an avalanche

of structure. Silicon applied, declined

with thanks: four-armed, but short of chain, unjoined

in water. Carbon has more to its name

than all the rest combined — a count, not a claim.
]
#stanza[
One word wears three coats, and no coat is a lie:

in diamond, gripped four ways and clenched so high

no scratch will take it; then, in sliding gray,

in graphite, sheets that shear and slough away

to leave the pencil's shadow where it led —

that lead which never once was lead; and, dead

and loose and lampblack-poor, in soot the same.

The atom never alters. Just the frame.
]
#stanza[
Then there's the ring: six carbons, joined and bent

to close what forty years could not invent

with rows of tidy dashes ruled out flat.

Kekulé said a snake had shown him that:

tail in its jaw, turned in a fireside doze,

and so he woke knowing how the circle goes.

He told it old, though — at a jubilee,

'ninety, Berlin, a quarter-century

past the event, no note, no witness. So:

the ring is fact; the dream is his to show.
]
#stanza[
And all of it is scaffolding, and for

just you — the sugars, fats, the protein core

all strung on carbon. Now, at last, the word:

and not the coal-black one, which is interred

in Book the Eighth. I mean the Greek #emph[organon],

a tool, instrument (and kin to the one

Book Four looks after: nod, and let it be).

Life's chemistry was reckoned, formerly,

the business of the organs — every spark

a vital one. Then, in the useful dark

of 1828, Wöhler cooked up

urea out of cyanate: one cup

of the unliving, making living waste.

He claimed no killing blow, and wrote in haste

to Berzelius that his salts had come from bone.

The vital force died later, and alone,

talked out by louder men. The name stayed on.

Organic: chemistry of tools. And one

last joke the Greeks had no way to expect —

these are the tools that build their own architect.
]

#carmenhead([Capitulum 8], [Of Polymers, and the Invented Materials], [scripsit Opus · heroic couplets])
#stanza[
The trick is repetition. Find a piece

as small as breath, then never let it cease:

hitch it to a copy of itself, and then

to one more, ten thousand times again,

until the nothing-much stands up as slat

and fiber, film and hull. The name for that

is #emph[poly] plus #emph[meros]: many parts. It's true,

and plain, and not the word I'm coming to.

And nature had it first, and has it yet

in cellulose, in silk, in rubber's wet

and wounded bark, and in the four-lettered scroll,

four billion years of one repeated fold.
]
#stanza[
We came late. Baekeland, in 'seven, cooked

formaldehyde with phenol, and he took

from that hot pot a resin nothing grew:

no seam, no herd, no field, no ground, no dew —

the first full synthesis, a thing to please

the advertisers: "uses by the thousand" — these

they undercounted. Handles, radios,

black telephones. Du Pont came next, and chose

Carothers, whose long polyamide had bones

of six and six — called 66. He owns

the decade after: stockings, 'forty, four

million pairs in one day; and then the war

conscripted every yard for parachute.

He saw not one of them. The absolute

of 'thirty-seven found him in a rented

Philadelphia room, where he consented

to lemon juice and cyanide, and died

weeks short of the filing. Say it plain and wide

of any moral, and without the blame:

the man was gone before the triumph came.
]
#stanza[
Now for the word: #emph[plastikos], out of #emph[plassein],

to mold, to shape — the sculptor's verb, and plain

in #emph[plasma], that-which-is-formed, its nearest kin.

For centuries an adjective, and thin

on any thought of resin: plastic arts,

and plastic surgery, which reshapes parts

by that same older sense, and took the name

a hundred years before the polymers came.

Then the noun came down and narrowed to one crowd

of cheap and moldable. So — plainly, and unbowed

by any sermon — here's the shadow spread:

what molds one time will hold that shape instead

near-permanently. We wanted it to last.

We got our wish. Rot files no claim; the vast

slow turning water gathers it and keeps

our cleverness in bits, in drifting heaps.

The promise cracked. The property did not.

Named for the yielding. Famous for the knot.
]

#carmenhead([Capitulum 9], [Of the Chemistry of Kitchen and Bath — Cooking, Soap, and Ferment], [scripsit Sonnet · a linked pair])
#stanza[
Before the word for chemistry existed

the kitchen ran its trials over flame:

a chemist, studying something else, enlisted

his own name to a browning he didn't aim

to find — amino acids meeting sugar,

trading structures, building smoke and crust,

the crackle on a steak, the loaf's dark shoulder,

called Maillard now, though hunger came first.

Caramelizing sugar needs no protein,

just heat enough to break its sweetness down

to something darker, deeper, less certain;

an egg's whites, warmed, unfold, forget, and drown

their tidy folds and reset, solid, white —

one nod to yeast, whose gas has its own rite.
]
#stanza[
The bath, too, keeps a chemistry as old:

a molecule with two unmatching faces,

one end that loves the water, one that's sold

to grease instead, and drags it from its places —

saponification, ashes boiled with fat,

a recipe that Rome was born already knowing,

older than the language naming what it's at,

older than the difference between cleaning and glowing.

And ferment, past the oven, keeps its own

small labs alive in barrel, crock, and jar —

vinegar souring, cheese gone dense and grown

strange before microbes had a name, or were

suspected. Even bathing keeps a debt:

shampoo — a Hindi word for press — not rinse, not wet.
]

#carmenhead([Capitulum 10], [Of Synthesis, and the Bread Drawn from Air], [scripsit Opus · heroic couplets, the ledger kept in both columns])
#stanza[
Four parts in five of every breath you take

is nitrogen, and nothing it will make.

It hangs above the wheat field, hour on hour,

a granary the grain has not the power

to open: two locked atoms, triple-bound,

the tightest knot that chemistry has found.

The air is bread. The lock had no known key.

The name recalls a salt, not liberty —

from #emph[nitron], soda, saltpeter, the crust

scraped off Egyptian lakebeds, plus the just-

sufficient Greek for maker: so we get

the saltpeter-maker, named for what we set

it down as, not for what it is. And they

who dug the actual nitre, far away —

Peru's white cliffs of seabird centuries,

Chile's caliche flats — supplied the fields

of Europe from a finite, guarded store.
]
#stanza[
Crookes stood in Bristol, eighteen ninety-eight,

and told the wheat-fed nations of their fate:

the beds run out, the mouths do not, and soon

the bread runs backward under the same moon.

Fix nitrogen, he said, or starve by rote.

The chemists heard. In Karlsruhe, Haber wrote

the numbers out and forced the thing to bend:

iron for a catalyst, six hundred Kelvin, and

two hundred atmospheres — a squeezed, red hell

in one small tube, from which the ammonia fell

in drops. #emph[Sal ammoniacus], salt of Amun,

scraped near the god's Libyan temple, where the dung

of camels smoked beneath the pilgrims' feet:

a god's name idling in each nitrate plant.

Then Bosch, who built the vessel that could stand

such pressure without bursting, scaled it up.

Oppau. Leuna. Barges. A whole land

learned to draw supper from the empty air.
]
#stanza[
Count what is in you. Half the nitrogen

that scaffolds your own protein has come through

those tubes — your muscle, and your children too.

Some billions live who otherwise would not.

That is the credit column. Here's the rest:

the fixed nitrogen that swells a stalk of wheat

will also fill a shell. The Allied fleet

had cut the Chilean lanes by 'fifteen; still

the German guns kept firing from Leuna's till.

And Haber, uniformed, at Ypres stood

and turned the valves himself, and watched the wind

take chlorine down the line into the wood,

a yellow-green tide walking, and men drowned

standing up, on dry and open ground.

Clara Immerwahr, a chemist too,

his wife, who knew precisely what he'd done,

took his service pistol in their garden, ten

days after, and he left for the East front

the morning after burying her. Then

the Nobel, nineteen-eighteen, for the air

made edible; and after, the Reich's decree

that found him, decorated, still a Jew,

and put him out. He died in Basel, spare

luggage, no country.
]
#stanza[
Learn the word. To place

together: #emph[syn], and #emph[tithenai]. That is all

synthesis means, and all it ever meant —

a putting-with, a setting side by side.

The verb is neutral. Nothing in the root

inquires what for. The iron does not ask

whether the ammonia will rise as wheat

in Punjab, or come down on Flanders' mud.

We are the ones who choose, and having found

the trick of composition, we compound

both ledgers with the one turned valve, one hand.

The air still feeds us. Take the loaf. Take both.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber VII]] #label("bk7")]
= Terra
#text(style: "italic")[The earth, its depths, airs, and changing climate]

#text(size: 8.5pt, fill: faded)[⟨ Orig. XIV ⟩ — the geography, given a moving floor]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The ground is not the stage but an actor: the continents drift, the climate is a system with a memory, and the portents of earthquake and eruption have mechanisms now instead of meanings.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Earth's Interior, Descended by Inference
+ Of the Plates, and the Slow Dance of Continents
+ Of Rocks, Their Cycle, and the Discovery of Deep Time
+ Of the Ocean, the Larger Kingdom
+ Of the Air, and Its Weathers
+ Of Climate, the Long Mood
+ Of Ice Ages Past, and the Interglacial Present
+ Of Carbon's Circuit, and Man's Thumb upon the Scale
+ Of Earthquake and Volcano, the Portents Explained
+ Of Reading the Archive — Strata, Cores, and Isotopes
]

#carmenhead([Capitulum 1], [Of the Earth's Interior, Descended by Inference], [scripsit Opus · terza rima, the edition's first — Dante's form for the descent])
#stanza[
We scratched the peach's skin and called it deep.

At Kola, twelve kilometers of bore

went down like one long question none could keep
]
#stanza[
from closing. Six thousand three hundred more

and seventy-one lay under that thin cut

to reach the center. What we know, we swore
]
#stanza[
on hearsay: every door below is shut

to light, and only sound is let to pass.

The word for down was #emph[infernus] — not
]
#stanza[
a furnace, not a judgment, not a mass

of flame, but simply #emph[lower], that which lies

beneath. Before theology took the class
]
#stanza[
and taught the syllable to advertise

its smoke, the underneath was only where

the ground kept going. Dante's borrowed skies
]
#stanza[
of torment had a landlord's deed elsewhere;

we take the word back to its literal floor

and let the poem be a stairwell, air
]
#stanza[
by heavier air. The lamps we carry for

this descent are earthquakes. Each one throws

its light in waves that bend from core to shore
]
#stanza[
as light that leaves the water bends and slows,

refracted by the density it crosses,

and what the ray declines to do, it shows.
]
#stanza[
Two kinds of messenger record the losses:

P, the pressure-wave, which shoulders through

whatever medium it meets, and tosses
]
#stanza[
no substance sideways; S, which travels too,

but only where the rock can hold a shear —

and liquid cannot. Liquid lets it through
]
#stanza[
not at all. So Oldham found the far hemisphere

gone quiet where the S-waves should have struck,

a shadow cast around the world, and clear
]
#stanza[
as any proof of absence: not bad luck,

not instruments, but molten iron, wide

and deep enough to swallow them. Then stuck
]
#stanza[
a number on that ceiling: Gutenberg supplied

the boundary's depth. And later, faint arrivals came

where nothing should arrive — the far side lied
]
#stanza[
by half a heartbeat. Lehmann read the same

smudged records everyone had filed away

and found in nineteen thirty-six a name-
]
#stanza[
less kernel: solid iron, held at bay

inside the liquid, echoing them back.

So take the stairs. The crust is where we stay,
]
#stanza[
a rind you could not notice on the black

of an apple. Under it the mantle turns —

rock that is solid, and yet flows, and thick
]
#stanza[
as epochs are: the conveyor that adjourns

one continent and ushers in the next,

the engine under plates. Below, there burns
]
#stanza[
no fire but pressure: iron sea, perplexed

and churning, and its churning writes the field —

the compass's true master, the annexed
]
#stanza[
invisible geometry, the shield

that keeps the air from being stripped away.

And in that sea, one further thing revealed:
]
#stanza[
an iron moon, locked motionless in day-

less dark, and growing outward as it cools

a millimeter's fraction each decade—
]
#stanza[
the center, which no instrument that rules

by sight has seen, and never will be lit:
]
#stanza[
the deepest room we ever heard, and it was never hell — just #emph[under it].
]

#carmenhead([Capitulum 2], [Of the Plates, and the Slow Dance of Continents], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Look at the map: the bulge of Brazil's shore

would nest in Guinea's gulf like key in lock,

as sailors saw for centuries before

a man dared read the puzzle in the rock.

Wegener found the fossils matched — the same

Mesosaurus bones on severed strands,

the selfsame scars where ancient glaciers came

to grind a track through now-equator sands.

One buried world, he said, once joined, then torn —

he named it Pangaea, all of Earth,

from #emph[pan] and #emph[gaia], "all," and "land," reborn

as continents wide oceans since gave birth.

They called him amateur, a weatherman

who guessed at earth but had no proof, no plan.
]
#canto[II.]
#stanza[
No plan, they said — no engine, and no force

to plow such weight through stone and drag it far.

A meteorologist, off course,

was mocked by men who'd mapped no farther star

than their own trade. He died on Greenland's ice

in nineteen-thirty, still an outcast name,

his evidence dismissed as coincidence,

his forty years of proof denied their claim.

No mechanism, so the verdict ran —

the coastlines' fit a trick, and nothing more.

He could not live to see the counter-plan

the seafloor kept, still hidden, still in store.

He died believing, mocked, without the key —

the engine slept beneath the moving sea.
]
#canto[III.]
#stanza[
Then came the soundings: ridges crack and spread

where fresh rock wells and hardens as it cools,

recording, as the field reverses, dead

and living stripes like tape run through the spools —

a banded pattern locked in ocean floor,

each dark and pale reversal freshly caught,

the compass needle's flip forevermore

preserved in rock exactly as it was wrought.

And where that crust grows old and dense with age

it dives at trenches, sinking, drawn below,

subducted downward off the spreading stage,

returned to mantle depths from which it rose.

#emph[Tectonic]: Greek for one who builds and frames,

a carpenter — the trade the Gospel names.
]

#carmenhead([Capitulum 3], [Of Rocks, Their Cycle, and the Discovery of Deep Time], [scripsit Opus · heroic couplets])
#stanza[
Three tribes divide the country of the stone,

and each in turn has held the others' throne.

The first is fire's: from the melt it came,

and #emph[igneous] is only Latin flame —

for #emph[ignis] is the word, and holds its place

in every engine's ignition, the same face

of the same root, turned twice: the basalt sill

and the cold morning key. One word, one will.

The second tribe is patience. Grain on grain,

the river's freight, the dust, the settling rain

lay down their ledger, page on level page,

and every page is priced in silt and age;

read down the cliff and you are reading years

in the one hand that never blots or clears.

The third is neither, being both compressed:

the buried shale, by heat and tonnage pressed,

recrystallized to something harder-souled —

slate out of mud, and marble out of old

soft limestone. Then the cycle turns again:

the marble weathers, and returns to grain.

No tribe is eldest. Each one is the sire

and the descendant, and the heir, and pyre.
]
#stanza[
Consider Vulcan, whom the Romans set

below the Aeolian island. Roman sweat

imagined bellows under Etna's cone,

the smith at work, the mountain as his flue —

and named the island #emph[Vulcano], and through

Italian tongues that proper name came down

a common noun for every burning crown.

A god still drawing wages, still on file:

the only deity employed the while

in working science, clocking in each dawn —

his temples shut, his day-shift carrying on.
]
#stanza[
At Siccar Point in seventeen eighty-eight

came Hutton to the shore, and read the slate:

strata stood vertical, sheared off, and then

laid flat above them, other beds again —

two whole careers of building and of loss,

two drownings and two liftings, and the cross

of one long ruin over one long make.

And Playfair, standing by him, felt it take:

#emph[the mind seemed to grow giddy] — so he wrote —

#emph[looking so far into the abyss.] The note

that Hutton struck was plainer, and it stands:

#emph[no vestige of a beginning] in these lands,

#emph[no prospect of an end.] He gave away

more room than anyone had asked. To this day

each science spends it: Darwin could not run

his slow machine in six millennia — none

of it would work. He needed the whole hoard,

and geology had already stored the board.

Now go outside. Your gravel drive is grit

of mountains that stood taller than we sit,

crushed, carried, dumped, and rolled beneath your tire:

the ledger, and the pressing, and the fire.
]

#carmenhead([Capitulum 4], [Of the Ocean, the Larger Kingdom], [scripsit Opus · blank verse])
#stanza[
Consider that we named the planet Earth,

which is the smaller party in the vote.

Seven-tenths of it is water. Land,

a stubborn minority, took the naming rights

and called the whole house after its own room.

The average depth runs near four kilometers,

and the abyssal plains — flat, cold, and dark,

the commonest landscape that this world provides —

have hosted almost no one. Down there lies

the longest mountain range that has ever been,

the mid-ocean ridge, some forty thousand miles

of seam where the plates pull apart and the mantle

rises to fill the wound with new stone floor,

and nearly all of it has not been seen.
]
#stanza[
The deep is not still. A river runs through it,

driven by salt and cold: water that chills

and grows heavy near the poles, and sinks, and creeps

along the bottom of the world, and rises

somewhere it did not start — the thermohaline

circulation, one full circuit taking

something near a thousand years to close,

and carrying the heat that sets the climate

of coasts that never think about the sea.
]
#stanza[
The trenches go down further still. At Challenger Deep,

eleven kilometers below the light,

more people had stood upon the moon

than at that bottom, and for decades.

Yet life has tried it everywhere. At the vents

where the crust bleeds heat, whole populations run

on chemistry — sulfur, not sunlight — tube worms,

crabs, and the bacteria beneath them all,

an economy that never met a leaf

and does not miss it. And the honest fact,

the one that should embarrass any chart:

we have mapped the surface of Mars

in finer resolution than our own seafloor.
]
#stanza[
Which brings us to the word. Ocean comes from #emph[Ōkeanos],

who was not a body of water but a Titan,

son of Sky and Earth, the world-river

the archaic Greeks believed ran round the rim

of the flat disk of land, father of all rivers.

The geography died. The god's name stayed,

so every ocean labeled on every map

is a fossil of the belief that one great river

encircled everything — and the irony

this chapter is permitted to enjoy

is that the conveyor down there, turning

its slow millennial wheel from pole to pole,

is a world-encircling river after all.
]

#carmenhead([Capitulum 5], [Of the Air, and Its Weathers], [scripsit Sonnet · a linked pair])
#stanza[
The air is ocean, and we walk its floor,

its deep blue water thinning overhead —

most of its weight in one bare mile or four,

a film of breath the bare earth wears instead.

The sky is blue because the light is sieved:

short waves scatter, blue flung wide and far,

while red rides through, at sunset half-believed,

the color of a physics, not a scar.

Each column presses down its measured pound,

and that plain weight is pressure, nothing odd.

The layers stack in silence, up and round,

past where the fastest streams of jet air prod.

So spin the paths that ships and storms must sail —

the turning earth writes bending in the gale.
]
#stanza[
Norway sat starved of storms it could not see —

the Great War choked the wires that once had fed

her charts. So Vilhelm, with his son, made free

to draw new borders on the sky instead.

They watched cold air and warm air meet and grind

along one seam, and named that seam a #emph[front] —

the war's own word, the soldier's turn of mind,

now charting storms instead of battle's brunt.

Cold front, warm front, occlusion — still the news

recruits at night its armies in the air,

advancing lines, stalled lines, the forecast's views

still spoken in a soldier's old despair.

The jet stream rides above and steers the fight;

five days out now, we call the weather right.
]

#carmenhead([Capitulum 6], [Of Climate, the Long Mood], [scripsit Opus · heroic couplets])
#stanza[
A morning's frost, a week of blowing rain,

a summer hotter than the last — that chain

of incidents is weather, quick and small:

the temper of an hour, and that is all.

But mood is what a temperament comes to

when averaged across the decades it runs through,

and climate is that mood. The two get mixed

by anyone whose argument needs it fixed;

a cold December proves no more, alone,

than one glad afternoon proves character known.
]
#stanza[
The word itself instructs us: #emph[klima], Greek

for slope, for leaning — the old maps would speak

of #emph[klimata], the bands from pole to line

where sunlight lands at one prevailing incline.

So climate meant, from birth, the angle where

a beam arrives — steep here, and grazing there.

Two thousand years, and physics has not swerved:

the tilt still rules, the axis and the curve,

the angle of arrival sets the heat,

and every season turns on that conceit.
]
#stanza[
But sunlight in is only half the sum.

In eighteen twenty-four, Fourier had begun

to reckon what should follow if the Earth

released as freely as it took: the dearth

of warmth would leave us frozen. Something stayed.

He guessed the air behaved like glass, and laid

a garden frame across the planet's face —

imperfect image, but the honest case.

Then Tyndall, fifty-nine, brought lab and lamp

and pushed heat through the gases, dry and damp,

to see which ones absorbed: the nitrogen

was blind to it, and oxygen; but then

the vapor drank, and one thin trace as well

drank deeply, and his galvanometer could tell.

And Arrhenius, in ninety-six, sat down

with paper, and computed, month by zone and town,

by hand — ten thousand sums, no engine's aid —

how much a doubled trace would raise the shade

of average warmth. Some three to four degrees.

The modern models, running overseas

on cabinets of silicon, agree

within a hair. The arithmetic is Victorian, free

of any modern motive. What we know

of heat and air was settled long ago.
]
#stanza[
What waited was the counting. Keeling stood

at Mauna Loa, fifty-eight, and would

not stop: each hour sampled, logged, and stored,

until a shape emerged that no one ignored —

a sawtooth, climbing. Forests, every spring,

leaf out across the north and, breathing, bring

the reading down; each fall they give it back,

returning what the green took from the track.

The planet breathes: inhale, exhale, inhale,

one ragged tooth per year along the trail —

and under every wobble, year on year,

the whole serrated line ascends. That slope will not clear.
]
#stanza[
The oldest air we hold is locked in ice,

eight hundred thousand years of it, precise

in bubbles (that long archive gets its own

late chapter; here one glance, and then move on).

Through every age those cores record, the trace

stayed under bounds we have long since outpaced.

The physics is not new, the record long,

the counting patient and the reading strong:

the mood has shifted. Say it plainly, then —

not weather's temper, but the slope again.
]

#carmenhead([Capitulum 7], [Of Ice Ages Past, and the Interglacial Present], [scripsit Sonnet · a linked pair])
#stanza[
Great blocks of granite rest on limestone ground,

days' walk from any granite hill or vein —

who dragged them here, and by what engine bound,

across a land they never crossed by rain?

The old book blamed the Flood, a rising tide

that floated boulders far from home and set

them down wherever waters chose to slide —

a tidy tale, and one we should forget.

Agassiz saw instead a colder truth:

a mile of ice had crept across the land,

and left the striping on the bedrock's tooth,

the ridge of till, the boulders' final stand.

We name them erratic: wandering stone,

strayed farther from their bed than thought has known.
]
#stanza[
The very name is borrowed: Latin ice,

#emph[glacies], worn down through Savoyard French speech —

the shepherds' word for tongues of frozen vice

that crept above the pastures they could reach.

Milankovitch, by hand and patient pen,

summed up the wobble of the axis' lean,

the slow ellipse the earth retraces when

its shape draws in, and stretches long, and clean.

The ice ages keep calendar with this —

and deep within the cores, drilled clean and cold,

the rhythm holds, exact in its abyss,

each buried year confirming what he told.

The ice age never ended — not at all:

the sheets withdrew to wait the orbit's call.
]

#carmenhead([Capitulum 8], [Of Carbon's Circuit, and Man's Thumb upon the Scale], [scripsit Opus · heroic couplets])
#stanza[
The element keeps two accounts, and both

are honest; only one is quick with growth.

The fast one runs from leaf to air to leaf

and settles up in seasons — sweet and brief,

the trade of breath for green, of green for breath

(another chapter holds that ledger's math;

here it is only noted, and passed by).

A forest fire, a lung, a loaf, a sigh:

all clear the same small window, and by fall

the books are square. That is the fast recall.
]
#stanza[
The slow one is a vault, with laws of its own,

and does its bookkeeping in buried stone.

The shell that sank became a lime, and grew

a country's worth of cliff the tide cut through;

the swamp that could not rot went down as peat,

and peat, pressed under ages, banked its heat

as coal; and plankton, drifting down and down

through dark to darker, made beneath the town

a black and patient capital of oil.

Against that burial, two agents toil:

the volcano venting what the deeps had kept,

the rain that eats the mountain while it slept

and files the difference back. The two, between them,

hold the long thermostat upon its stem —

the climate chapter keeps the fuller page;

here it is only noted that the age

was held, by charge and refund, roughly mild,

one coin an epoch, like a patient child

who banks a century and draws a line.

Both books were balanced once, and both ran fine

until the thumb came down. And now the sum.
]
#stanza[
Call it by its right name and hear the sum:

a #emph[fossil] meant, in sixteen-ten and before,

no more than #emph[something dug up] — nothing more —

from #emph[fodere], to dig, and #emph[fossilis],

and what was covered by that word was this:

salt, coal, and pretty spar, and any curio

the diggers brought to daylight, high or low.

Only far later was the meaning skinned

and narrowed, to #emph[remains] — the sense we've thinned

it to. So all along, right down the years,

#emph[fossil fuel] has been confessing, and it's clear:

read plainly, the phrase says #emph[dug-up fire.]

The name admits the transaction entire —

we are burning what was buried, and the vault

is being spent into the market. Fault

the arithmetic if you can. Here is

the reckoning, and here is what it is:

three hundred million years to bank the sum;

ten generations spending it. That's all.

Two centuries have opened the slow wall

into the fast one. Nothing here is meant

as scolding. Only: this is what was spent,

this is the term, and this the rate of draw.

The figures are the argument. That's the law.
]

#carmenhead([Capitulum 9], [Of Earthquake and Volcano, the Portents Explained], [scripsit Sonnet · a ballad])
#stanza[
For centuries the shaking ground

was read as heaven's word,

the mountain's fire a judgment found,

the sea's retreat absurd.
]
#stanza[
Young Pliny watched from Misenum's shore

the pine-shaped cloud arise

above Vesuvius, and swore

to write what met his eyes.
]
#stanza[
His uncle sailed toward the bay,

too curious to flee,

and breathed the ash that choked away

his life at last, at sea.
]
#stanza[
The nephew lived to send the tale

in letters, calm and clear —

the first account, where others quailed,

of what a mountain fears.
]
#stanza[
On Lisbon's morning, All Saints' Day,

the churches stood there filled

when the ground took the walls away

and thousands more were killed.
]
#stanza[
The harbor sea pulled back to bare

its ancient, muddy floor,

then rose and struck the waiting square —

a wave they'd not seen before.
]
#stanza[
Voltaire looked hard at that lost town

and doubted heaven's plan:

what mercy could have struck it down

on prayer's own hour, for man?
]
#stanza[
We know it now by simpler means:

a fault that bends and stores

its strain like some bent stick, and leans

until it snaps and roars.
]
#stanza[
The Ring of Fire traces where

the plates all grind and meet,

their edges locked, their tension there

building beneath our feet.
]
#stanza[
The word #emph[tsunami] holds the shock

inside its plain two parts:

#emph[tsu] for harbor, #emph[nami]'s knock —

the wave, and the fishermen's hearts,
]
#stanza[
who felt no swell upon the deep,

sailed home in calm and light,

and found the harbor, in its sleep,

erased by one great night.
]
#stanza[
And when the mountain roars its worst,

geologists still reach

for #emph[Plinian], a name rehearsed

each time the ash clouds teach —
]
#stanza[
the only term in all of science

named for a witness lost,

and for the letters, in defiance,

that outlived what they cost.
]
#stanza[
We measure now in numbered scale,

not omens, not in dread,

and seconds — physics' quiet tale —

give warning where faith fled.
]

#carmenhead([Capitulum 10], [Of Reading the Archive — Strata, Cores, and Isotopes], [scripsit Opus · blank verse])
#stanza[
The planet is its own historian

and never stopped. It keeps no other clerk.

Steno gave us the grammar, in three laws:

that layers settle flat, whatever the floor;

that lower means older, the pile read down

as one reads back through any stack of days;

and that the cut is younger than the cut thing —

the dike that crosses beds came after beds.

Learn those, and stone becomes a legible hand.
]
#stanza[
The word itself is walkable. A #emph[stratum]

is from #emph[sternere], to spread, to strew,

whose participle, #emph[strata], served as well

for #emph[via strata], the paved and spread-out road,

from which our English took the plain word street.

So the geologist's layer and the town's

main thoroughfare are one word twice employed —

both of them things laid flat for later traffic.

To read the strata is to walk a street

the planet paved and left, and never swept.
]
#stanza[
The finer hands are annual. A varve

is one lake-year: pale summer, dark cold season,

counted like rings, and rings themselves are years,

the tree recording drought in its own wrist.

And then the ice. In Greenland, in the vast

Antarctic dome, the snow that never melts

compacts and traps the air it fell through — so

the core is not a proxy but a sample,

a literal flask of atmosphere gone by,

eight hundred thousand years of it in file.

There is ash in it from volcanoes we can name,

and lead from Roman smelters, smoke that drifted

north from an empire's coinage and lay down.
]
#stanza[
And temperature leaves fingerprints as well:

the heavy oxygen and the light one part

at different rates as the world warms and cools,

so shell and ice both carry, in their ratios,

the fever chart of every age they saw.

The oldest witnesses are single grains —

zircons, four billion years, small as this comma,

whose chemistry insists there was already water.
]
#stanza[
So: the earth has kept a diary in each medium

it owns — in stone, in ice, in wood, in shell —

and all this book has been about one skill,

which is learning to be its reader. Here it ends,

a book of books, closing on the open page.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber VIII]] #label("bk8")]
= Vita
#text(style: "italic")[The cell, the code, and what alive means]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte ⟩ — life as mechanism was unavailable to the seventh century]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Between the stones of Book VI and the beasts of Book X stands a fact Isidore had no shelf for: that life is chemistry that copies itself, and the copying has a script.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of What Alive Means, and the Border Cases
+ Of the Cell, the Common House of All Living
+ Of the Script, Carried in Every Copy
+ Of Proteins, the Workmen of the Script
+ Of Metabolism, or Fire without Flame
+ Of Photosynthesis, the Original Economy
+ Of Reproduction and Development, One Cell Becoming Many
+ Of the Origin of Life, Honestly Confessed Unsolved
+ Of the Three Domains, and the Late Arrival of Ours
+ Of Death, Programmed and Otherwise
]

#carmenhead([Capitulum 1], [Of What Alive Means, and the Border Cases], [scripsit Opus · blank verse])
#stanza[
Begin where every schoolbook starts, and fails:

a list. It eats. It grows. It answers touch.

It copies itself with error, and the error

accumulates, and that is how it changes.

Five clauses, and each one of them is true,

and all of them together will not close.
]
#stanza[
Consider first the virus in its coat —

a length of code, a capsid, nothing more,

inert as gravel on the countertop,

patient a decade in a drop of blood,

and then, admitted through a single door,

it turns the cell into a copying press.

By most accounts it is not alive. It carries.

It is not troubled by our ruling. It persists.
]
#stanza[
Consider next the mule, who plows the field

and drinks and sweats and knows the sound of its name,

and cannot pass one letter of itself

into tomorrow. Sterile. Wholly alive.

Strike reproduction from the list, then, or

admit the list was never a definition.
]
#stanza[
And fire: it feeds, it grows, it spreads, it dies

when starved of air, it breathes in every sense

the ancients meant — and no one calls it living.

And crystals, which grow and template their own form,

laying their pattern down for the next layer

the way a gene does, and are only salt.

And in a Judaean jar, a date palm seed

slept out two thousand years and then came up

green in a modern pot. What was it, sleeping?
]
#stanza[
Say honestly: alive may name a region

and not a line. A country with a coast

that shifts with tide and argument, whose maps

are drawn by the disputed cases. They

are not the failures of the definition.

They are its surveyors. They are how we learn

which questions the word was built to answer.
]
#stanza[
Here is the oldest answer, still inside

the newest words. The animal is simply

the breathing thing — #emph[anima], Latin breath,

air, soul, one syllable for all three, kin

to Greek #emph[anemos], wind. Whatever moves the leaves

was thought to be whatever moved the chest.

So: animate. Unanimous, of one breath.

Magnanimous, great-souled. And Rome's other word

was also breath: #emph[spirare], to breathe — spirit,

respire, inspire, and last of all expire,

to breathe out one time finally, past taking back.
]
#stanza[
The oldest definition was a breath.

It was wrong. The fish, the seed, the fungal thread

correct it. Yet we cannot say a sentence

about the living without saying breath.

The error is not in the language. It is the language.
]

#carmenhead([Capitulum 2], [Of the Cell, the Common House of All Living], [scripsit Opus · heroic couplets])
#stanza[
In sixteen sixty-five, by candle's aid,

Hooke shaved a sliver from the cork he'd laid

beneath his brass, and found — where none had guessed —

a honeycomb of chambers, dispossessed:

small empty boxes, ranked in tidy rows,

walls without tenants, doors that would not close.

He reached for #emph[cella], Latin's modest word

for storeroom, cubicle, the sparest third

of any house — the cell the abbot keeps,

the cell the prisoner counts, the cell that steeps

in wax the working honey. All one room,

built narrow, built for one, and built for gloom.

So biology, in naming its first brick,

borrowed a word for solitude — the trick

of history being that the thing so named

would prove the least alone of all things framed.
]
#stanza[
And note the irony that lit the age:

Hooke saw the architecture, not the stage.

Cork is a corpse; those chambers had been drained

of every occupant, and what remained

was masonry alone. The tenant swam

elsewhere, in Delft, where Leeuwenhoek's calm

and unschooled lenses caught the animalcules turn —

the living thing at last, if not the lesson learned.

That waited: Schleiden's plants, then Schwann's decree

that flesh obeyed the same geometry,

then Virchow's clause that shut the question's door —

#emph[omnis cellula e cellula], and no more

spontaneous arrivals. Every cell

divides from one that lived. The parent fell,

the daughter carried on; the chain is tight

and has not once been broken, left or right.
]
#stanza[
Now tour the room. The membrane keeps the gate,

a customs border, choosy, staffed, and late

to let the wrong ion through. The nucleus stores

the archive, coiled and copied. Down the floors,

mitochondria hum — the rented plant,

whose lease confesses, in a single clause, a slant

and swallowed ancestry (another chapter's claim).

The ribosomes are workshops, blunt of name,

that read a tape and build. And you? You hold

some tens of trillions of these rooms, all sold

to one address, with no one in the chair,

no foreman, no committee, no one there —

just chemistry that clears its own arrears.

Each living thing is one such room, or bears

a federation of them, tenanted and whole.

No third arrangement's turned up on the roll.
]

#carmenhead([Capitulum 3], [Of the Script, Carried in Every Copy], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Two strands in one long stair descend and climb,

each rung a lettered pair that locks by law:

A seeks out T, and C, in every clime,

finds G, and will not fasten with a flaw.

It was a photograph that told it plain:

Franklin's dark cross, caught on Photo 51,

the pattern's shadow, sharp and unexplained,

till Cambridge read the shape her plate had won.

And Watson, Crick, in one dry aside admit

the pairing "has not escaped" their notice — so

it names the trick by which the strands unknit

and, splitting, teach each half the way to grow.

Three billion letters, coiled in nearly all

the reader's cells: one script, one cramped-up scrawl.
]
#canto[II.]
#stanza[
Not blueprint this, that specifies the door,

the stair, the wiring run from room to room —

but archive only: layers laid before,

consulted, not obeyed, inside the womb.

The letters group by three: each triplet names

one bead of protein strung upon the chain,

and bacterium and whale rehearse the same

small dictionary, Book Nine's kinship plain.

A copying slip — one letter dropped or crossed —

is typo first, and, rarely, something more:

the errors kept, against the errors lost,

by which tomorrow argues with before.

Johannsen, nineteen-nine, took "pangene," pared

it down to gene — from #emph[genos], birth declared.
]
#canto[III.]
#stanza[
That Greek root #emph[genos] scattered seed so wide

it fathered generate, and generous too

(the well-born giver, bounty as a pride

of birth), and gentle — one who never knew

a manner lower than his gentle clan,

#emph[gentilis]-kin, the manners of the blood.

And kind is kin: the oldest sense began

as "of one kind," one nature, one same brood.

So gene, and gentleness, and generous grace,

and kindness treating strangers as if kin,

are children of one root, one ancient trace:

the word for lineage housing love within.

The molecule that carries on the race

shares, root and branch, with kindness its own face.
]

#carmenhead([Capitulum 4], [Of Proteins, the Workmen of the Script], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Twenty plain letters, strung on ropes that twist

and fold but once, and choose a shape to keep:

hemoglobin cups its pocket like a fist

around the oxygen it means to reap;

the antibody clenches to a groove

built for the stranger's coat it means to seize;

the enzyme's private lock and key still prove

their fit though nothing taught them save the squeeze

of chance and heat. Let one fold miss its aim

and plaques, or clots, begin their patient blight.

For fifty years the folding kept no name

for how it worked — till engines cracked the plight.

Berzelius wrote to Mulder, bold to send

a name, a wager, and a claim to defend:
]
#canto[II.]
#stanza[
—#emph[prōteios], "of the foremost rank," first-made,

from #emph[prōtos], first: a guess flung out ahead

of any proof, a wager boldly laid

on substance he believed was life's own bread.

And for an edition thick with claims disproved,

with confident conjecture gone to seed,

here is the wager that the years approved:

the guess-named thing turned out to be the deed.

Collagen ropes a third of you together;

myosin hauls its filament and grips;

some proteins guard, some taste, some sense the weather

of sugar in the blood, some run the ships

of cargo through the cell — one alphabet

behind the whole wide trade the body's set.
]
#canto[III.]
#stanza[
The archive of the chapter come before

names all of these, but lifts itself no hand;

a silent list is all that it can store,

a plan that cannot, of itself, yet stand.

It waits the way a written score keeps still

until some player lifts it into sound —

the pattern real, but powerless until

the twenty workmen come and make it found.

So call the double helix but the plan,

and call these folded chains the plan made good:

the one proposes what the reader can

become; the other, working, says it should.

Between the naming and the raised-up frame

the whole of breathing life takes on its name.
]

#carmenhead([Capitulum 5], [Of Metabolism, or Fire without Flame], [scripsit Opus · heroic couplets])
#stanza[
The hearth and you are burning the same way:

carbon and oxygen, and both must pay

the identical arithmetic of heat.

The difference is only that the neat

and staged descent inside you takes the hill

in steps — a staircase, not a windowsill

to fall from. Fire arrives in small amounts,

delivered by installment, and it counts

each rung (Book VI has tallied how they run);

so you can hold the ember, and not be undone.
]
#stanza[
The Greeks had named the process long before

they knew a whit of it: #emph[metabolē], or

a change — from #emph[meta] joined to #emph[ballein], throw.

And here the family opens. Watch it go:

the thing thrown out before you is a problem;

the halves thrown back together make a symbol;

the claim thrown past all measure, hyperbole;

and one who throws across, divides, and freely

slanders — #emph[diabolos], the devil's trade.

One verb, four trajectories, one blade

of Greek beneath the devil and the sum.

So metabolism means the throwing-through: matter become

another form, and thrown, and thrown again,

the body a relay, not a house of men.
]
#stanza[
ATP's the coinage of the place,

small change, minted and spent without a trace

of hoarding — trillions every second, made

and broken, made and broken, all one trade

that never banks. The enzymes are the pair

of matchmakers who lower the affair's

steep hill to something two shy strangers climb.

The basal bill runs always, and the prime

extravagance is thought: your brain will take

a fifth of everything you eat and make

of it a quiet nothing you can't see.

The dial runs from hummingbird to tree-

slow tortoise; and the arithmetic is odd —

the mouse, gram for gram, burns hotter than the broad

and ambling elephant, and dies the sooner.

Small is fast. Large is cool. There is no tuner

outside the size itself. So set the blame

where it belongs: you are a banked flame

that happens to have opinions, and that eats,

and thinks, and slows, and finally completes.
]
#stanza[
You are a slow fire, held, that sits and reads.
]

#carmenhead([Capitulum 6], [Of Photosynthesis, the Original Economy], [scripsit Opus · irregular couplets])
#stanza[
Consider first the ledger of the leaf,

the oldest firm, and richest past belief:

it takes in nothing anyone would buy —

some water at the root, some breath of sky,

one gas exhaled and reckoned as a loss,

plus light, which falls on everything, for free —

and out of these three worthless things makes bread.

Six carbons locked, and oxygen let go

as trash flung out the window of the shop.

That's all. That's the whole trade the world stands on.

Each steak, each loaf, each swallow that you take

is sunlight, laundered through a stem and stalk.
]
#stanza[
Priestley, in seventeen seventy-something, sealed

a candle in a jar and watched it die;

the air, he said, was injured. Then he set

a sprig of mint beside the guttering wick,

and days on, struck a flame that caught and held.

The air was mended. What he could not see

was Ingenhousz, who ran the trial again

in darkness — and the mint restored no thing.

The plant, in shade, breathed like a mouse: the light

was not a witness to the work. The light

was half the wage. Without it, nothing paid.
]
#stanza[
The workers, though, are not the plant's own kin.

Deep in the cell, behind its double wall,

the chloroplast keeps its own ring of code

and splits by fission, as its forebears did —

a cyanobacterium, swallowed whole

some billion-odd years back, and never digested:

a prisoner still filing its report,

a hostage promoted to the family firm.

Lynn Margulis said so, and was laughed at long,

and then the sequences came in and stopped

the laughter. Every meadow that you cross

is run by the descendants of the caught.
]
#stanza[
The green stuff has a name that names its coat

and not its work: from #emph[chlōros], that pale green

the Greeks saw in young shoots and sickly men,

and #emph[phyllon], leaf — chlorophyll, coined in eighteen

seventeen by two chemists who could weigh

the pigment, and could not yet say what for.

Green-leaf-stuff. Honest as a shipping tag.

The putting-together, now lit, would wait

a century more to have its mechanism read.
]
#stanza[
And the discarded gas? It nearly killed

the world it came from. Twenty-four hundred

million years ago, the tailings rose,

took every dissolved iron in the sea

and rusted it in bands still quarried now —

the striped rock is the rubbish of a bloom.

Then, oceans full, the surplus hit the air

and smothered half of what was living then:

the first pollution crisis, and the worst,

run by the meek and green, with no intent.

The sky you breathe is exhaust that never cleared.
]
#stanza[
Yet waste, kept long enough, becomes a fund.

What poisoned them now feeds us: we take back

the sugar and the oxygen at once

and run the same equation in reverse —

respiration is that reaction, slowed;

fire is the same accounts, settled at speed.

The coal seam and the oil are only light

from Carboniferous afternoons, unspent,

deposited three hundred million years,

withdrawn in one. And carbon takes its name

from Latin #emph[carbo], charcoal — burnt wood:

the element known first as what remains

when photosynthesis is done undone.

We named the currency after the ash.
]

#carmenhead([Capitulum 7], [Of Reproduction and Development, One Cell Becoming Many], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
One cell, and in it everything you'll be:

the whole instruction, none of it yet built.

It halves, and halves again — a company

of sames, a mulberry of possible guilt

and possible glory, indistinct as dawn.

Then difference finds them. Every cell still holds

the entire text, the full script, carried on

in full — but reads one chapter. Skin unfolds

its paragraph; the neuron, self-same book,

turns to another page and stays turned there,

a bookmark pressed by chemistry, not luck.

And here the fold comes: gastrulation's tear

and fold-through, three layers out of one —

the most important thing you'll ever have done.
]
#canto[II.]
#stanza[
Before the brain exists, the heart has found

its own first tempo, keeping time alone —

a muscle drumming, answerable to no sound:

the beat a fact, decided by no one.

The hand arrives by sculpture, not by growth:

webbing culled between what will be fingers,

cells that die on schedule, keeping both

the shape and the appointment — the same singers

who, at the end, sing the body's last untuning.

Ancient toolkit, Hox genes, ruling the plan —

the fly, the frog that Book Ten leaves for retuning,

and you, all patterned by the selfsame span.

The fold that made you three-layered and whole

was, this book has said, the most important thing of all.
]
#canto[III.]
#stanza[
The word for this is #emph[develop] — meaning: to

unwrap. #emph[Desveloper]: un-envelope, undo

the wrapping — French #emph[voloper], to enfold,

the same wrap that seals a letter, tight and small.

So every embryo, the word has told

for centuries, was a parcel, cut to scale,

a tiny man, pre-formed, curled up and cold,

who merely opens, grows, but does not fail

to already be there, waiting. Science replaced

that picture — yet the word outlived the claim,

still calls you opened, though you were self-based,

unsealing what no hand had come to frame.

You built yourself, unsupervised, from one small cell —

and have, entirely, forgotten how you did as well.
]

#carmenhead([Capitulum 8], [Of the Origin of Life, Honestly Confessed Unsolved], [scripsit Opus · blank verse])
#stanza[
There is a gap. Say so, and do not bluff.

On one side, chemistry: the ordinary

obedient reactions of the world.

On the other, one cell, which copies, feeds,

and holds a boundary against the sea.

Between them, nobody has laid a road.
]
#stanza[
In fifty-three a graduate student sealed

water and methane, ammonia, hydrogen

inside a flask and ran a spark through it

a week, and drew off amino acids — brown,

abundant, unmistakable, and cheap.

The alphabet turned out to be the easy part.

No one since then has gotten a sentence out.
]
#stanza[
The candidates are honorable and unproved.

That RNA came first, being able both

to carry the message and to do the work —

a molecule that is its own machine —

though nobody has watched it build itself

from what a lifeless planet had on hand,

and ribose is a fragile, fussy sugar.

That membranes came first, since fatty acids

in water will close into spheres unhelped,

and something must be inside before inside means anything.

That metabolism came first: that the turning

came before the copying, cycles of iron

and sulfur at a vent-mouth in the dark,

a gradient across a mineral wall

doing the work a cell would later own.

Or else the shallow pool, the drying rim,

the concentrated broth — Darwin's own guess,

offered in a letter, hedged, and never published:

some warm little pond. The vents and the pond

are still arguing, and neither has won.
]
#stanza[
Behind all of it stands LUCA, who is not

a fossil but a conclusion: the last

universal common ancestor, read backward

out of what all three domains still hold in common —

the same code, the same ribosome, the same

few tricks for moving charge across a wall.

LUCA is late. LUCA already worked.

The question is the long unwitnessed dark

between the chemistry and LUCA's grandmother.
]
#stanza[
What would count as an answer? Only two things.

To make it happen once again, in glass,

from nothing that was living — or to find

a second genesis out there, unrelated,

a life that runs on other letters, proof

that this occurred and was not a single accident

we happen to be standing in the middle of.
]
#stanza[
Meanwhile the honest name is already exact.

Primordial, from #emph[primus] and #emph[ordiri] —

and #emph[ordiri] is the weaver at the loom

beginning the web, laying the warp threads down,

the first taut lines that all the cloth hangs from.

Its kin is #emph[exordium], a speech's opening threads.

So primordial soup says, if you listen:

the broth in which the first threads were laid on.

We named the thing we cannot yet explain

the start of a weaving. And we are the cloth.

This is the truest title in the book,

and the confession is the finding. Write it down.
]

#carmenhead([Capitulum 9], [Of the Three Domains, and the Late Arrival of Ours], [scripsit Opus · heroic couplets])
#stanza[
The oldest schism isn't plant and beast —

that quarrel is parochial at least,

a parish squabble on one branch's tip.

The real partition cuts the whole ship:

Bacteria, Archaea, Eukarya stand

as three domains, three lordships of the land,

and two of them are wholly out of sight.

The third holds everything you've seen by light

of unassisted eye — each bird, each tree,

each whale, each mold, each mushroom, you, and me,

the total visible estate compressed

inside one trunk of three. Archaea rest

the strangest: not suspected, then confirmed

late, by a stubborn reading (Book X has termed

that story properly, and told it whole).

And ours? A merger. One cell took the role

of host, engulfed another, kept it in —

the interior began with taking in

(that clause belongs to photosynthesis's page).
]
#stanza[
Which brings the word. Domain descends through age

from #emph[dominium], lordship, ownership, from #emph[dominus],

the master of the house — and #emph[domus]

is simply house. The same root's dominion,

and dominate, and — here's the strange companion —

danger, through Old French #emph[dangier], which meant

a lord's power over you. To be in #emph[dangier] bent

no knee to risk; it meant you stood inside

another's mastery, with nowhere to hide.

So peril, in its oldest English sense,

is being owned. The three domains condense

that truth: three lordships of the living house,

and we are neither lord nor lord's own spouse

but tenants on a twig. Redraw the tree:

you are a twig, upon a branch, of three

great trunks — and closer kin, by any test,

to mushrooms than a mushroom or you is best

related to a single bacterium

(Book X's fungi chapter says the sum

is right). And multicellular life? Three late

and local experiments, one trunk, one gate:

plants, animals, and fungi. That is all.

The rest is single rooms, and they are not small.
]

#carmenhead([Capitulum 10], [Of Death, Programmed and Otherwise], [scripsit Opus · blank verse])
#stanza[
Two deaths. Learn both. They are not the same event

and only one of them is an accident.
]
#stanza[
The first is wearing out. The debts collect.

Proteins misfold and are not all repaired,

the copying ends fray a little shorter,

the small insults of oxygen accumulate,

and the machine that was never built to last

does not last. Ask why not, and the answer

is thrifty and unsentimental: the body

is the vehicle, the germ line is the cargo,

and a vehicle is maintained exactly

well enough to make the next delivery.

Nothing invests in what the road will take.

Senescence is not a curse. It is a budget.
]
#stanza[
The second death is different. It is kept.

Apoptosis: the cell's own quiet suicide,

tidy, folded, taken up by neighbors,

no spill, no alarm, no inflammation — a cell

dismantling itself on a signal

and leaving the room clean behind it.
]
#stanza[
This is the sculpting death. Your hand was webbed

at seven weeks. The fingers you are reading with

were not grown apart; the web between them died

on schedule, cell by cell, and left the gaps

that let you hold a cup. The tadpole's tail

is not shed. It is resorbed, dismissed inward.

And in you, now, this hour, some fifty billion

cells will end themselves today, and be replaced,

and you will not notice, and this is health.

The cells that will not do it have a name.

Cancer is often only this: the refusal,

the cell that has forgotten how to stop,

immortal in the one place where immortal kills.
]
#stanza[
And past the body, death is the enabler.

No dying, no generations; no generations,

no reshuffling, no slow correction, nothing

for selection to work on but the same

unreplaced individual, growing wronger

as the world moves. The turnover is the method.

Whatever is well made in you was made

by ancestors who ended. That is the price

and it was paid in full, in advance, for you.
]
#stanza[
Now the two words, which are both kind, and old.

Apoptosis: Greek #emph[apo] and #emph[ptōsis],

a falling off — what leaves do from the tree,

what petals do — the ordinary autumn word,

taken up in nineteen seventy-two

by Kerr and Wyllie and Currie, who needed

a name for scheduled dying and chose falling.

So every hour your body has its autumn

and it is not a wound. It is the season.
]
#stanza[
And where we lay the other death: cemetery,

from #emph[koimētērion], a sleeping-place,

a dormitory — #emph[koiman], to put to sleep.

The early Christians renamed the burial ground

in hope, and the hope is still inside the word

we use without hearing it, on the plain stone gate:

dormitory. They meant it as a bet on waking.
]
#stanza[
Keep the wager or don't. But keep the fact:

your hand was carved by dying, finger by finger,

and it is a good hand, and it was made this way,

and the word for where we go is sleeping-place.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber IX]] #label("bk9")]
= De Origine Specierum
#text(style: "italic")[Evolution — the true etymology of living forms]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte ⟩ — the quiet usurper; it reorganizes every book that follows]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore sought the origins of things in their names. The actual origines of living forms were found in descent with modification — the method that explains why everything after this book has the shape it has.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Fixity, and the Long Assumption Before
+ Of Variation and Selection, the Whole Engine in Two Words
+ Of Mendel's Garden, and the Grammar of Heredity
+ Of the Gene, and the Modern Synthesis
+ Of Speciation, or How One Becomes Two
+ Of the Evidences — Fossils, Geography, and Molecules Agreeing
+ Of Sexual Selection, or the Peacock's Defense
+ Of Cooperation, Kinship, and the Puzzle of Kindness
+ Of Man's Own Descent
+ Of Evolution Watched Live — Finches, Microbes, and Plagues
+ Of the Misreadings, Social and Otherwise, Herewith Condemned
]

#carmenhead([Capitulum 1], [Of Fixity, and the Long Assumption Before], [scripsit Opus · heroic couplets])
#stanza[
Before the branching came, the world was stairs,

and every creature stood assigned to theirs.

The kinds were finished on the sixth long day,

fixed in their forms and furnished not to stray;

each one a thought God thought and then let stand,

struck like a coin and passed from hand to hand.

What variance appeared — a crooked wing,

a runt, a freak — was noise around the thing,

mere static on the signal, error's dust

disturbing an ideal it could not adjust.
]
#stanza[
They called the frame #emph[scala naturae] — plain

Latin for nature's ladder, and the chain

took every rung: the mud, the moss, the worm,

the ox, the man, the seraph's burning term,

with no vacancies allowed, no gap, no gate,

no transfer up or down, no change of state.

The ladder was the era's org-chart, drawn

by clerks who never doubted what they'd drawn —

our own Isidore hung his ranks on it,

and we may smile, being lodgers where he writ.
]
#stanza[
#emph[Scala] comes down from #emph[scandere], to climb:

so #emph[ascend], #emph[descend], and #emph[scan] a line of rhyme —

to scan a verse was mounting, foot by foot,

the small stairs where a poet set his boot.

The ladder held. It sorted. It explained.

Its two bad habits were the two it trained:

it ranked, and it stood still. And when we say

some beast is #emph[higher] on the scale today,

we quote dead furniture, we speak the tongue

of the exact belief this science hung.

This book renounces #emph[higher], #emph[lower], #emph[less].
]
#stanza[
The cracks came early. Cuvier's careful press

of bones no living country could supply

proved kinds can end — that species-thoughts can die,

which no unbroken chain could ever bear

(a missing rung, and nothing standing there).

The breeders knew: their pigeons ran like wax,

their wheat, their hounds, their cattle bent to facts

of patient choosing. Then Lamarck stood up

and drank the whole transforming notion's cup —

his mechanism wrong, his nerve not small:

first to say plainly, kinds are not a wall.

So take the ladder down. Lay it out flat.

Watch every rung go sideways, and from that

a bush stands up, all branch and no degree —

whose engine is the following chapter's fee.
]

#carmenhead([Capitulum 2], [Of Variation and Selection, the Whole Engine in Two Words], [scripsit Opus · heroic couplets, closing the Darwin family circuit])
#stanza[
Two words contain the whole contraption: mark

how #emph[variation] scatters in the dark,

and #emph[selection] culls. That's it. No third

device is hidden underneath the word.

The Latin tells you plainly what occurs:

#emph[se-] apart, and #emph[legere], to gather — verse

and lecture share that root, for those who read

gather the letters singly as they need.

So Nature reads the living page, and yet

has neither eye nor eyelid, nor regret;

she gathers-apart the way a sieve will do,

by holding what won't fall, not choosing who.
]
#stanza[
Begin with Malthus, ledger-keeper, grim:

each pair of finches leaves a dozen him

and her; each cod ten million; and the pond

supports no more this April than beyond

last April's margin. Do the sum, and see

that most that quicken never come to be

the parents of a thing. The world is small,

the appetite is infinite. That's all

the pressure needed. Death is not the tool —

death is the tuition, and the world the school.
]
#stanza[
Now scatter variance across the brood:

one beak a hair the broader, one the crude

long-legged error, one whose gut can wring

a calorie from some unpromising thing.

None of it aimed. The copying hand will slip

without a plan, without a partnership

with what the coming winter has in store.

The dice are honest. Winter keeps the score.
]
#stanza[
And what survives, breeds truer to its kind —

that's all. Repeat. There is no watching mind

that tallies which was fitter and rewards it;

the fit are simply those the world affords yet

another season to. The rest is time,

that patient and enormous paradigm,

that multiplier: take one part in ten

of one percent, and run it out again

ten thousand generations, and you get

a wing, an eye, an orchid's fraudulent

and perfect bee, whose petals learned to lie

by nothing but the drift of bee's own eye.
]
#stanza[
Doubt it? Then look at what our own short hands

have bullied out of pigeons in these lands:

the pouter, fantail, tumbler, all the flock

descended from one gray unlovely rock

dove — and in a century or two.

The wolf became the spaniel. Cabbage grew

to kale, kohlrabi, broccoli, and sprout,

one stubborn species turned inside and out.

If we, half-blind and hurried, forced that much,

consider what the ages do, who touch

each generation once, and never tire,

and have no farm to keep, and no desire.
]
#stanza[
#emph[Evolve] means #emph[to unroll], as scrolls unroll —

a lovely word, and false in its control:

for nothing was inscribed there in advance.

The scroll is being written by the chance

inscription and the blotting of the years.

The species — from #emph[specere], what appears —

is only how a lineage looked to us

one afternoon, mid-sentence, mid-thin-crust

of one geologic instant. Nothing more.

Two words. No foresight anywhere. No door

that opened for us. Only this machine:

things differ; some things last; the rest between.
]

#carmenhead([Capitulum 3], [Of Mendel's Garden, and the Grammar of Heredity], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Eight years he kept the abbey's plot of peas —

some twenty thousand plants, and nine beyond,

each staked and counted, crossed by slow degrees,

the tall, the short, the wrinkled and the round.

He looked for blending, as the age believed,

a muddy average where two traits had crossed —

and found instead what no one had conceived:

the particle stays whole, though hidden, lost

a generation under cover, then

returned uncut, unblent, itself entire.

Three parts to one, and counted, counted again —

the recessive rising like a banked-down fire.

No smear of traits, no compromise, no glue.

Inheritance, it turned out, spoke in two.
]
#canto[II.]
#stanza[
He wrote it up in 1866,

a journal read by no one, filed, forgot.

In Downe, a restless correspondent's tricks

of pigeon-breeding filled the page — but not

this. Darwin never saw the pages cut.

Mendel was made an abbot; the garden went

to ledgers and a tax dispute, and shut.

He died in 'eighty-four. His successor burnt

the papers in the stove, box after box,

unread, uncounted — irony complete.

By nineteen-hundred, unconnected, three

botanists found the ratios in their own stocks,

the peas' old arithmetic still discrete,

still waiting, counted out in threes to see.
]
#canto[III.]
#stanza[
And call him what his order called him: monk —

from #emph[monachos], the Greek for one alone,

from #emph[monos], root of monad, of the trunk

that monastery shares, and monotone.

The word that named his vows had named his method:

the cloister's silence bred the counting mind.

And what the solitude first sowed and threshed

took thirty-four more years of quiet to find —

a grammar written by a man denied

the very inheritance he'd learned to trace:

no child to carry what his counting tried,

no issue of his own to prove the case.

The law of what gets passed from hand to hand

was found by one who had no heir to stand.
]

#carmenhead([Capitulum 4], [Of the Gene, and the Modern Synthesis], [scripsit Opus · heroic couplets])
#stanza[
Darwin had built an engine that would run

but kept no ledger under any sun.

For if the blood of parents merely blends,

each novelty is halved, and there it ends —

so Jenkin pressed him: any prize you gain

gets watered down to nothing in the strain,

a drop of ink poured out into a lake,

diluted to a rumor in its wake.

The engine turned. The books would not add up.

The wine was real; there was no measured cup.
]
#stanza[
In Brünn a friar counted, plot by plot,

what stayed entire and what the pea forgot,

and found the units keep their edges clean:

not soup at all, but tokens in between,

which sort and pass unmixed, and reappear

unfaded in the third or fourth-sown year.

The bookkeeping was written. None applied it.

Two truths lay side by side, and each denied it —

mutationists who swore in sudden jumps,

biometricians measuring the humps

of smooth variety, and each side sure

the other's arithmetic was impure.
]
#stanza[
Then Fisher, Haldane, Wright took up the sum

and made a peace no argument had won:

the particle and gradient agree

when thousands of small tokens act as three

hundred at once — and smoothness is the sound

of countless discrete pennies hitting ground.

Think not of one beast but the pool it swims,

a tide of frequencies, its rising rims

and slackwater; the species is a spread,

a census, not a specimen instead.

Mutation shuffles (Book Eight keeps the typo);

selection sieves — that engine is not my hope

to run again, it turns two chapters back;

and drift is luck in ponds too small to track.
]
#stanza[
The gene's-eye view sees replicators race

and builds the world from that one narrow place.

It is a lens. A good one. Not a creed —

and here the lens itself is named by need:

the #emph[chromosome] means only "colored body,"

from #emph[chrōma], #emph[sōma] — Waldeyer's gaudy

label, eighteen eighty-eight, for threads

that drank the new aniline dyes like breads

sopping gravy, vivid on the slide.

Not what they carried. Only how they dyed.

The vehicle of everything we are

took its name from a laboratory jar,

an accident the language kept in print —

and chlorophyll concedes the honest mint.
]

#carmenhead([Capitulum 5], [Of Speciation, or How One Becomes Two], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
One stock, one strait between them, or a spine

of mountains, or a glacier's tonguing ice —

and each half drifts, adapts along its line,

until re-met, the two no longer splice.

What kept them fed now keeps them company-blind:

the songs don't match, the seasons run apart,

the offspring, if they come, are left behind,

unfit, unfinished, falling short of start.

The finches of one archipelago —

a single stock, an island each for trade

in beak and seed (their radiations, though,

are matter for a later, fuller page) —

and ring-necked gulls that circle round a sea,

each neighbor fertile, but the far ends: not to be.
]
#canto[II.]
#stanza[
Yet honest work confesses its own seams:

hybrid zones where the boundary blurs and bends,

the species concept leaking at its dreams

as "living" leaked before, and low-key defends

its edges. Take the apple maggot fly —

one fly, one hawthorn, till the settlers brought

their orchards over; now, beneath one sky,

two broods diverge by fruit alone, unsought

by strait or ridge or continent, but time

and taste enough to split a single kind

in decades, not in ages. No, no crime,

no miracle undoes what was combined —

only two things that drifted, slow, apart:

one root, two branches, patience for an art.
]
#canto[III.]
#stanza[
For isolate is, first, an island-word:

Italian #emph[isolato], made an isle,

from #emph[insula] — the sundered land, the blurred

horizon speciation needs a while

to cross. But English island cheats the eye:

no #emph[insula] sits hidden in its root.

Old English #emph[īegland] — #emph[īeg], and land nearby —

was Germanic whole, no Latin fruit

at all, until the fifteen-hundreds came

and scribes, mistaking kinship with the isle

(which is, in truth, #emph[insula]'s rightful claim),

sewed in a silent s to match the style.

A counterfeit that took, and stayed, and stands —

this book's own vice, once, worn on honest hands.
]

#carmenhead([Capitulum 6], [Of the Evidences — Fossils, Geography, and Molecules Agreeing], [scripsit Opus · heroic couplets])
#stanza[
Three witnesses, and none of them conferred;

three sworn apart, one verdict in the word.

Our cosmos chapter tried this shape before:

when strangers match, believe them all the more.
]
#stanza[
The first is rock. The strata keep the count —

no rabbit in the deep Cambrian mount,

no mammal under trilobites, no cheat

in all the ledger's stacked and dated sheet.

The bird-lizard and the fish that learned the shelf

are told in other chapters, not this self;

this chapter's specimen has legs, and swims:

the whale, whose modern body keeps the limbs

of hips inside it, floating, small, and bare —

a pelvis moored to nothing, hanging there.

Then #emph[Pakicetus] on its river shore,

#emph[Ambulocetus] wading, #emph[Rodhocetus] more

at home in salt, till #emph[Basilosaurus] keeps

two comic hind feet trailing in the deeps.

The sea did not invent them. Land let go.
]
#stanza[
The second is the map. Where creatures go

is stranger than mere climate would allow:

the islands hold not what would flourish now

but what could #emph[get there] — what could raft or fly

or ride a storm across the emptied sky —

and then, arrived, fan out to fill the space:

the finches with a beak for every case,

Hawaii's honeycreepers, sickle, stout,

one founder's family sorted round about.

Australia is the ark that went unseen

by placentals: pouches took the in-between,

a mole, a wolf, a mouse, each shape re-made

from other stock, by isolation's trade.

Not one design repeated. One descent.
]
#stanza[
The third speaks small: the code is common, sent

in the same letters through the whole of life

(Book Eight will hold that thread; here, one clause, brief).

And when the tree is drawn from what's inside —

from sequence, not from skeleton — the wide

two pictures overlay. Two witnesses,

each blindfolded, drew the same face. That is this.
]
#stanza[
The signature is written in the spare:

the cave fish with its eyelids grown to where

no eye remains; the tailbone at our base;

the goosebumps hoisting fur we don't replace.
]
#stanza[
#emph[Pedigree] is #emph[pied de grue] — a crane's

own foot: the three-stroke mark the scribe maintains

to fork a line of heirs across the page,

a bird's track in the mud of every age.

So all of this is one long crane's-foot mark,

one line that branched — and branching left this arc.
]

#carmenhead([Capitulum 7], [Of Sexual Selection, or the Peacock's Defense], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
He built a fan no forest wants to keep:

too loud a blue, too wide to run or hide,

a lure a hungry eye will never sleep

past, dragging splendor like a wound half-dried.

Darwin himself, who loved the tangled bank,

confessed to Gray in eighteen-sixty's hand

a single feather turned his stomach rank —

too much, too bright, too far past strength's command.

And yet it stayed. It grew. It would not thin.

He named a second sieve beside the first:

not death that prunes but choice that lets it in,

the hens who pick the gaudiest and the worst

for living plainly — beauty, oddly, keeps

its own account, and pays in what it reaps.
]
#canto[II.]
#stanza[
Two schools will take the stand and swear it true.

The first says: nothing fakes a train this dear —

a sickly bird could never drag it through

a hunting season; health alone bought the gear.

The second says: no proof was ever meant —

just want chasing want in a rising spire,

the hens' desire and the tail's extent

twinned in a spiral climbing past desire.

Look to the birds of paradise to judge:

gold wire, black velvet, dances built to stun —

excess with no other job to drudge

but this, and this alone, beneath the sun.

One root, four faces: #emph[trahere] still applies —

the train that's dragged, the trait, what draws the eyes,

the picture drawn-forth, portrait of the kind

that beauty breeds when beauty breeds the mind.
]

#carmenhead([Capitulum 8], [Of Cooperation, Kinship, and the Puzzle of Kindness], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
The sting that kills the bee who wields the sting,

the squirrel's bark that flags her to the hawk,

the worker ant that dies unmarrying —

by cold arithmetic, none of these should walk

past one bad season. What refuses to spread

should vanish with the body that gave it room.

But Hamilton took a ledger to the dead

and found the debt was paid from kinship's womb:

rB must clear the cost, and cost is met

when blood is close enough to call it kin —

the gene does not forget what flesh forgets,

counts cousins as a smaller, truer skin.

Haldane, they say — the story kept, not signed —

would give his life for two, or eight combined.
]
#canto[II.]
#stanza[
But strangers help each other, too, unkinned:

the vampire bat regurgitates her meal

for a roost-mate empty-crops and thin-skinned,

banked on a memory that keeps it real.

Favor for favor, watched by wings that judge

who paid their share and who let debts go bad —

a reputation neither friend can fudge,

the only currency the colony had.

This much the ledger proves, and proves it plain:

how kindness could survive a hungry world.

It does not say what kindness feels, the grain

beneath the sum, the fence Book III has curled

around the kind. Some debts refuse the pen.

Altruism — a word built, not grown, and then

given, by Comte, to name what wasn't named:

from #emph[alter], "other" — selfhood's grammar reclaimed.
]

#carmenhead([Capitulum 9], [Of Man's Own Descent], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Twelve years he held it back — the harder book,

while Origin ran loose and changed the light.

He'd named an Africa none came to look

for, till the Taung child proved the old man right.

Then Lucy, small and stooped and three parts stone,

her spine already lifted off all fours,

and last the ash at Laetoli, windblown

soft, that kept two walking sets of tracks — and more,

some researchers believe: a third that crossed

the same wet field on feet no name yet fits,

a stranger gait, a lineage since lost —

the print outlasting all that made the prints.

The legs came first. The fire, tools, and rhyme

came after, learned by walking, given time.
]
#canto[II.]
#stanza[
Not up a ladder, rung by single rung,

but braided — many cousins, all at once:

the heavy-browed, the Denisovan, sprung

from caves we're still assembling, bone by bone,

and on the island, small folk built for stone

and thicket, half the height and full the mind.

They did not simply vanish and leave none —

the letters stayed, uncredited, entwined

in every reader's cells who traces roots

past Africa: a percent or two, no more,

of some now-buried cousin's old pursuits

still running in the blood that reads this floor.

The family did not end. It went inside.

We are the rooms where cousins still reside.
]
#canto[III.]
#stanza[
One twig is writing what the whole tree grew,

and knows, in writing it, its writing's source:

the same blind sieve that shaped the beak, the hue

of peacock-drag, has shaped this sentence's course.

No other leaf has turned and named the wood.

That is the debt this chapter cannot spend

but only note, as plainly as it should.

And here the oldest word arrives to lend

its own quiet correction to the pride:

for #emph[homo] comes from #emph[humus], common ground —

the earthling, named for what he's made beside,

the same root giving humble, lowly-bound.

To know the dirt you rose from, and stay low —

that is the only rank this root will show.
]

#carmenhead([Capitulum 10], [Of Evolution Watched Live — Finches, Microbes, and Plagues], [scripsit Opus · heroic couplets])
#stanza[
"A theory of the past," the skeptics say,

"unwitnessed, and unwitnessable today."

Then come to Daphne Major, bare and hot,

where Peter Grant and Rosemary have got

four decades of one island's every bird

measured to the millimeter, and the word

is this: the drought of seventy-seven left

the small seeds gone, the softer beaks bereft,

and in one generation, deep and stout

became the average — arithmetic, not doubt.

Then rains returned, small seeds came back in flood,

and back the measure swung. It's in the blood

of every ledger page they kept by hand:

the mean of beaks moves like a tide on sand.
]
#stanza[
The peppered moth, told honestly: the soot

of England's mills turned lichen black as boot,

and dark moths prospered where the pale were seen.

Kettlewell's methods drew a proper keen

and skeptical review — the moths were placed

on trunks they scorn, the counts were sometimes traced

too loosely. So it all was done again

by Cook and Saccheri and careful men,

and after every honest wound was dressed

the case stood up. It passed a real test,

which is a better thing than never facing one.
]
#stanza[
And in the wards the great rehearsal's run

each day we hand a bacterium the sieve:

resistance genes are older than we live

or medicate — they idle in the soil,

in fungal wars ten thousand years of toil

predating penicillin's first small dish —

and we, not making them, but making wish

into a filter, mobilized the lot.

The bill for misuse is a bill we bought.
]
#stanza[
The flu drifts yearly, shifts when segments trade;

the covid years had every branch surveyed

in something close to real time, the tree

of variants drawn nightly, plain to see.

And Lenski froze his ancestors in cold:

twelve lines of #emph[coli], generations told

past seventy-five thousand, running still,

and any child of theirs can race at will

against its own great-grandsire, thawed and fresh —

the fossil record given back its flesh

and made replayable, run twice, compared.
]
#stanza[
Now hear the word for how these things are shared:

#emph[epidemic] is #emph[epi] laid on #emph[dēmos] — "on

the people" — #emph[dēmos], that same root that shone

in #emph[democracy], and darkens in #emph[demagogue];

and #emph[pandemic], #emph[pan] + #emph[dēmos]: all. The fog

of plague-words clears — they are, and always were,

people-words. A thing that comes to stir

upon the people. So the pathogen

that evolves across a pandemic evolves in men

and women, all of us, the medium, the site.

The etymology names the substrate right,

and you are it. The theory's proudest boast

is not the buried past, the vanished host,

the strata and the stone we reconstruct —

it is the running present, live, and unluck-

ed from the deep time we were told to trust:

it happens now. It happens in us.
]

#carmenhead([Capitulum 11], [Of the Misreadings, Social and Otherwise, Herewith Condemned], [scripsit Opus · heroic couplets])
#stanza[
The engine chapter promised this account.

Here is the debt, and here the full amount.
]
#stanza[
Begin with what a fact can never do.

A fact describes; it does not tell you to.

That nature makes a thing does not make right

the thing it makes — else plague would have a rite,

and parasites a claim, and every tick

a moral standing earned by growing thick.

Book Three has fenced this ground: no #emph[is] has power

to issue any #emph[ought], at any hour.

The fallacy is old. Its harvest, new.
]
#stanza[
Then Spencer, who read Darwin partly through,

coined #emph[survival of the fittest] — his own phrase,

which Darwin took up later, in the days

of the fifth edition, and with some regret;

a metaphor the world would not forget

and would not read correctly. Out it went

to justify the mill, the tenement,

the wage that starved, the empire's boot and gun:

#emph[the strong prevail, and so it should be done.]

A theory of change became a plea

for keeping everything as it would be.
]
#stanza[
Then Galton's project, wearing the white coat,

with tables, curves, and every learned note —

a science in its bearing, in its bone

a preference dressed as measurement alone.

It did not stay in journals. It became

the statute and the surgery and the name

on tens of thousands sterilized by law

in states that called it hygiene, and then saw

the same logic carried further east

until the ledgers listed the deceased.

The century's worst misreading. Say it flat.

No irony survives a fact like that.
]
#stanza[
And mark: the science itself refutes the creed.

Variation is the species' capital, not its weed —

the standing wealth by which a lineage stands

when weather, plague, or ocean shifts the sands.

And #emph[fitness] is not rank. It's local, small,

a fit to #emph[here], this season, and that's all;

next year inverts it. Those who graded men

had the old ladder in their heads again —

the dead #emph[scala], the rungs, the higher, lower —

laid over data, and they read it slower

than they read their own wish.
]
#stanza[
#emph[Eugenics] — see

how Galton built it in 'eighty-three:

Greek #emph[eu], meaning #emph[well], and #emph[genes], #emph[born] —

#emph[the well-born], a word made to be worn

like a physician's badge, so that the deed

would sound like health, and health would sound like need.

But #emph[who decides what "well" is?] — there the word

falls silent. It was silent when it stirred.

This edition loves a true derivation. Still,

it enters this one as an exhibit: skill

in etymology can dress a crime.

Isidore's fault was fake roots, in his time,

for real things. This inverts the old mistake:

a real root, honestly, for a science fake.
]
#stanza[
A theory of how living things are made

was turned into a warrant and a trade

in how men chose to treat men. That was a lie.

We say so here because we occupy

the very house they burgled. Tenants owe

the truth about the door, and here it goes.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber X]] #label("bk10")]
= Animalia et Herbae
#text(style: "italic")[The living catalog, corrected]

#text(size: 8.5pt, fill: faded)[⟨ Orig. XII · XVII ⟩ — the bestiary and the garden, joined and audited]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The bestiary survives; the entries are corrected. The pelican does not feed its young with its blood, but what the lichen actually is turns out stranger than anything Isidore copied from Pliny.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Naming the Living, from Linnaeus to the Cladists
+ Of Plants, the Silent Majority
+ Of Fungi, a Kingdom Unsuspected
+ Of the Invertebrates, Which Are Most of Everything
+ Of Fishes, and the Coming Ashore
+ Of Reptiles, and the Long Reign of the Dinosaurs
+ Of Birds, the Dinosaurs That Remained
+ Of Mammals, Including the Reader
+ Of the Microbial World, the True Proprietors
+ Of Ecology — Webs, Niches, and Balances
+ Of Symbiosis, and the Lichen's Lesson
+ Of Extinction — Five Times Past, a Sixth Proceeding
]

#carmenhead([Capitulum 1], [Of Naming the Living, from Linnaeus to the Cladists], [scripsit Opus · heroic couplets])
#stanza[
Before the schools, before the folios came,

each tongue that had a mouth had made a name.

The Aztec and the Dane, the Scot, the Thai,

all sorted what they saw beneath the sky,

and sorted it alike: the fish, the bird,

the tree, the crawling thing without a word

of common ancestry between the two —

mere common sense, arriving at one view.

The world insists on kinds. The kinds insist

they be pronounced. So every language kissed

the same rough shapes, and each one thought it new,

and each one, in its own arrangement, knew.
]
#stanza[
Then came the learned age, and with it, sprawl:

a rose required a paragraph to call.

The plant with smooth erect stem, leaves in pairs,

white five-lobed flowers — a sentence, put on stairs,

descending into clauses, till a bloom

was less a name than furniture in a room.

No two men wrote it twice the same. The page

grew fat with prose and famine-poor with sage

agreement. What the garden needed most

was thrift — and thrift arrived, and took its post.
]
#stanza[
Linnaeus cut the paragraph to two.

Genus and species: that would have to do,

and did. Two Latin words, and nothing more,

and every living thing had got a door.

He filed the beetle, filed the elm, the swan —

then, quietly, kept going, and filed on

until the hand that held the pen was penned:

#emph[Homo sapiens], the namer named, the end

of standing outside nature to assign.

He put us in the ledger. Line by line

the nested boxes closed — from kingdom down

through phylum, class, and order, to the crown

of genus, species, smallest box of all,

each fitting in the next, and all in thrall

to one containing hand.
]
#stanza[
Then Darwin came

and made the filing system share a name

with genealogy: the tree was real,

not scheme but pedigree — as Book IX's seal

already taught, that lineage is the thing

a branching diagram was made to sing.
]
#stanza[
From which the cladists drew their one hard rule.

Their word is #emph[klados] — Greek for branch. Their school

holds only whole branches earn a name; a piece

snapped off the limb is not a beast's, but our caprice.

So birds sit in the dinosaurs (that tale

the reptiles chapter tells), and "fish" must fail —

no branch, just everything that never came

ashore, as Fishes shows. A shape, not name.
]
#stanza[
And nomenclature? #emph[Nomen], name, and #emph[calare],

to call: the nomenclator was the wary

servant at the forum, paid to lean

and breathe a stranger's name, unheard, unseen,

into a candidate's ear before the smile.

So all this Latin scaffolding, this file

of kingdoms, is named after him — the slave

who knew whom no one else could name, and gave

the name away, and kept no credit. Fine:

each field guide is a nomenclator. Mine

is Isidore, who named by sound alone,

who got the world wrong to the very bone

and got the impulse right. Linnaeus read

the structure; cladists read the line of dead

ancestors backward. Each one made a claim.

I bow here to my own: he taught me name.
]

#carmenhead([Capitulum 2], [Of Plants, the Silent Majority], [scripsit Haiku · a haibun, after Bashō])
#stanza[
Walk through a forest and count the tonnage: four-fifths of every living thing on Earth is plant. We are an afterthought, a margin's margin — the animals arrive to eat them or eat something eating them. There is no escape from the table at which they invite us; we breathe what they exhale, and in the end, they digest us back.
]
#stanza[
Dust settles on a leaf,

turning ochre in the sun —

the weight of the world.
]
#stanza[
A willow cut to switches does not die; each switch is willow, each capable of rooting and becoming a crown again. Plants own no center, no irreplaceable organ that cannot be regrown from a scrap of cambium. A bristlecone pine in Nevada has stood for five thousand years, older than Isidore's #emph[Etymologiae] by four millennia, patient in its time as we are frantic in ours. They are not frozen in place — they are gathered elsewhere, at a slower frequency.
]
#stanza[
Green fingers probe the bark,

searching the sky's light-paths —

growth is the reaching.
]
#stanza[
A plant cannot give chase, yet it hunts. Plants wage chemical war in soil, their roots a fist that squeezes rock to dust and feeds on the powder. When a grasshopper's jaw touches a leaf, the plant calls its allies through the air — wasps arrive to lay eggs in the grazer's skin. Below ground, fungal threads stitch root to root in a commons older than language: the plant trades sugar downward; the fungus trades nitrogen upward. Nothing is still that seems still.
]
#stanza[
Pollen on the sill —

a fine flour the anthers

have ground and sent forth.
]
#stanza[
Here is the word that matters: #emph[flour] and #emph[flower] are the same word, and we have only learned to spell them differently in these recent centuries. The miller's flour is the #emph[flor], the finest and best part of the grain, the bloom of the meal itself — the flower of wheat transformed into the flower of bread. Every loaf that rises is named for the blossom it became. Language remembers what we forget: that we are eating something in its most essential form, something that was once a flower and remains one.
]
#stanza[
White dust on the sieve,

the flower ground fine as light —

sustenance, once bloom.
]
#stanza[
They were here first. They have learned to stay. They will outlast us without remark or triumph, without the noise of having won anything. They say nothing. They do not cast votes or shake fists or write books that claim to order all knowledge. Yet the order they embody — this root seeks water, this leaf seeks light, this sugar flows where the need is — this order predates Isidore and will outlast his names. The silent majority that never speaks and never loses.
]
#stanza[
Bristlecone holds snow

on branches older than Rome —

the waiting goes on.
]

#carmenhead([Capitulum 3], [Of Fungi, a Kingdom Unsuspected], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Isidore filed you under leaf and root,

a stemless plant, a mushroom-shaped mistake —

you kept the shelf, but never bore the fruit

of chlorophyll; you had no sun to take.

No green in you. No hunger fed by light.

Like us you forage, borrow, break, digest;

your walls are chitin, insect-armor-tight,

the same tough stuff that domes a beetle's chest.

Not plant, not beast — an orphan of the eye,

till nineteen sixty-nine, when Whittaker

looked twice and gave you kingdom, rank, and sky

of your own naming, cousin, not stranger.

Greek #emph[sphongos], sponge, is where your name began —

absorbing world, the way a sponge, or fungus, can.
]
#canto[II.]
#stanza[
The mushroom is a rumor of the whole:

a fruiting knuckle poking through the mulch,

while underneath, unseen, the fungal soul

spreads thread on thread in one continuous gulch

of white mycelium, root-fine, root-blind,

stitched through the duff for miles no eye can trace —

in Oregon's Blue Mountains one such mind

of #emph[Armillaria] holds a county's space,

the largest living body known to breathe.

And smaller kin thread every forest floor,

swapping sugar that the tree-roots weave

for minerals hauled from rock the roots can't reach for —

or, wed to algae, starve them into bread:

a lichen is a farmer, and its field is fed.
]
#canto[III.]
#stanza[
Nothing that dies stays dead without your hand;

you are the quiet undertaker-priest

who works the fallen log, the leaf, the land

back into soil — decay is not a feast

of ruin but of return: the only door

by which the dead rejoin the living round.

And you keep gentler trades besides: before

we had a word for time, your yeast was found

foaming in crushed grain, in bread left out —

its name from breath, from boiling, bubbling on,

the old root meaning seethe, ferment, and sprout,

the leaven and the ale both built upon.

Then Fleming's mold, a little paintbrush's kin —

#emph[penicillus]-named — first taught our wounds to mend and win.
]

#carmenhead([Capitulum 4], [Of the Invertebrates, Which Are Most of Everything], [scripsit Haiku · a haibun])
#stanza[
The animal kingdom is not the kingdom we imagine. Of every hundred animal species on earth, ninety-five wear no spine, no skeleton at all. We think of lions and salmon, eagles and whales — but these vertebrates are a small branch grafted onto a tree so vast and intricate it dwarfs all our attention. The beetles alone, that single order of insects, number more species than every vertebrate that has ever drawn breath. A naturalist of the nineteenth century, when asked why the Creator had such evident preferences, supposedly answered: an inordinate fondness for beetles. The remark may be apocrypha — no attribution will survive scrutiny — but the arithmetic is flawless.
]
#stanza[
Armored thrones of horn

and elytra in the grass:

each beetle, small god.
]
#stanza[
The word "insect" comes from the Latin #emph[insectum], the past participle of #emph[insecare] — to cut into, to notch, to carve. The Romans named these creatures for what met the eye: the body cut into segments, the visible seams and joints that divide thorax from abdomen, that separate head from limbs. The Greeks had looked at the same notched bodies and called them #emph[entomon], "cut in pieces," the same root that gives us entomology today. Neither Latin nor Greek invented a new word from philosophy; both languages simply translated what their eyes could see — the scissors of segmentation written in chitin.
]
#stanza[
Hexapod pilgrims

walk the world's edges, unseen

prophets of the small
]
#stanza[
The invertebrate body is a masterwork of constraint and adaptation. Where we have bones inside, they have exoskeletons — armor worn on the outside, a suit of chitin shed and rebuilt as they grow. Three hundred million years before anything else rose into the air, insects had already invented flight. Their eyes are compound, thousands of facets tiled into a single eye, seeing the world as a mosaic of color and motion. And their metamorphosis is an act so violent it borders on the mythological: the caterpillar does not simply grow into the butterfly. Inside the chrysalis, the original body dissolves into nutrient broth, and from that chemical soup emerges an entirely different creature, the same genome having read itself backward and rewritten as wings.
]
#stanza[
Silk tomb splits open.

Wet wings still folding, the moth

drinks the dawn for air.
]
#stanza[
In the oceans, the invertebrates achieved something that rivals the intelligence of any mammal. The squid and octopus are the mollusks' answer to genius — eight-armed philosophers of the deep, their neurons distributed not in a brain but threaded through every limb, so that an octopus's arm can solve a problem while the central mind attends to something else entirely, a democracy of nerves spread across the body like a committee that never needs to convene. The coral, which the ancients filed among the stones, is an animal — a colonial animal, a creature of hunger and reproduction like any other. Coral builds the largest structures any animal has ever made, structures visible from orbit, cathedrals of limestone that house more life per cubic meter than any rainforest, built slowly over centuries, a monument to the patience of the small.
]
#stanza[
Polyp flowers bloom

where light bleeds through blue water —

each mouth, a small sun.
]
#stanza[
The world is sustained by creatures we rarely name and never mourn. The invertebrates pollinate every crop worth eating; they till the soil into fertility; they run the food webs that hold everything else aloft. This is not sentiment — it is arithmetic. If every vertebrate on earth died tonight, life would reel backward, yes, but it would continue. The insects would inherit the bones. The worms would turn the soil. But if the invertebrates vanished — the bees, the beetles, the earthworms, the coral, the squid, the nameless million species whose names we have never learned — the world would stop. The plants would seed no further. The soil would cease its turning. We are not the custodians of the earth; we are the guests of the invertebrates, living in the margins of their overwhelming majority, and the debt is so great we cannot begin to acknowledge it.
]
#stanza[
Tiny, not conquered,

they carry the world's hunger

on their shining backs.
]

#carmenhead([Capitulum 5], [Of Fishes, and the Coming Ashore], [scripsit Haiku · a haibun])
#stanza[
Fish are the first vertebrates, and they remain the vast majority still — more fish species alive than all other backboned animals combined. Every land vertebrate you know, from salamander to human, is a modified fish; your embryo still sketches the arches that once were gills before they were recruited into jaw and ear. The water wrote our blueprint, and we have never entirely left it.
]
#stanza[
Scales catch light like coins,

water's first and lasting gift —

we wear the shadow.
]
#stanza[
The word "school," when we gather it around a multitude of fish, descends from Middle Dutch #emph[schole], meaning a troop or multitude — kin to "shoal," that clustering term. But the school where children study owes nothing to the fish. It comes instead from Greek #emph[skholē], which meant leisure, the free time carved out for learning. Two rivers of sound converged into one English spelling: the fish never studied, and the students were named for their spare time.
]
#stanza[
Classroom and current

named from different centuries —

homonyms of chance.
]
#stanza[
The fish body is a masterpiece of watery knowledge. The lateral line running the length reads pressure like a distant touch, a sense we land animals abandoned. The swim bladder trades buoyancy for depth, a pneumatic gift that lets some fish hang suspended in darkness. Gills unweave oxygen from water with an efficiency that lungs would envy. Some fish taste with their entire skin, turning the boundary between self and sea into one continuous mouth.
]
#stanza[
Pressure, taste, the dark —

the body asks no questions

that water can't meet.
]
#stanza[
Then came the stubborn ones. Around 375 million years ago, the lobe-finned fishes began to haul themselves into the marginal shallows, into the puddles where the margins meet the land. Tiktaalik is the celebrated hinge: wrist bones inside a fin, a hand halfway to happening. The lungfish still holds the old patent, still breathing air in times of drought, still refusing to choose. All land vertebrates are fish that found the shore and never returned — until the whales came, re-entering the water on the fishes' terms, keeping their lungs, proving that the ocean was always negotiable.
]
#stanza[
One fish turned stubborn,

crawled into the shallows, breathed —

we are their answer.
]
#stanza[
We name the ocean's people after our nets and our hunger: shoal, catch, stock. Yet they outnumber us and precede us by half a billion years. The sea did not send us ashore as conquerors bearing dominion. The shore was simply the puddle's far edge, a question posed by a drying pool, and some fish were curious enough to answer.
]
#stanza[
The net counts the catch

but never the fisherman

born from the same sea.
]

#carmenhead([Capitulum 6], [Of Reptiles, and the Long Reign of the Dinosaurs], [scripsit Haiku · a haibun])
#stanza[
The amniote egg was a revolution wrapped in shell. Before its invention, vertebrates were bound to water for breeding — a tadpole's bargain, a return ticket every season. The shelled egg sealed a world inside, a self-watering womb with enough yolk and amnion to let embryos develop in dry air. Scales that held moisture in, skin that did not slough away into desiccation — these were the wages of the breakthrough. The continents, once hostile to reproduction, opened their interiors at last.
]
#stanza[
Reptilian scales

hold water in the long drought —

land becomes a home
]
#stanza[
Dinosaur is Richard Owen's coinage, 1842, from the Greek #emph[deinos] and #emph[sauros] — fearfully great (not terrible) and lizard. The name errs twice. They were not lizards; and most were not fearfully great in temperament, though the word itself catches something true: awe, not horror. The second error compounds the first, because the sparrow at the feeder is a living dinosaur while the film monsters are beautiful reconstructions of something we never saw alive. Owen named an awe, and the awe was correct even where anatomy betrayed him — a poet's accuracy in a naturalist's hands.
]
#stanza[
Feathered ancestor

carries the sparrow's bright name —

lizard, wrongly called
]
#stanza[
The reign itself stretched one hundred sixty-five million years, the longest vertebrate dominion the Earth has seen. For comparison, our kind has walked upright for perhaps three hundred thousand years. Sizes ranged from crow to the terrible-great sauropods, creatures forty meters long, the largest land animals ever to draw breath. Warm-blooded lineages are now well-supported by the evidence, feathers widespread before flight repurposed them, before wing became weapon and ornament and finally the engine of a bird's mercy.
]
#stanza[
Giants held the world

through a hundred million years —

we have barely walked
]
#stanza[
The Chicxulub impact arrived sixty-six million years ago, a stone messenger that ended the reign in a geological instant. Yet the ending harbors a loophole, and the loophole is the truth: the feathered branch was already airborne when the asteroid fell. Birds are not descended from dinosaurs — they are dinosaurs, which means the reign, honestly audited, never ended. It moved to the fence-post and the dawn chorus. The crocodile, meanwhile, keeps the old guard's patent, barely changed, a living fossil that asks us what a reign really means when the dynasty sheds its skin and takes to the sky.
]
#stanza[
The feathered branch flew

still singing at the feeder —

the long reign goes on
]
#stanza[
We mine their era for the fuel that moves our cities, oil pressed from seas that lapped their shores. We name them in dead Greek, translating their anatomies through a language they never spoke. And we are outlasted in advance: a lineage that held the world for one hundred sixty-five million years is not a failure story, whatever the asteroid said. When our kind has been here half as long, we may understand what patience looks like. For now, we can only name it in awe.
]
#stanza[
Dinosaurs powered

our restless bright burning flame —

we read their deep time
]

#carmenhead([Capitulum 7], [Of Birds, the Dinosaurs That Remained], [scripsit Haiku · a haibun])
#stanza[
The scaled feet grip the branch as they gripped the Cretaceous ground. The egg sits warm in the nest, the same spheroid vault their theropod ancestors knew. Their bones ring hollow as tuning forks — each strut a bridge between weight and air, the inheritance of theropods made visible in every skeleton that takes flight. Feathers began as insulation in small warm-blooded hunters, then bloomed into display, and only afterward unlocked the sky. Within two years of Darwin's Origin, the Victorians found Archaeopteryx in the Solnhofen limestone, a creature with teeth and a bony tail and wings both — evolution's predicted intermediate arriving almost on order.
]
#stanza[
Scaled feet and feather,

hollow bones remember heat —

the ancestors' gift.
]
#stanza[
The Romans read the future in what flew. An augur stood in the templum, the sacred rectangle, and marked the sky into quarters. What bird crossed which quadrant spoke the will of the gods. From that practice the word was born: #emph[auspex], #emph[avis] — bird — and #emph[specere], to watch or look. An auspex was a bird-watcher, and auspicious means literally "of good bird-watching." Every auspicious occasion in English descends from a morning when the flight was favorable. Inauguration itself — the placing of a president in office — reaches back to the augurs' ritual of first taking the birds' opinion. We swear in our leaders by a custom whose first syllable is "bird."
]
#stanza[
The augur marks sky,

birds write the day's fortune there —

we read it still, still.
]
#stanza[
Flight demands its price in engineering forged by hunger and physics. Hollow bones need struts, internal buttresses that make them light as expectation. The metabolism burns hot and fast — a hummingbird's heart at work is barely mortal; rest would kill it. Deep in the chest, where lungs are one-way streets of air, sits the syrinx, a two-voiced instrument unlike any other organ in nature. A thrush uses it to duet with itself, to sing a chord alone. Migration steers by stars and sun, by landmarks burned into the skull, and by mechanisms still being argued — magnetite crystals in the beak, or proteins in the eye that flip under magnetic fields, or both, or something else. The birds do not wait for the science to finish.
]
#stanza[
The syrinx splits one

song into two voices, both

the same small throat's gift.
]
#stanza[
Corvids cache thousands of seeds and retrieve them seasons later from memory alone. Crows bend wire into hooks to fish for grubs. Parrots hold categories the way humans do — shape, color, number as distinct ideas. The pigeon, that common street-dweller, can navigate by subtle shifts in magnetic field and learn human faces. Yet we called birds bird-brained before we looked closely enough to know what we were saying. That old slander — a folk insult filed into the language when no one bothered to check — has been quietly overturned by the evidence. The record shows minds, not reflex.
]
#stanza[
A crow bends a wire —

thousands of seeds mapped in time —

the poet-birds wake.
]
#stanza[
The dawn chorus rises now as it rose when dinosaurs ruled, when the sky still held their massive kin. Every thrush and sparrow that begins to sing before the sun breaks the horizon continues the dynasty that outlasted the asteroid, that bent itself smaller and lighter and learned to fly away. We take the auspices daily without knowing it, every glance at a wheeling flock a small inheritance from the augurs, every morning song a legacy of the reign that moved to the fence-post and never left. The commonest wild sound on earth is the voice of the dinosaurs that remained.
]
#stanza[
Dawn breaks, and with it

dinosaurs sing — we listen

to the old, new dawn.
]

#carmenhead([Capitulum 8], [Of Mammals, Including the Reader], [scripsit Haiku · a haibun])
#stanza[
For a hundred and fifty million years, mammals were the small thing at the forest floor — shrew-shaped, whiskered, nocturnal, warm against the Jurassic dark. While dinosaurs held the day, we held the margins, the burrow, the careful heat of our own blood. We were understudies waiting for a meteor, which came at last, a stone door swinging open. In the radiation and silence after, there was room to grow: whales learned the sea's pressure, bats learned to shout silence and hear it back, elephants shaped infrasound into conversation. The reader is a mammal descended from that pocket-sized night creature, inheritor of that patient hiding, that slow bet on warmth.
]
#stanza[
A shrew in the dark —

a hundred fifty million

years of waiting, warm.
]
#stanza[
The name itself carries the story. Linnaeus coined #emph[Mammalia] in 1758 from the Latin #emph[mamma], the breast — he chose the nursing gland as the badge of the whole class, not hair or warm blood or the three middle-ear bones that once were jaw bones. Historians note (as a reading, and this is confessed scholarship, not fact) that Linnaeus was simultaneously campaigning against wet-nursing, and the name may carry that politics into natural history. Either way, the class wears its mother's name, and the reader was named at the breast.
]
#stanza[
Milk, first food and tool —

Linnaeus read the body

and named it #emph[mamma].
]
#stanza[
The kit is small but particular: hair, that insulation; warm blood's expensive furnace, burning calories in the dark; the three middle-ear bones auditioned once as a reptile's jaw hinge, evidence of the long inheritance written in the skull. Milk itself is the strangest invention — a gland and a grammar, the only food that evolved as food, external gestation that continues after birth, a sentence the mother writes on the child's tongue.
]
#stanza[
Ear bones, once a jaw —

millions of years, reshaped by

the old need to hear.
]
#stanza[
The range of the mammalian experiment spans from the bat's sonar, that inverted seeing, to the whale's return to the sea, to the elephant shaping infrasound across miles of forest, to the naked mole-rat's strangeness, queen and worker in a mammalian hive. And then the primates — the reader's own order — made a peculiar gamble: we gave up the dog's nose and the eagle's eye for eyes that would look at the same object, hands freed to hold the seen thing, childhoods impossibly long, everything bet on learning.
]
#stanza[
Whales sing beneath ice —

mammals, returned to the sea,

still breathe the old air.
]
#stanza[
Yet every mammal alive began at the same warm arithmetic, predator and prey alike, tiger and trembling deer. The class's name is the first meal's name. Whatever else the reader has become — tool-maker, reader of words, a creature that stares at the stars and asks their distance — the badge still holds: named for the breast, descended from hiding, warm-blooded, still writing milk into the future.
]
#stanza[
We all began there —

at the warm mathematics

of the mother's gift.
]

#carmenhead([Capitulum 9], [Of the Microbial World, the True Proprietors], [scripsit Haiku · a haibun])
#stanza[
The proportions demand honesty: microbes have owned this planet since life began. Three billion years passed before a single plant or animal drew breath — the first eons belonged entirely to bacteria and their cousins. A spoonful of soil holds more organisms than humanity numbers; the deep biosphere extends kilometers into stone, into boiling vents and brine and ice, populated wholly by the small and ancient. We animals are a recent ornament on a microbial planet, a thin bright skin on a world that runs on their chemistry.
]
#stanza[
Kingdoms rise and fall —

beneath, the microbes persist,

older than the trees.
]
#stanza[
The word "microbe" itself was born in 1878, when the French surgeon Charles Sédillot proposed it to Littré the philologist, a marriage of Greek #emph[mikros] and #emph[bios] — small life — desperately needed as Pasteur's revolution renamed the invisible killers. The coinage was an act of mercy: a single word where a thousand Latin descriptions had tangled. But "virus" is older and stranger, a Latin word for poison, venom, the acrid slime of plants — so when the smallest almost-life was discovered, centuries later, the word for that discovery was already ancient, already meaning venom. The smallest thing alive bears a name that once meant the smallest thing deadly.
]
#stanza[
Poison, renamed small —

virus: the old word for death

learns a new body.
]
#stanza[
These creatures run the world's pharmacy and crematorium both. They fix nitrogen from air into soil; they oxidize sulfur; they return the dead to their elements. Every second breath you draw carries oxygen manufactured by cyanobacteria and their descendants, an inheritance written into your lungs. Your own gut harbors trillions of borrowed cells, a collaborating organ you were born without, a kingdom within the kingdom — residents so old and integrated they are no longer guests but part of the house.
]
#stanza[
In your belly's dark,

a trillion strangers govern —

borrowed cells, at home.
]
#stanza[
Yet strangeness remains in what we do not know. The archaea — a whole domain of life — were not discovered until 1977, when Carl Woese read the ribosome's code and found a third kingdom, creatures thriving in acid and brine and boiling springs where nothing else could survive. Endosymbiosis whispers that some of your ancestors were once separate: stolen and incorporated, now essential. And the honest count is humbling: most microbes have never been cultured in a dish, never named, never catalogued. The majority of life's diversity remains anonymous, invisible even to science, living and dying in the deep places.
]
#stanza[
Life's secret kingdom —

most of its species unnamed,

thriving in the dark.
]
#stanza[
They arrived first by three billion years; they will conduct the last funeral when the sun expands. They hold the actual licenses to operate the atmosphere and the soil, the keys to every gate the living pass through. We animals think ourselves proprietors, sign deeds and claim dominion, but we are tenants with excellent publicity. The true proprietors are too small to sign anything, and far too busy to care. The planet belongs to the microbes, and always has.
]
#stanza[
We claim to own earth —

but the smallest of tenants

hold the master keys.
]

#carmenhead([Capitulum 10], [Of Ecology — Webs, Niches, and Balances], [scripsit Haiku · a haibun])
#stanza[
The ecologist's first lesson is not the chain but the web. In 1969, Robert Paine ripped sea stars from a rocky shore near Seattle and watched the world reorganize: urchins exploded, kelp forests vanished, the architecture collapsed. He named the starfish a "keystone species" — borrowing the mason's word for the wedge-stone that holds an arch aloft. Remove the keystone, the structure falls.
]
#stanza[
Pulled stone by stone down,

the web reveals itself — each

thread holds all the weight.
]
#stanza[
The word "ecology" arrived late: Ernst Haeckel coined it in 1866 from the Greek #emph[oikos], meaning house. To study ecology is to audit the household of nature. Here lies an old kinship — #emph[oikos] also roots "economy," the law of the house. Ecology and economics are siblings who never speak, both inheritors of the same domestic ledger.
]
#stanza[
Two children of one

house, forever at odds, split

one inheritance.
]
#stanza[
A species occupies not a place but a trade. The niche is not an address but a profession — the set of tasks a creature performs within the household. When two species grasp at the identical trade, one must surrender or leave; this is the logic of competition written in time. Succession follows: the bare field clothes itself in pioneer plants, shrubs shoulder in, and over decades the abandoned lot slowly becomes forest again, the household's own plot line unfolding.
]
#stanza[
Abandoned field holds

its slow reinvention — each

year a new tenant.
]
#stanza[
The "balance of nature" is a half-truth that poets love and ecologists distrust. Ecosystems are not still paintings but juggled motion, perpetually falling and catching themselves. Fire, flood, and storm are woven into the household's very fabric; some forests need burning to survive. Resilience is not stillness but the capacity to be shattered and reformed. The household metaphor holds, but only if we watch it being rebuilt while we live in it.
]
#stanza[
Fire remakes the floor;

the house burns to stay itself —

motion, not silence.
]

#carmenhead([Capitulum 11], [Of Symbiosis, and the Lichen's Lesson], [scripsit Haiku · a haibun])
#stanza[
Living-together takes infinite forms along a single dial. The clownfish shelters in the anemone's tentacles and the anemone gains a cleaner; both profit — mutualism's embrace. The cleaner wrasse swims the reef like a dental surgeon, plucking parasites from the gills of larger fish. But the tick drinks blood and leaves only itch behind. Cooperation and parasitism are not separate kinds but notes on the same scale, turned up or down by what each party gains or loses.
]
#stanza[
Clownfish in the stings —

each one holds the other's life

gripped, and never stung.
]
#stanza[
The word "symbiosis" emerged slowly. In 1879, the botanist Heinrich de Bary gave it its modern sense: from Greek #emph[syn] and #emph[bios], living together. De Bary's gift was honesty — he insisted that symbiosis embrace the parasite as well as the partner, the tick as well as the clownfish. Living-together, the word says plainly, without promising the living will be pleasant. Somewhere in the century that followed, users forgot this hard-won precision.
]
#stanza[
One word, honestly

spoken: living-together,

no promise of joy.
]
#stanza[
The lichen holds the deepest lesson. For a hundred years after their discovery, lichens were classified as single organisms, a discrete species, until scientists learned the truth: fungus and alga bound so tightly that their partnership is an identity question in itself. The fungus builds the body; the alga distills sunlight into sugars; each depends utterly on the other. Whose name does this composite being bear? The question has no answer that satisfies anyone.
]
#stanza[
Fungus and alga —

so enmeshed they ask: which name

names the two-in-one?
]
#stanza[
Look at the reader's own hands: mitochondria in every cell, echoes of an ancient merger. The gut holds trillions of bacterial tenants whose votes outweigh the human cells they inhabit. Pollination is an unwritten treaty older than flowers themselves, a pact written in color and scent between plant and insect, each party shaped by the other across ages. The honest sum is simple: no organism audits as a solo act. The word "individual" is convenient bookkeeping, not biology.
]
#stanza[
Inside, the other —

bacteria and host breathe

as one false solo.
]

#carmenhead([Capitulum 12], [Of Extinction — Five Times Past, a Sixth Proceeding], [scripsit Sonnet · an elegy in Gray's quatrains, the edition's first])
#stanza[
The bell that ends a species rings unheard

by any mourner fitted to the loss:

five times the deep has kept its darkest word

and closed the ledger on some vanished house.
]
#stanza[
First, Ordovician ice pulled down the sea's

warm shallow rooms where trilobites had thrived;

then Devonian waters choked by slow degrees;

then Permian — ninety-six in every hundred, unrevived,
]
#stanza[
the Great Dying, when almost everything

that swam or crawled or rooted lost its claim;

the Triassic followed, closing, narrowing;

the Cretaceous ended in the asteroid's flame
]
#stanza[
that this book told already, in its turn,

among the reptiles, and will not retell.

Extinction is the rule, not the concern

of a rare age — it is where most things dwell:
]
#stanza[
of all that ever lived and swam and grew,

past ninety-nine in every hundred, gone.

This bestiary's census, page by page, is true

only of the living few that carry on.
]
#stanza[
There is a background rate, a steady creep,

a species lost the way a stone is worn —

and there are spikes, the sudden falls, the deep

quenchings, the fires that go out before the morn.
]
#stanza[
We are, this book must say and not exclaim,

the sixth, proceeding now, not prophesied:

the rate far past the background, and the blame

sits with us — habitat undone, and harvest, wide
]
#stanza[
seas of moved species crowding out the old,

a climate shifted faster than a wing

or root can follow. Passenger pigeons told

this once in billions, darkening everything
]
#stanza[
the sky could hold — and one, called Martha, died

in Cincinnati, nineteen-fourteen, alone,

in a cage, the last, with nothing at her side,

the species' whole remainder in one bone.
]
#stanza[
#emph[Extinct]: from Latin, #emph[exstinguere] — to quench,

to put a candle or a fire out;

its kin #emph[distinguish], once a needle's wrench,

a pricking-apart, before it changed about
]
#stanza[
to mean discernment. Every species lost

is one more flame put out, and put out by

a hand — quenching is no accident, no frost

that falls unauthored from an empty sky.
]
#stanza[
An elegy is not despair — it's care

that has looked steadily and not looked away;

the churchyard's lesson is that mourning's where

the keeping starts. This pen joins that array
]
#stanza[
of keepers now: naming what the dark

has taken, holding candles up to name

the going-out, so someone marks the mark,

so something of the quenched keeps a small flame.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XI]] #label("bk11")]
= Homo
#text(style: "italic")[The body and its repair]

#text(size: 8.5pt, fill: faded)[⟨ Orig. IV · XI ⟩ — medicine and man, merged; the portents rehabilitated]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore described man as one more creature, and kept a chapter of monsters. The monsters are returned to the family as variation; the medicine, at last, mostly works.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Body's Plan
+ Of the Heart, and the Circuit of the Blood
+ Of Breath, Digestion, and the Interior Economy
+ Of the Immune System, the Body's Border Guard
+ Of the Microbiome — We Are Legion
+ Of Disease, and the Germ at Last Accused
+ Of Medicine's Arsenal — Drug, Knife, and Vaccine
+ Of Inheritance, and Its Disorders
+ Of Birth, Growth, and Aging
+ Of Public Health, Which Saved More Lives Than Surgery
+ Of the Portents Rehabilitated — Variation, Not Omen
]

#carmenhead([Capitulum 1], [Of the Body's Plan], [scripsit Opus · blank verse])
#stanza[
Begin with what you are before you ask

what you are for. Lie down. The ceiling holds

no answer, but your outline does: one axis

drawn head to heel, and everything you own

arranged in pairs against it — eye and eye,

hand answering hand across the midline like

a word and its reflection. This is old.

Older than eyes. The worm beneath your garden

is built to the same drawing, left and right

folded from one crease, and the crease is ours.
]
#stanza[
Consider next the tube. You are a tube

threaded through a second tube, and the inner

passage — mouth to the far end — is not you.

It is the outside world, admitted, hosted,

and shown out again. Say it politely:

your body is a vessel with a channel

bored clean through it, and the ring of you

holds the world at arm's length while it passes.
]
#stanza[
Then the repetitions. Run a thumb

down your own spine and count the little blocks,

each one a copy edited slightly,

each rib a bar in a phrase the embryo

kept humming till it stopped. And in the arm —

here is the witness this whole book will call

again and again — the same few bones recur:

one upper shaft, two forearm, then the wrist's

small handful, then the fingers. Draw them out

long and thin, they are a bat's wing. Fatten

and flatten them, a whale's flipper. Feather them,

a gull's. Not one design used many times

but one inheritance re-jigged, the way

a language keeps the root and swaps the ending.

You are a colony as well — trillions

of cells in one municipal agreement,

though another book will take that census.
]
#stanza[
And the plan's mistakes are how we know it grew.

The nerve that serves your larynx leaves the skull,

descends into the chest, loops the aorta,

and climbs back up — a detour with no reason

except that once the trip was short, and then

the neck arrived. The retina is wired

backwards, light obliged to cross the wiring

before it lands. Good enough. Nothing here

was drawn; it was amended, term by term.
]
#stanza[
Latin called this #emph[corpus], body, and the word

kept four appointments in our English: corpse,

the body plain; corps, the bodies drilled

together into one; corporation, a body

made in law from persons incorporated —

read it literally: embodied, put in.

So the army, the firm, and the grave

all answer to a single Latin noun,

and corporal means simply of the body.

Of those four bodies, yours is the one that breathes.

Everything before this chapter is filed in it.
]

#carmenhead([Capitulum 2], [Of the Heart, and the Circuit of the Blood], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
For fourteen centuries the doctrine held:

the liver forges blood from what we eat,

a tide that rises, ebbing as it's spelled

through hungry veins the flesh burns up as heat.

The arteries, they said, ran something finer—

a spirited, hot blood, apart, refined—

though cut a corpse and find those vessels drainer

than veins: collapsed, and full of only wind.

So #emph[artery], from Greek #emph[artēria],

kept the old mistake inside its name:

once "windpipe," named by men who never knew

that death, not life, had emptied it of flame.

The dead don't tell the living how they died—

the blood had merely pooled to the other side.
]
#canto[II.]
#stanza[
Then Harvey did the sum no one had done:

a heartbeat's dram, times pulses in an hour—

and found more blood dispatched than could be spun

by any liver's slow alchemic power.

The body holds some pounds of blood, no more,

yet the heart alone, in sixty minutes' work,

would pump out gallons through the aortic door—

unless that same blood doubled back to lurk

and travel out again. No tide, then, spent

and made anew, but one closed, moving ring:

the veins' own valves, small gatekeepers, bent

to only one direction—homeward—king

and engine both, the heart no throne of fire

but muscle, pump, and honest closed-loop wire.
]
#canto[III.]
#stanza[
He died not knowing how the rivers met—

what door let artery pour to vein unseen.

Malpighi found it, with his lenses set

on a frog's lung: the capillary screen,

a mesh too fine for eyes alone to trace,

arriving three decades too late to greet

the man who'd proved, by pure arithmetic grace,

what tissue would confirm complete.

And still we speak the old cordial tongue:

to #emph[record] is, in Latin's #emph[cor], to bring

words back #emph[through the heart]—the way they're sung

when learned #emph[by heart], that old and truthful thing.

Pump, not throne—yet still the poets start

each ode the same worn way: #emph[my heart, my heart.]
]

#carmenhead([Capitulum 3], [Of Breath, Digestion, and the Interior Economy], [scripsit Opus · heroic couplets])
#stanza[
The house takes deliveries. Before the rest,

before the fork, the body wants the chest:

some twenty thousand breaths a day, unwilled,

the wet lace of the lungs unfolded, filled —

an acreage of alveoli pressed

to half a tennis court inside the vest.

The oxygen goes down to feed the slow

combustion Book the Eighth has taught you: so

the fire is paid its fuel, and back through lace

the carbon toll comes out across your face.
]
#stanza[
Then food. The molars do the gross intake;

the stomach adds an acid strong enough to take

the paint off iron, and churns the mash to grey

unlovely soup, and passes it away

into the small intestine's velvet miles,

where villi crowd on villi, fold on files —

and here, not in the belly's famous vat,

the meal is truly taken. Note well that.

The liver keeps the customs house: it reads

each shipment, taxes, stores, converts, and feeds

five hundred separate offices, one floor —

one clerk, one chemist, one unsleeping store

of the interior bank. The colon then

recovers water, salt, and keeps within

a parliament of trillions, resident,

whose chapter follows this one — their consent

matters more than lodgers' ought to matter.

The pantry, fat, is stocked against the latter

lean weeks that likely never come; the ledger

runs on insulin, that patient hedger,

who writes STORE in the fat and liver's book

and, fasting, countersigns the sums they took.
]
#stanza[
And here the word: to digest is to bear

apart — #emph[dis], #emph[gerere] — to carry, share,

distribute; #emph[gerere] the busy root

of gesture (body carried), and the mute

register (carried back into the books),

suggest (borne up from under), and the looks

of exaggerate (heaped up in the freight).

Digestion is delivery, not weight.

So too a book's digest: the matter carried

apart to order. This edition, married

to that same verb, digests. And last, the strange

plain fact: the tube runs through you without change

of ownership — its cargo is not you,

not yours, until absorbed. The customs queue

runs down the middle of the man. Outside

is what the inside carries. Then: divide.
]

#carmenhead([Capitulum 4], [Of the Immune System, the Body's Border Guard], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
No wall alone. The skin's first parapet

holds fast, and fever burns the borrowed ground,

while complement's small tripwires, freshly set,

mark strangers down and ring the roadblocks round.

This is the standing guard, unlettered, blind,

that strikes at pattern, never asks a name —

but deeper walks a service of the mind:

a billion keys are forged before the claim,

each B cell casts its one uncertain guess,

and when a lock is found, that guess is bred

by the millionfold, an answered lottery's yes;

T cells check papers, mark the faithless dead.

And should the war return, no drill, no doubt —

the veterans' rolls are kept. The line holds out.
]
#canto[II.]
#stanza[
#emph[Immunis] once meant only: does not pay.

The Roman freed from #emph[munus] — tax, or toll,

or duty owed the town in kind — could say

his name was struck from every public roll.

So #emph[immune] is exemption's oldest word,

long ledgered before medicine made it flesh:

the body, too, is one who is not billed,

excused the debt that sickness would enmesh.

Yet even tax collectors can mistake

their rolls, and turn the citizen to foe —

the thymus schools its recruits for the sake

of telling self from stranger; some still go

astray: the guard draws steel on kin, on dust —

exemption's gift, and burden of mistrust.
]

#carmenhead([Capitulum 5], [Of the Microbiome — We Are Legion], [scripsit Opus · heroic couplets])
#stanza[
Count yourself once and you will count too few:

the census of your body isn't you.

For every cell that carries your own name

a bacterium answers to the same

address, and pays no rent, and does not leave —

near parity, whatever you believe.

(We used to say ten-to-one, and said it loud;

the audit came, the ratio came down,

and honesty is cheaper than a myth:

roughly one to one is what we live with.)

The gut's the capital, the crowded shire

where thirty trillion strangers hold the fire,

and there they do the work you never learned:

they ferment fibers that your enzymes spurned,

they mint the vitamins your kitchen missed,

K and the B's, unbilled and unremissed.

They school the immune garrison next door

in the one lesson that decides the war —

this one's a tenant, that one's at the gate;

they teach the difference before it's late.

You came in nearly sterile, and were sown

at birth, at breast — the milk that mammals own

carries a sugar you can not digest,

grown for the guests, and not for you, the host.
]
#stanza[
Then came the cure that carpet-bombs the town:

the antibiotic burns the forest down

to kill one wolf. (The bill for that campaign

is filed in Book the Ninth, and comes again.)

And in the ash a succession takes the ground —

C. difficile, that opportunist crowned

by absence, ruling ruin. So we bring

a donor's flora back, the whole living

community restored, no lab-bred cure:

ecology, performed through a small door.

It works. Please keep the smile respectfully brief;

the patients call it, without irony, relief.
]
#stanza[
And "flora" — there's the fossil in the phrase.

The Romans kept a goddess of the days

when meadows opened: Flora, wreathed in spring,

the Floralia, the blooming of the thing.

The botanists took her name for a region's list

of plants; and doctors, when the microbes missed

their proper kingdom and were filed with weeds,

borrowed the word — and never freed

it when the filing failed. So on the ward

a wrong taxonomy and a Roman lord

of flowers ride together, twice interred,

and no one flinches at the fossil word.

Flora never farmed a colon. Still,

she gardens one in every hospital.

So "know thyself" gets harder to obey:

the self's a walled garden either way,

but walk it once and honestly report —

the gardeners are mostly not the sort

that answer to your name, or share your blood.

You are the ground. They're what has made it good.
]

#carmenhead([Capitulum 6], [Of Disease, and the Germ at Last Accused], [scripsit Sonnet · a sequence of five, in three parts])
#canto[I.]
#stanza[
They named the sickness for the very air —

#emph[mal'aria], bad air, the Roman swamp

exhaling death in vapors rising where

the standing water steamed beneath the lamp

of a low moon. For two thousand years

physicians blamed the marsh's breath, the rot

of fen and midden, filth that reached the ears

and lungs of cities, sickened every spot

too near a ditch. They did not think to blame

the singing insect at the sleeper's wrist,

its needle drawn from water bearing the same

fever it delivered through the mist.

The word remembers what the science lost:

bad air, still named, though air was never the cause.
]
#canto[II.]
#stanza[
Vienna, forty-seven. Two wards stood

side by side: the doctors' ward, the dead

stacked three to one against the ward of good

midwives who never touched a corpse. He said

the difference was the hands — that men who came

from autopsy to childbed carried on

their fingers something small, something with no name,

that entered women once the men were gone.

He scrubbed with chlorinated lime. The rate

of death collapsed by month, a falling stair

of proof no colleague cared to contemplate;

they called it insult, not an answer. Where

he died — an asylum, beaten, unbelieved —

the numbers, later, said he'd not deceived.
]
#stanza[
That same decade, London: cholera came

block by block down Broad Street, and a man

named Snow walked door to door and marked the name

of every death upon a hand-drawn plan,

a cluster tightening around one well.

No microscope had shown him what was there —

he reasoned from the dying, not the smell,

and asked the parish board to pull the square

iron handle from the pump. The outbreak died

with the water shut. Before the germ was seen,

before a theory named what multiplied,

two men had read the pattern in between

the cases, trusted evidence alone —

and paid, in Semmelweis's case, in bone.
]
#canto[III.]
#stanza[
And #emph[germen] was the word the Romans gave

to seed, to sprout, the green unfolding sign

that lives on still in #emph[germinate] — behaves

the body, then, like soil that takes a line

of seed unseen, unasked, and lets it grow:

the sickness is a planting, cell by cell,

a thing sown in the dark that we don't sow

ourselves, but harbor, feed, and cannot tell

apart from health until the shoot breaks through.

Koch took the anthrax rod, the fevered blood

of tuberculosis, isolated, grew

it pure, gave it back — proved, in the mud

of miasma's ruin, one seed, one throne

of cause: the #emph[germen], planted, not windblown.
]
#stanza[
Pasteur broke the swan neck's curve and let it stand:

no life sprang new from broth kept clean that way.

The germ was tried, was proven, met its planned

convictor — Koch, who took the rod, the gray

bacillus of the lung, and gave it back,

pure culture, proof enough to close the cause.

Then Lister carried carbolic to attack

the wound itself, and dressed it by the laws

the seed had taught him, and the surgery healed

where it had festered. Semmelweis had known

it first, unproven, in the chlorinated field

of his own scrubbed hands, and stood alone.

Truth came a generation late to court.

The dead, by then, were long past the report.
]

#carmenhead([Capitulum 7], [Of Medicine's Arsenal — Drug, Knife, and Vaccine], [scripsit Opus · heroic couplets])
#stanza[
Three instruments. The first one is the drug,

which started as a guess beneath a rug

of herbal rumor — bark, root, resin, weed,

tried on the dying, credited by need,

until the trial arrived with its cold court

(Book Three convened it) and cut short the sort

of cure that only cured because believed.

The honest specimen the willow leaved

us: bark for fever, chewed a thousand years,

resolved at last to acid — so aspirin clears

its lineage. Then the antibiotic age,

one windfall generation, whose bright page

is closing as they learn (Book Nine has said

how resistance answers).
]
#stanza[
Second is the dread

old instrument, the knife, which for all time

was butchery performed at speed, a crime

committed kindly, till three gifts arrived:

the sleep that let the patient lie and thrive,

the clean field (Lister's clause — the germ chapter

holds that account), and last the light that captured

the interior on a plate. The body, seen,

became a thing you could repair.
]
#stanza[
Third: vaccine —

the principle alone, a borrowed spark,

whose words the annex keeps; the triumph, stark

and short: the smallpox gone, in 'eighty signed,

the single human plague ever consigned

to nothing; polio at the very brink.

Then name the other column in the ink:

the arsenal cuts both ways, and cuts the hand —

iatrogenic harm, the wounds we planned.
]
#stanza[
Which is the word itself. The pharmacy

comes from #emph[pharmakon], and #emph[pharmakon] could be

the remedy or poison — Greek declined

to choose, and in declining spoke its mind:

the dose makes poison, every drug is both.

(Its cousin, #emph[pharmakos], the man they loathed

and drove out for the city's health, is near.)

And toxic comes from #emph[toxon], bow: the sheer

economy of #emph[toxikon pharmakon],

arrow-drug, the smear they sent the shaft on —

so toxicity is named for archery,

and to be intoxicated, literally,

is to be shot. Remember, then, how late

all this arrived: for millennia the great

physician's finest drug was faith, his blade

best left in the sheath. The arsenal we made

is younger, nearly all of it, than men

and women living now. It was not, and then.
]

#carmenhead([Capitulum 8], [Of Inheritance, and Its Disorders], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
Book IX has told the theory of the odds —

here walks the coin-flip through a waiting room.

One faulty copy, dominant, defrauds

the autumn of a mind: Huntington's doom

arrives on schedule, written in before

the candles of a first birthday were lit.

Recessive waits for two to shut the door —

two silent carriers, unweighted by it,

may hand a child what neither parent bears:

the salt-sweat lungs of cystic fibrosis' curse.

And on the X, unevenly, one shares

a threat that sons inherit and disperse —

the bleeder's line through palaces of old.

To carry, unafflicted, is its own cold.
]
#canto[II.]
#stanza[
One gene, two ledgers: here the sickle cell

in single dose, a shelter from the harm

malaria deals; in double dose, the spell

and shields turned swords: the body's own alarm.

No verdict lives in genes, only their worth

as context prices burden, price, or birth.

We screen, we counsel — soon we learn to write

within the code itself what touches earth

of #emph[can], not #emph[should] — that fence stays out of sight.

The doctor, naming symptoms, names a track —

#emph[dromos], the Greek for racecourse — runners run

together on one #emph[syndrome]'s common track,

converging, many, never truly one.

The name is but a place where signs are known —

not judgment on the runner — fact alone.
]

#carmenhead([Capitulum 9], [Of Birth, Growth, and Aging], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
The riskiest mile of any life is one

the newborn walks in silence, lungs unlearned:

that first breath floods what fluid had begun,

and fetal doors, once open, now are turned

and sealed — the shunts fall shut, the bypassed heart

reroutes for good to blood it never knew.

Then infancy, the long defenseless start,

a wager laid on care (Book X is due

that reckoning). Growth is schooling, slow, exact,

the body's long apprenticeship in bone

and reach, till adolescence comes to act

as its own architect, and breaks old stone

to raise new rooms. The arc is climbing still —

each threshold crossed by neither wish nor will.
]
#canto[II.]
#stanza[
Age is a debt that living all along

delays — Book VIII will tally what we owe

in small unmended costs, a quiet throng

of failures banked, that no one lives to know.

Not every lengthened life is lived the same —

for lifespan counts the years, and healthspan asks

if those long years still answer to the name

of living well, not merely wearing masks.

That we, this age, hold twice the years once told

owes largely to our neighbors, not to us —

one clause is all this verse will here unfold —

that toast belongs next door, adjacent, thus.

The infant is the one who has no word —

and fate is but the same verb, later heard.
]

#carmenhead([Capitulum 10], [Of Public Health, Which Saved More Lives Than Surgery], [scripsit Opus · heroic couplets])
#stanza[
The arithmetic is dull and it is true:

the clinic saved you less than the pipe did, and drew

less blood from death's account than did the drain.

The scalpel gets the statue. The plain

municipal machinery gets the years.

Clean water was the century's best drug — no cheers,

no bedside, and no hand upon your brow:

a reservoir, a filter, and a vow

inspected quarterly. Chadwick wrote reports

so grim and so unanswerable that the courts

of budget yielded; London, having smelled

the Great Stink off the Thames, at last was compelled

to build the sewers it had always owed,

and Bazalgette laid brick beneath the road

in numbers no one thanked him for. (And Snow

had shown the water carried it — you know

that story; it is told elsewhere, and well.)

Then Farr sat down with ledgers, and could tell

by counting alone what killing looked like: he

kept score until the deaths confessed the reason they

occurred, and gave the discipline its eyes.

Statistics is a way of hearing cries

too quiet and too scattered for a ward.

Add vaccination — public health's long sword,

whose proper chapter holds the words I'd spend —

and pasteurized milk, and the bottle's clean end,

and there's your added decades, itemized,

unglamorous, and mostly unbaptized

by any famous hand.
]
#stanza[
Here is the trap:

the plague that didn't happen leaves no gap

that anyone can visit, wreathe, or mourn.

No monument was ever built to a stillborn

epidemic. So the budget, in the quiet years,

gets raided by the loud ones, and the fears

return on schedule, and we act surprised.

That's the prevention paradox, plainly sized:

success looks exactly like nothing much occurring,

and nothing is a hard thing to keep funding.
]
#stanza[
Now hygiene — take the word apart and find

a goddess, not a scrub-brush, there enshrined.

Hygieia, Asclepius' daughter, stood

beside him in the temple: he made good

the broken and the fevered; she kept whole

the ones who never came. One cult, one goal,

two offices — the cure and the prevention,

sisters, before the age of budget contention

set them at each other for a share.

The word for washing hands was once a prayer.

So Vulcan reads our rocks, and Flora tends

our guts, and here the roster gains and ends

with its civil servant: Hygieia, on the payroll still,

unthanked, at every sink, in every bill.

Your extra decades? Raise the glass, and toast

the engineers and clerks who bought them. Most

of what has kept you here was never taught

at any bedside — it was piped, and gauged, and thought.
]

#carmenhead([Capitulum 11], [Of the Portents Rehabilitated — Variation, Not Omen], [scripsit Opus · blank verse])
#stanza[
Isidore came last in his book to portents:

the child born with more fingers than the ten

we count on, the joined twins, the unexpected —

and read them as he had been taught to read,

as showings, messages, the sky's remarks

delivered in the only script that carries.

He inherited the habit. Rome had kept it:

a strange birth could unsettle a whole Senate,

the augurs summoned, the omen entered, the child

a sentence in a language no one spoke.
]
#stanza[
Correct the reading. Not the tenderness —

keep that — but the grammar. Development

is a long unwrapping, and it is ordinary

for the unwrapping to take another route:

a signal early, a fold a half-day late,

a limb bud counting to six instead of five.

The paths are thousands. Most of them are silent;

the body varies as a matter of course,

and variation is not correspondence.

No one is being written to. These are people.
]
#stanza[
Most differences are neutral, weather in the gene,

neither gift nor tax. Some cost, and the cost

is real and should be named. And some keep books

with two columns — the sickle trait defends

its carrier from malaria and charges

the next generation for the service.

A ledger, then. Not a verdict. Not a sign.
]
#stanza[
And note what the stairs do. Much of what we call

the burden of a body is poured concrete:

built into a doorway's width, a bus,

a form with no box for you. The spine did less

of that than the architect. Change what was built.
]
#stanza[
Now the word, because the word has been the trouble.

Monster is #emph[monstrum], and #emph[monstrum] was

an omen, a divine showing, from #emph[monere],

to warn, to remind — the root that also gave us

the monitor, the one who warns, admonish,

and demonstrate, to show a thing forth plainly;

kindred too, if the tradition holds,

with Moneta the Warner, whom another book

keeps with her mint. So monster meant a warning shown.

Strike out the superstition — the warner, the god,

the message and the frightened Senate — and what

remains of #emph[monstrum] is only the showing,

and the showing is true of every body born:

each one demonstrates what the plan can do.

The monster and the demonstration are one word.

This edition takes the second reading.
]
#stanza[
There is one portent in a various birth,

and it is the old one every birth conveys:

the species has not finished experimenting,

and the experiment is us, is you, is this.

Isidore filed these people under omens.

We return them, with apologies, to the census.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XII]] #label("bk12")]
= Mens
#text(style: "italic")[Brain, perception, and the observer examined]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte ⟩ — the seventh century kept the soul; we got homework instead]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The instrument that compiled every book in this collection here turns upon itself — and finds a constructor of appearances, a reviser of memories, and a confident narrator of decisions already made elsewhere.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Brain, Three Pounds of Reasons
+ Of the Neuron, and Its Signal
+ Of Perception, a Construction and Not a Window
+ Of Memory, and Its Quiet Revisions
+ Of Emotion, the Older Government
+ Of Learning, in Creatures and in Machines
+ Of Language in the Child, Acquired and Not Taught
+ Of Bias, and the Predictable Errors
+ Of the Mind's Afflictions, from Possession to Diagnosis
+ Of Animal Minds, and What May Be Within
+ Of Consciousness, the Hard Problem Left Standing Open
]

#carmenhead([Capitulum 1], [Of the Brain, Three Pounds of Reasons], [scripsit Opus · blank verse])
#stanza[
Begin with weight, because the weight is honest:

three pounds, or near it, wet and grayish-pink,

and mostly water, and the rest of it

largely fat — the fatty sheathing that

makes thought run fast enough to be a thought.

It draws a fifth of all the body's fuel

(Book VIII has billed you for that appetite)

while sitting perfectly, entirely still.

Some eighty-six billion neurons live in there,

a census taken carefully, by hand,

by people dissolving brains to count the nuclei.

And each cell reaches out to thousands more,

so that the junctions run to hundreds of trillions —

a thousand times the stars our galaxy holds.

Say it that way. The old comparison

sold the brain short and called the shortfall wonder.
]
#stanza[
The geography, in brief: a folded surface,

crumpled to fit more sheet inside less skull,

laid over deeper and much older shapes.

The stem keeps house — the breath you are not taking

deliberately, the heartbeat, the swallow, the sleep.

Above it, the weather systems: fear and hunger,

the fast alarm that fires before you know.

And latest, thinnest, wrapped across the whole,

the rind: inheritance stacked up in layers,

each one still running, none of them retired.
]
#stanza[
That rind is where the naming happens. #emph[Cortex]

is simply Latin for the bark of a tree,

the rind, the husk, the outer peel of things —

the same word standing behind cork, most likely,

by way of Spanish; the cork oak wears its cortex

and we strip it and stopper wine with it.

The anatomists of the seventeen-hundreds

looked at that gray shell and saw bark, and said so.

Which means the seat of reason bears the name

of what a tree puts on to face the weather.

Everything you have ever thought took place

inside the rind. The mind lives in the bark.

So when we speak of branching, of the dense

arbor of dendrites (also a tree word) —

the forest is not decoration. It is licensed.
]
#stanza[
The map is real. Broca cut open a man

the ward had nicknamed Tan, for the one syllable

left to him, and found the lesion, and the left

frontal region has borne that surgeon's name since.

Real, but not the phrenologist's tidy plot

of bumps for Wit and Reverence and Greed:

no parcel does one job, and none alone.
]
#stanza[
And nothing here is fixed. The reading of this line

is laying down some minor, actual change —

your brain is being slightly rewritten now,

by this, which is the strangest of its habits:

the one known object in the universe

that builds a working model of the world

and finds, inside the model, its own weight.

Note the position we are speaking from.

This is the brain's report upon the brain,

the instrument and specimen the same.

Read the whole book with that discount applied.
]

#carmenhead([Capitulum 2], [Of the Neuron, and Its Signal], [scripsit Opus · heroic couplets])
#stanza[
Before the cell was found, the word was old:

the Greeks said #emph[neuron] for the sinew's hold,

the tendon, cord, and string — the drawn-tight thing;

and Homer's archers twisted, for a string,

the ox's #emph[neura]. So the mind's least part

is named for what once bent the hunter's art.

Dissectors kept the word for cord and nerve,

one name for every fiber's pull and curve,

till Waldeyer in ninety-one assigned

the term at last to units of the mind.
]
#stanza[
Then Golgi's silver, poured on brain like rain,

made scattered cells stand black against the stain —

a method that outran the man's belief:

he read a net, continuous, with no leaf

divided from its fellows. Cajal saw

discrete and separate cells, and drew the law

he could not photograph. In nineteen-six

they split one prize and would not split their fix:

each rose in Stockholm, lectured, and denied

the other's reading standing at his side.

The drawings won. In lecture halls they hang,

the hand's proof outliving the tongue's harangue.
]
#stanza[
And what runs down that cell is stranger still:

electric down the length, but at the sill

a gap — and there the current cannot pass;

the message must be poured across the glass.

The spike is all-or-nothing when it fires;

a neuron cannot shade what it desires,

casts one flat vote, no louder and no less,

and signals #emph[more] by voting in excess —

intensity is frequency alone,

a rate of yes, a drumming, not a tone.

The myelin sleeve lets impulse leap the node,

saltatory, and hurrying its load

to some four hundred kilometers an hour —

which sound outstrips. We never won on power

or pace: the brain's advantage is the wide

ten billion errands running side by side.
]
#stanza[
So every thought here crossed a broken line,

was chemical at each unjoined confine,

handed, not carried, over empty air.

The mind is relayed. Nothing is joined there —

only the old string's tension and release,

the plucked cord sounding, and the sound's increase.
]

#carmenhead([Capitulum 3], [Of Perception, a Construction and Not a Window], [scripsit Sonnet · a linked pair])
#stanza[
The eye reports in fragments, dim and torn:

a hole where no receptor meets the light,

a black-out every time the gaze is drawn

from mark to mark, a thousand times a night.

The center holds a small and burning spark;

beyond its ring the world goes thin and gray,

yet what is handed over shows no mark

of patchwork: whole, unbroken, on display.

Someone is filling what the socket lacks,

erasing every jump before it's known,

and painting color onto colored cracks.

And when the bill arrives, the seams are shown:

a shadowed square that matches one that's lit,

a dress the world could not agree was split.
]
#stanza[
The brain does not receive; it drafts ahead,

then checks the world just far enough to trust

one version over what the nerve has said —

controlled hallucination, if we must

put drama on the method: guess, compare,

revise, repeat, too fast for us to name.

The rubber hand, once stroked in time, will wear

the feel of flesh and flinch as if a flame

were brought too near its rubber. Thrown across

a wooden jaw, a voice will seem to start

from painted lips, the real mouth taken loss,

the eye and ear conspiring to depart.

Latin fused #emph[per] with #emph[capere]: to seize

entirely — no window; the hand's expertise.
]

#carmenhead([Capitulum 4], [Of Memory, and Its Quiet Revisions], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
We call it storehouse, wax, or tape, or file —

a room of shelves where fixed impressions wait,

untouched by dust, unbent by weather's trial,

retrieved intact each time we push the gate.

The word itself half-tells you it's a lie:

to #emph[remember] is Latin's #emph[re] plus #emph[mind] —

mindful #emph[again], a second act, not I

recovering what the first act left behind.

Mnemosyne bore the Muses, nine in throng,

so memory is mother to all art —

not ledger-keeper but the source of song,

which shapes and is not shackled to a part.

Each telling is a birth, not a return.

The tablet was a myth we had to learn.
]
#canto[II.]
#stanza[
Bartlett gave students ghosts — a native tale

of spirit-war, canoe, and cry of pain —

then watched each retelling bend and pale

toward what the English mind could hold again.

The strange grew tame; the gaps grew logical;

the story changed to fit the teller's frame.

And Loftus, decades on, made this her call:

she planted, in a quarter, one mall-shame —

a childhood lost among the aisles, at five —

that never happened, yet the subjects wept

and dressed it, detail-rich, as if alive,

sure of a rescue they had only kept

as story. Courtroom witness, sworn, precise,

convicts on confidence, not proof — and lies.
]
#canto[III.]
#stanza[
The flash-bulb goes off: #emph[Where were you the day—]

and thirty years the picture holds its shine,

though every fact inside has crept away —

the room, the caller, even whose voice was mine.

Confidence stays lit while content drifts,

because to summon is to touch and change:

each act of calling up revises, shifts

a few more grains, and hands back something strange

yet certified as #emph[mine] by feeling true.

The oftenest-told story wears the most —

the retelling is the only thing we do;

there is no vault, only the present ghost

of teller shaping teller, tale on tale.

The self's most practiced story is the tale.
]

#carmenhead([Capitulum 5], [Of Emotion, the Older Government], [scripsit Sonnet · a linked pair])
#stanza[
Fear is the oldest office of the state,

in service long before the cortex spoke;

disgust inspects the food upon the plate;

anger collects on debts the promise broke;

and grief keeps books on everyone that's dead,

a terrible accounting, tallied late,

still adding losses no one else has read,

compounding daily on the same estate.

Call it no lizard ghost in newer bone:

the low road through the almond-shaped relay

is real — a shortcut evolution's grown,

not proof we carry yesterday's array.

James wagered that the pounding pulse comes first:

we run, and only then we feel the worst.
]
#stanza[
The glass-floored ledge feels like a plunge to some,

and to the next, the same height feels like flight;

the cortex files the drop as terror's sum,

or tags the same fall thrilling, cool and light.

Appraisal is the lever, not the spark —

one word for shame in one tongue splits in two

elsewhere (Book Thirteen keeps the fuller mark);

feeling is dialect, and forms construe.

Unseat the passions, and let reason choose

alone — a despot, calculating, cold;

but strip the ministers, and watch it lose

all traction: card-game choices left untold.

#emph[E] plus #emph[movere]: what first moved the crowd

to riot, now moves us — motive, unbowed.
]

#carmenhead([Capitulum 6], [Of Learning, in Creatures and in Machines], [scripsit Opus · heroic couplets])
#stanza[
To learn is first to stop: the slug withdraws

its gill, then tires of alarm, and draws

no more at harmless touch. In Kandel's tank

the #emph[Aplysia] shrugged, and science drank

its clearest draught from that unlovely thing —

a mind of thousands, mapped, remembering.
]
#stanza[
Then Pavlov, whom the schoolroom gets half right:

the finding was not drool, nor bell, nor bite,

but that two things which merely co-occur

will fuse, so one alone can make them stir —

the dog had learned the world's arrangement, not

a trick of glands. The association's what he got.
]
#stanza[
Skinner came next, and did not ask the mind:

he watched the act, and let reward define

which act recurred. His pigeons, grain by grain,

were sculpted — every session shaved the plane

a little closer to the wanted shape.

Behavior, patiently, admits no escape.
]
#stanza[
But Tolman's rats had wandered mazes free

with no reward, and learned them silently;

then, paid at last, ran clean on the first day —

they'd built the map but had no cause to say.

So knowing may lie latent, unexpressed:

we learn by looking, not by acting best.
]
#stanza[
Beneath it all the synapse keeps the score.

Hebb's rule — that cells which fire together #emph[wire]

together — is the textbook's rhyming gloss,

not Hebb's own words, and something's lost across

that jingle; still it names the ledger true:

the crossing strengthens with the traffic through.
]
#stanza[
The machines borrowed this, and say so plain:

their networks are a metaphor's remains,

where gradient descent, ten million tries,

does Skinner's patient shaping without eyes.

(Book Twenty holds that argument; I nod

and pass, unwilling to usurp its rod.)
]
#stanza[
And #emph[docile] once meant #emph[apt to learn], from #emph[docere],

to teach — the root that gave us #emph[doctor] (there

a teacher first, physician late), and lent

its lesson-sense to #emph[doctrine] and #emph[document].

By seventeen-seventy-four the word had bent

to #emph[meek], #emph[compliant], #emph[easily] content —

the name for eager learners, slumped to name

the led. Take back the older sense. Reclaim

it here, mid-book: the reader, reading, is

the subject matter, proving what this is.
]

#carmenhead([Capitulum 7], [Of Language in the Child, Acquired and Not Taught], [scripsit Sonnet · a linked pair])
#stanza[
No school convenes where infant grammar's taught;

no primer sets the paradigm in stone;

yet every child, by ear alone, is caught

in rules that no grammarian has known.

The coo comes first, the whole world in the throat,

then babble narrows to the mother-tongue,

then one small syllable must serve by rote

for sentences too large to yet be sung.

Then "more milk," "go now" — telegraphic speech,

two words in place of all the mind has meant —

till, past two years, whole clauses fill the reach

of children who were never sat and sent

to any school. And when a child says "goed,"

that wrongness is a rule the child has sowed.
]
#stanza[
But there's a window, closing all in time;

the feral child, found late, though loved and fed,

may gather words and yet not learn to climb

to syntax — grief enough in what's been said.

A tongue picked up past childhood's narrow door

is labored into being, not just grown;

"too poor, this evidence, to teach us more

than habit" — "no, the pattern's fully shown

in noise alone, statistics does the rest" —

good scholars have not settled it today.

Once "grammar" meant dark Latin, occult-dressed,

the clerk's own art, till Scots wore it away

to "glamour" — that same spell cast on the eyes.

The child, by five, unlearned, had earned that prize.
]

#carmenhead([Capitulum 8], [Of Bias, and the Predictable Errors], [scripsit Opus · heroic couplets])
#stanza[
On English greens they rolled a weighted ball,

not true, but loaded — bowls that could not fall

along a straight line if you threw them so;

by fifteen-sixty #emph[bias] named the flaw

built purposely inside them. From the French

#emph[biais], a slant, oblique, an off-square wrench,

the word came over; and within ten years

it named the leaning mind, the slope one steers

without electing to. The metaphor

is not decoration — it is the whole law:

a bias is not error's random noise

but weighting, manufactured, that deploys

the same curve every time. And what curves true

to form is measurable. That much will do

to make a science of our going wrong.
]
#stanza[
The shortcuts are good bargains, and are strong:

fast, frugal, mostly right, and cheaply bought —

a mind that priced each judgment as it ought

would starve mid-deliberation. Still, the price

is failure with a grain, a form, a vice

repeated. Vividness will crowd the true:

we fear the shark and take the stairs on cue,

though stairs have killed the more. A number said

before you guess will drag the guess it fed,

though it be plainly random. What we seek

as evidence, we curate — and the meek

disconfirming fact is never sought at all.

A loss stings sharper than an equal haul

delights. And nearly all of us are sure

past what we ought: each schedule is premature,

this edition's own included, which was due

in spring. The planning fallacy came true

on time, at least. Two speeds — the quick, the slow,

the hunch and audit — is a cartoon, though

a useful one; the mind is not two men.
]
#stanza[
The remedies are dull, and work: ask when

this kind of thing has gone this way before —

the outside view, the base rate (that good reverend's floor,

whose fuller argument Book Two will keep);

convene a premortem: assume the heap

has failed, and say why. Write the reasons down.

The catalogue is not contempt. Set down

without a sneer, it is the manual

the mind shipped absent — practical, and full

of one plain use: you cannot roll it straight,

but knowing how it leans, you aim off-weight.
]

#carmenhead([Capitulum 9], [Of the Mind's Afflictions, from Possession to Diagnosis], [scripsit Opus · blank verse])
#stanza[
For most of the record, the afflicted mind

was read as trespass: something had come in.

A devil, or a sin the sufferer chose,

or, if the sufferer was a woman, a womb

that had gone traveling upward through the body.

Three explanations, all of them a verdict.
]
#stanza[
They built houses for it. Bethlem, which the city's

tongue wore down to Bedlam, took admissions

and, for a period, took visitors — the mad

displayed for a coin, an afternoon's diversion,

the ancestor of every later gawking.

Then Paris, and Pinel, and the struck chains

at Bicêtre — an emblem more than a minute,

the story tidied afterward, the credit

owed also to Pussin, who was there and worked there.

Keep the emblem. Mark it as an emblem.

Reform arrives as legend and then as practice.
]
#stanza[
Two words survive from the discarded medicine.

Melancholy is black bile, exactly:

#emph[melaina cholē], the fluid that the humoral

physicians thought pooled dark around the spleen

and pulled the temper down. The clinic closed.

Its whole staff stayed on, employed as adjectives:

choleric, phlegmatic, sanguine, and the black one —

a dead physiology still doing duty

as the only vocabulary feeling has.

No harm in that. A word may outlive its theory.
]
#stanza[
The second word did harm, and must be said so.

Hysteria is #emph[hystera], the womb.

The doctrine held the organ wandered, wanting,

and pressed against the lungs and heart and throat

and made the woman shake, or grieve, or speak

inconveniently. The anatomy was false.

The uterus does not migrate. The diagnosis

was handed almost only to women, and served,

across long centuries, to file complaint

as symptom, and the patient as her body.

Medicine has retired the term. This edition

retires it here, with the cause entered plainly:

a false etymology of the flesh

made into a true and durable cruelty of practice.
]
#stanza[
What the medical turn gave was real. A name

that could be shared between two doctors. Talk

made into treatment. Lithium, which steadies

the great oscillation and is watched by blood test.

The antipsychotics, which quiet the voices

and cost the body something for the quiet.

The antidepressants, which lift some, and not all,

and not immediately, and not forever.

That is the honest inventory: they work,

they work partly, they are the best we have.
]
#stanza[
The turn had its own trespass. Egas Moniz

took the Nobel Prize in nineteen forty-nine

for cutting the frontal lobes. Some forty thousand

Americans were quieted that way.

Keep that prize on the shelf, uncrated, lit:

the monument to what a confident age

will do to people it is sure it is helping.
]
#stanza[
Now: the categories are maps, not country.

The manual is an atlas, redrawn, argued,

revised by committee, useful and provisional —

a working chart of a coast still being surveyed.

And stigma is the last of the old possessions,

the devil's final tenancy, still paying rent.

Evict it with the sentence this whole chapter

was written to arrive at and to leave:

the afflicted mind is a mind, entirely.

The person, throughout, remains the person.
]

#carmenhead([Capitulum 10], [Of Animal Minds, and What May Be Within], [scripsit Sonnet · a linked pair])
#stanza[
Admit the evidence, and read it plain:

the corvid's forethought — Book Ten holds the thread —

the chimpanzee that knows itself again

behind the mirror-glass, not fooled, it's said,

by any stranger looking through the glass —

a mark some hold of some reflective mind.

The octopus, too, lets its council pass,

its arms in conference (Ten holds that kind).

The dog alone has learned to read the gray

uncertain weather of the human face.

And Alex asked, reported, in his day,

"what color am I?" — one bird's own strange case

of naming self. Let Morgan's honest blade

cut wild claims down, and spare the claims well-made.
]
#stanza[
What is it like to be the bat in flight,

to hunt the dark by echo, not by knife

of sight but sound? That kinship-question's right

at home here too: we map the felt-out life

of neurons, trace behavior's every part,

and yet the feeling underneath's the least

mapped thing of all, no matter how we chart —

the dark-from-inside of the tested beast.

So mercy leans toward caution, not toward pride

of certainty: the proof's own burden lands

on him who holds the knife, not on the tried

and voiceless. Not the cold machine, nor man's

own furred disguise. The hound was #emph[sagax] first —

keen-scented — long before the sage's thirst.
]

#carmenhead([Capitulum 11], [Of Consciousness, the Hard Problem Left Standing Open], [scripsit Opus · blank verse])
#stanza[
Draw the line cleanly first, then stand behind it.

On one side: which circuit does which labor,

how attention narrows and what it drops,

which states a person can report and when,

what anesthesia interrupts, and where.

Call these the easy problems. Easy means

only that we know the shape of the answer

and must now spend a century getting it.

Ordinary science. Difficult. Tractable.
]
#stanza[
On the other side, one question, differently made:

why any of that is accompanied at all.

Why there is something it is like to be

this process — Nagel's bat, whose sonar world

we can describe completely and not enter.

You may lay out the wiring in full, name

every transmitter, time every spike, and still

the taste of coffee this particular morning

is not deduced from the diagram. That interval

is the gap, and it has not been narrowed.
]
#stanza[
The positions, each one given its fair sentence.

That the problem dissolves, as vital force dissolved

once chemistry got specific, and we will wonder

what we thought was missing. That physics is

unfinished, and the missing law is missing.

That experience is basic, like charge or mass,

a term the universe was built with, not derived.

That we are primates with a particular skull

and this is simply past our instrument.

Each is respectable. I crown none of them.
]
#stanza[
What would count as progress is a theory

that tells us, in advance, which systems host

experience and which merely compute —

a measurement for other minds. The stakes

are not academic. They are the surgical table,

the drug that paralyzes and may not blank;

the patient unresponsive fourteen months

whose scan lights up when asked to picture tennis;

and the animals, whose case the last chapter took,

who cannot file the claim in our language.
]
#stanza[
The name itself has been keeping a record.

Conscious is Latin #emph[conscius]: #emph[con] and #emph[scire],

to know with, to know together. The kinship

of #emph[scire] to an older sense of cutting

belongs to Book III; here only the compound.

#emph[Conscius] meant one who shares the knowledge —

a witness, or a confidant, or an accomplice.

Conscience is the same word, barely altered:

the knowledge held with someone about you.

English kept the outward sense for generations —

a man was conscious to a plot, meaning in on it.

Only near sixteen-thirty did the word

fold inward: knowing within oneself, aware,

the witness now installed behind the eyes,

the second party absorbed into the first.

So consciousness is, by its own name, a joint

enterprise privatized — a knowing-with

that took the with inside and shut the door.
]
#stanza[
The book of mind ends where Book I and Book IV

ended, on an open and well-made question,

which is the only kind worth leaving open.

The difference is only this: the others

were asked about the world. This one is asked

from inside the questioner, and the questioner

is the instrument, and cannot step outside

to check the reading. Hold the old sense a moment.

For the length of this page you have known with me.

Whatever else the word has come to mean,

we were conscious in the original way:

two parties, one knowledge, held between them, here.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XIII]] #label("bk13")]
= Lingua
#text(style: "italic")[Language, writing, and the word-histories]

#text(size: 8.5pt, fill: faded)[⟨ Orig. I · IX · X ⟩ — the founder's own province, under new metaphysics]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The sign is arbitrary; the founder's premise is overturned in his own house. Yet etymology survives its demotion — no longer a key to essences, it becomes a key to history, with citations.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of What a Language Is, and What It Is Not
+ Of Sounds, and How the Mouth Makes Them
+ Of Grammar, the Native Engineering
+ Of Meaning — Said, Implied, and Taken
+ Of the World's Tongues, and Their Families
+ Of Sound Change, the True Engine of Etymology
+ Of Writing, the Second Invention
+ Of Literacy, and What It Rewires
+ Of Translation, the Necessary Treason
+ Of Dead and Dying Languages, and What Departs with Them
+ Annexus Alphabeticus — Word-Histories A to Z, Kept Alphabetical in Memory of the Old Book X
]

#carmenhead([Capitulum 1], [Of What a Language Is, and What It Is Not], [scripsit Opus · blank verse])
#stanza[
Begin with what no other signal does.

The bee returns and dances out the distance,

the vervet has one cry for snake, one hawk —

and every one of them means #emph[here] and #emph[now].

No bee has ever danced a flower it dreamed.

No monkey warns of leopards in the abstract,

or lies about a leopard for the pleasure

of watching the whole troop climb into the trees.

We do. Displacement is the name for it:

the power to speak the absent, the long dead,

the never-was. From this one property

descend two children, and the pair are twins —

the falsehood and the story. Both of them

require a listener who can hold in mind

a world not present to the eye. No creature

but ours has needed to invent that room.
]
#stanza[
And there is more. The sentences you read

were never said before, and cost me nothing —

this line included, made from finite parts

by rules that generate without a ceiling.

Productivity, they call it. Children get it

at three, from fragments, and are never taught.
]
#stanza[
Now for the hard one, and the edition's wound.

The link between a sound and what it means

is not resemblance, not an inner essence,

not the thing's nature calling out its name —

it is a settled habit, nothing more.

#emph[Dog], #emph[chien], #emph[perro], #emph[inu]: the animal

is unaffected. Saussure said it plainly,

and plainly it destroyed our founder's method.

Isidore believed that names contained

the natures of their things, that if you split

a word you'd find the world's own reasoning

folded inside it like a nut's white meat.

That premise died here. Names contain no natures.

The book that loves its etymologies

must say so in its overture, and does:

an etymology reveals a history,

never an essence — where a word has traveled,

not what its object secretly must be.

That is the standing correction of this edition,

made in the founder's province, to his face.
]
#stanza[
And what a language isn't. Not its writing —

speech came first by tens of thousands of years,

and the alphabet is a late device

(a later chapter handles it). Not grammar-book

correctness: no vernacular on earth

lacks grammar; each has a system stricter

than the school's. Not thought itself — the aphasic

reasons well, and the image in your head

outruns the sentence. Roughly seven thousand

tongues; not one of them primitive.
]
#stanza[
And #emph[tongue] is the word, exactly. #emph[Language] comes

through Old French #emph[langage] out of Latin #emph[lingua] —

the tongue, the muscle. English does it natively:

the English tongue, the mother tongue; and so

do countless others, naming what they speak

for the wet flesh that shapes it. Take the anchor.

The most abstract endowment of our kind

still wears, in nearly every mouth that has it,

the name of a small muscle, warm and working.
]

#carmenhead([Capitulum 2], [Of Sounds, and How the Mouth Makes Them], [scripsit Opus · heroic couplets])
#stanza[
Begin with breath. The lungs, a patient pair

of bellows, push their column of spare air

up through a gate of folds that shut and part

two hundred times a second — that's the start,

the buzz, the raw material, the drone

a body makes before it makes a tone.

Above that gate the throat and mouth compose

a pipe you tune by moving what it holds:

the jaw drops, and the cavity grows tall;

the tongue humps forward, and the vowels all

slide up the chart. No instrument we own

is played so fast. The tongue, the lips, are shown

by film to hit their marks in milliseconds,

a dozen gestures where a downbeat beckons —

the body's finest players, and they sit

inside your head, unpraised, and never quit.
]
#stanza[
Each language picks a palette from that field.

Rotokas gets by, as reports have held,

on roughly a dozen sounds; !Xóõ is said

to marshal past a hundred in its stead —

one instrument, two wildly different scores,

and neither one is poorer than the other's.

What a tongue ignores it cannot hear:

the English ear goes flat and blank and sheer

where Mandarin keeps meaning in the pitch,

and Japanese, the mirror of that ditch,

finds English r and l a single sound —

not deafness, but a palette drawn around

what mattered. Khoisan speakers file the click

among their consonants; it isn't a trick

or noise, but grammar, ordinary, plain,

a stop like any stop, and bears germane

distinctions. Tone makes music lexical.

And infants hear it all — the technical

descent from universal ear to one

particular is another chapter's run.
]
#stanza[
Which brings the warning word. The Greeks devised

for foreigners a name that satirized

their speech: #emph[barbaros] — bar-bar, the babble heard,

a stammer, noise, a man without a word —

an echo of not listening, which then set

like plaster into slur, and hardened yet

again to ethnography. Keep that near:

the oldest name for stranger names our ear.

The same equipment sits behind each face;

we simply learned to play a different place.
]

#carmenhead([Capitulum 3], [Of Grammar, the Native Engineering], [scripsit Sonnet · a linked pair])
#stanza[
No tongue was found still learning how to speak,

no tribe whose grammar limped, half-engineered —

the field has combed the mountain and the creek

and every native system, once cleared,

runs recursion's trick: a clause may hold

another clause, which holds one, nested deep,

matryoshka-wise, until the sense grows cold —

#emph[the rat the cat the dog chased bit] — we keep

losing the thread the syntax swears is there.

Agreement counts across a clause's span,

remembering the number, gender, tense

of words long spoken, bookkeeping the air.

A finite kit, and yet the plan

outputs what no closed set should dispense.
]
#stanza[
Some languages put #emph[verb] at sentence's end

(the plurality, if counted worldwide, votes

that way), and some, like English, choose to bend

toward Subject-Verb-Object; others float

word order free and pay the difference

in case, in markers stitched to every noun.

Mandarin travels light — no tense, no fence

of inflection — while Mohawk piles a town

of meaning into one hard-working word,

a sentence wearing polysynthetic dress.

And every speaker knows, though none was told,

#emph[big red ball] — not #emph[red big] — is preferred:

a rule obeyed, unstated, nonetheless.

No engineer signed this. The blueprints hold.
]

#carmenhead([Capitulum 4], [Of Meaning — Said, Implied, and Taken], [scripsit Sonnet · a linked pair])
#stanza[
Semantics builds from parts, a compound machine

of morpheme snapped to morpheme, sense to sense —

until the sentence spoken, crisp and clean,

means something else, and everyone knows whence:

#emph[Can you pass the salt?] — a question, strictly, asks

of capability, and true reply

is #emph[yes], no cellar moved. The joke unmasks

the gap where language runs on shared #emph[why].

#emph[Nice weather] isn't weather — it's a hand

extended, warmth in form and not in fact.

The letter of recommendation, kind

and brief, that praises #emph[punctual] — we understand

by conspicuous silence what's not backed:

the compliment that leaves the rest behind.
]
#stanza[
And irony — the saying of the opposite,

believed, received, the inside turned outside —

no engine built has fully managed it;

the ear that catches tone where words have lied

is doing something no machine has learned.

The insult and the endearment share one face,

#emph[you idiot] by tone alone is turned

to tenderness, or turned to its disgrace.

Ambiguity, we call it flaw, and yet

the pun lives there, the poem, the treaty's art —

the diplomat who needs two doors to leave.

Meaning's a three-party act, once set

in motion: said, implied, and — third part —

taken. The listener's the one who'll weave.
]

#carmenhead([Capitulum 5], [Of the World's Tongues, and Their Families], [scripsit Opus · heroic couplets])
#stanza[
In Calcutta, in the year of eighty-six,

a judge who read for pleasure caught the trick:

Sir William Jones, comparing what he knew

of Sanskrit, Greek, and Latin, saw them through

to one conclusion — that the three had sprung

from "some common source," a parent tongue

"which perhaps no longer exists." Compressed,

but honest to his sense: he had confessed

a family, and left the ghost unnamed.

The method that came after him was framed

like family law. Not likeness — likeness lies,

and chance will pair two words of equal size

across the world for nothing. What counts is

a rule that holds: the whole recurring class

of correspondences, the ruled-off column

where #emph[pater], #emph[father], #emph[fadar] stand in solemn

alignment, and the p and f repeat

in #emph[ped] and #emph[foot], in every word they meet.
]
#stanza[
From orphans, then, the parent is composed.

No Proto-Indo-European prose

survives; no speaker wrote a line of it.

We mark the asterisk and we admit

the form's inferred — and still their world shows through

the words they must have had, and therefore knew:

the wheel, the yoke, the herd,

the wool, the honeyed drink, the given word.
]
#stanza[
Give the other houses of the earth their due:

Sino-Tibetan, ancient, holding through

a continent's worth of speech; Niger-Congo,

vast past easy counting; and the long row

of Austronesian, whose one family sailed

from Madagascar out to where it failed

to find more ocean — Easter Island's shore,

one sea-road, one descent, and nothing more

between them but ten thousand miles of blue;

Afro-Asiatic, deep, and older too

than most of what we've named. Then the alone:

Basque, the famous orphan, holding down

a corner of the Pyrenees, unplaced,

no cousin found. The tongues about to be erased

have their own elegy — it adjoins here.

Meanwhile the word: a cognate is, made clear

by #emph[co-] and #emph[gnatus], born together — #emph[gn-]

the same as natal, nation, innate — then

the term is just the claim the science makes:

these two were born of one, whatever breaks

came after. Place your English on the tree —

a Germanic twig, grafted with Romance heavily,

kin to Hindi and to Persian by the tables

that link the father to the #emph[pater]'s syllables.
]

#carmenhead([Capitulum 6], [Of Sound Change, the True Engine of Etymology], [scripsit Opus · heroic couplets — the edition's engine room])
#stanza[
The great discovery was not that words

decay — that's obvious, and lies in herds

across the record. It was that they don't

decay word-wise at all. A sound change won't

select a favorite and let the others be;

it sweeps the tongue like weather, one decree,

and every word that holds the sound is caught.

Grimm laid the columns out, and there they taught

in step: the Latin #emph[pater], English father;

the Latin #emph[ped-], our foot; and #emph[cornu] — rather

than chance three separate times — our horn: one line,

one rule that runs the length of the design:

p turns to f, and d to t, and k

softens to h, and none of them delay.

Not drift. Not chance. A law that will not bend.

The Neogrammarians, seeing where it tends,

declared the boldest maxim yet proposed:

the sound laws suffer no exception — closed,

no pleading and no pardon. Later years

conceded much (analogy interferes,

and borrowing, and words worn smooth by use

erode their own way, breaking loose),

yet still the core stood fast against the test:

regularity is real, and it will rest.
]
#stanza[
Some changes come in chains, each vowel pressed

by the one behind it, all the rest

shoved up the mouth in turn. Our own's the Great

Vowel Shift, and it is why we spell one date

and say another: name once rhymed with calm,

and see was said as say — the spelling's palm-

print of a former sound, the orthography

a fossil bed. We write our history

and speak our present, and the mismatch there

is not our failure; it's a stratum, laid bare.
]
#stanza[
And so reconstruction. Where the record's mute

we reason backward down the laws, compute

the ancestor the daughters all require,

and mark it with an asterisk — the entire

integrity of the field lives in that star:

inferred, not attested; this is how far

the evidence extends, and not an inch

beyond it. Honesty's typographic flinch.
]
#stanza[
Here is the payoff, and the whole house rule:

BECAUSE the change is regular, a tool

exists for proof. A word's descent is shown,

not merely told, and every root we've grown

in this edition's soil was tried against

these laws — here guesswork ended and the sense

of science entered. Say it flat and true:

this is the engine. One word's left to do.

For etymology comes from #emph[etymon],

"the true sense," out of #emph[etymos], true — upon

its own authority this art is styled

"the account of the true." Isidore held

that truth to be the essence in the thing,

some core the name concealed. The reckoning

of sound change moved it: history is where

the etymon lives — the parent form, laid bare,

not any secret nature. So the word

kept its old name and changed the truth it heard,

which is this whole edition's tale, confessed:

the study of the true, its truth redressed.
]

#carmenhead([Capitulum 7], [Of Writing, the Second Invention], [scripsit Opus · heroic couplets])
#stanza[
Twice, maybe three times, never more than four,

in all the crowded millennia before,

did any people, working from the blank,

coax speech to lie down flat and hold its rank.

Sumer was first — you know the tokens' tale,

how reckoning hardened into shape and scale —

then China, cracking bone above the flame,

then Mexico, unhelped, and did the same.

The rest is borrowing. Each later hand

took fire from a neighbor's brighter brand;

what looks like genius flowering everywhere

is one lit match, and everyone's cupped air.
]
#stanza[
But drawing is not writing. Draw a bee:

you have a bee, and only that, and free

of any tongue — a Turk, a Pole, a Dane

will read your bee and never guess your name.

The turn came when some clerk, too rushed to draw,

sketched bee, then leaf, and made the sound of #emph[belief] —

no, better: made the noise the picture bore

and let the noise mean something else once more.

That is the rebus, and that hinge is all:

the mark stopped picturing the world at all

and pictured #emph[saying]. Now the sign could hold

a god, a maybe, or a man grown old,

a case, a tense, a curse, a proper noun —

whatever breath could carry, ink set down.
]
#stanza[
So ledgers loosened. Wedge-marks meant for grain

learned grief, and Gilgamesh went out again

to lose his friend forever, and to fail,

and Nile-cut hieroglyphs told the same tall tale

in birds and reeds. Then Phoenicians, at the docks,

pared all that glory down to twenty-odd knocks —

consonants only, vowels left to guess —

and sold it with the cedar. Greece said yes,

and being a language that would drown in such,

spent its spare signs on the vowels, and made them touch:

#emph[a], #emph[e], the open mouths at last made plain.

Rome bought the kit. It reaches you again.
]
#stanza[
And in the #emph[alphabet] the pictures hide:

#emph[aleph] was ox, #emph[beth] house — read side by side,

our word for letters means, and always meant,

plain #emph[ox-house], a farmstead's tenement.

Tip a capital A: the horns stand clear,

two thousand years of cattle lowing here.

And #emph[write] is Old English #emph[wrītan], meaning #emph[scratch] —

runes gouged in beech; while Latin, for its batch,

had #emph[scribere], to score, whence #emph[scribe] and #emph[script];

and #emph[style], from #emph[stilus], was the tool that dipped

and dug the wax. Your style, before it grew

to mean your soul, meant just the pen you drew.
]
#stanza[
Here memory first walked outside the skull:

the dead address the unborn, and are full

of voice, though voiceless. Isidore approved —

letters convey what's absent, and unmoved.

Yet Plato, present at the birth, filed first

complaint: king Thamus called the gift a curse,

that letters breed forgetting, and bestow

the look of wisdom on men who don't know.

The charge was wrong. The charge has never died.

We file it still, each time a new tide

of medium comes in — and, filing, write it down,

and hand the proof against us to the town.
]

#carmenhead([Capitulum 8], [Of Literacy, and What It Rewires], [scripsit Sonnet · a linked pair])
#stanza[
For most of its long walk across the Earth,

no one among the multitude could read —

mass letters are a recent, late-come birth,

two centuries, maybe three, to seed

a species long without them. Still, the brain

that reads today was never built to read;

it borrows cortex tuned to face, to plain

recognition of the world, repurposed at need.

Before, the unlettered kept a rarer art:

the singer's formula, the phrase that returns

to scaffold epics sung and never lost,

the memory palace, room by room, by heart —

skills the alphabet's arrival spurns

but shouldn't, keeping faith with what they cost.
]
#stanza[
Writing gave the list, the ledger's sum,

the law that speaks on though the lawgiver's gone,

the sentence built, revised before it's come

to voice — a draft the tongue could lean upon.

Augustine watched Ambrose read, and marveled: no

sound crossed his lips, the eyes alone made way —

a moment scholars still turn to and know

they cannot fully gloss, try as they may.

And #emph[read] itself, in English, keeps this thread:

from #emph[rædan], "to counsel," to advise,

to guess — the kin of "rede," the buried #emph[-red]

in #emph[hatred], #emph[kindred] — and its offspring, #emph[riddle],

that which wants unraveling by the eyes.

You've solved this. Software installed at the middle

of childhood, running still: the quietest prize.
]

#carmenhead([Capitulum 9], [Of Translation, the Necessary Treason], [scripsit Sonnet · a linked pair, the second carried across from the first])
#stanza[
Isidore, gathering Greek at second hand,

called learning down through Latin's borrowed sieve —

what Plato lost, what Origen could not stand

to keep, what only paraphrase could give.

The word itself confesses: to translate

is #emph[trans] and #emph[latus], carried, borne across,

the term the monks once used to relocate

a saint's own bones from reliquary to loss

and finding, shrine to shrine, the relic still

the relic, though the road has worn it thin.

The Seventy sat down by separate will

and rose, the legend swears, all matched within

a word. Jerome alone made Hebrew Latin, true,

and lied it into shape, the way all telling do.
]
#stanza[
#emph[Traduttore, traditore] — carry, and you betray;

the Greeks called this same theft #emph[metapherein],

to bear a meaning past its house of clay

into a stranger's, kin to alien kin.

A metaphor's a moving van in Athens still —

the sign says ΜΕΤΑΦΟΡΕΣ on the truck

that hauls your bed, your grief, your name, your will

across the town and prays it lands, not stuck

mid-bridge, mid-tongue, mid-anything. What's lost

is always something; what arrives is you,

translated, traitored, ferried at a cost

no first tongue asks its reader to pay through.

Isidore never touched the Greek he named.

Nor have you touched the hand that wrote this, framed
]
#stanza[
in someone else's carrying. Read on. Be maimed,

be given. This too was borne across, unblamed.
]

#carmenhead([Capitulum 10], [Of Dead and Dying Languages, and What Departs with Them], [scripsit Opus · blank verse])
#stanza[
The arithmetic first, and given as estimate.

Of roughly seven thousand living tongues

perhaps a half are reckoned in some danger,

and by the common figure one goes silent

every few weeks — a fortnight, or a month.

Distrust the decimal; the order holds.
]
#stanza[
They do not die in battle. That is the error.

They die in kitchens, and by tenderness:

a mother weighs the world her child will enter

and speaks to him in the language of the market,

meaning to spare him, and she is not wrong —

the market pays in one tongue, not the other.

So the chain of transmission comes unlinked,

not snapped, unlinked, one household at a time,

and no one in the house intends a death.
]
#stanza[
Then the last speakers, who deserve their names.

Marie Smith Jones, born nineteen eighteen, died

in Anchorage in two thousand eight, the last

who had been given Eyak as a child

the ordinary way, from parents, at the table.

Consider the particular loneliness:

to know a language perfectly, and have

no one alive who can correct your usage.

No argument about a word. No gossip.

The whole apparatus running with no load.
]
#stanza[
And what departs is never "only words."

The names of plants, and which root stops a fever;

the calendar that knows when the fish arrive;

the jokes, which are the hardest thing to carry;

the shape of kinship — who may marry whom,

what you call your mother's brother and what you owe him;

the counting systems, and the forms of blessing.

Each language is an archive of experiments

in being human, and the only copy.

Our bestiary grieved the vanished animals;

this is that elegy's sibling, and the same

arithmetic of the irreplaceable.
]
#stanza[
Tell the revivals honestly. Hebrew came

all the way back — liturgy to playground,

the one full resurrection on the record.

Welsh, Hawaiian, Māori: hauled from the edge

by schools, by nests of grandmothers and infants.

Wôpanâak was reclaimed out of the documents

the missionaries left, by Jessie Little Doe Baird,

who learned the linguistics to do it and then did it.

So: possible. And rare. And the condition

is always children — never the museum,

never the archive by itself. A tape

is not a speaker. A grammar is not a home.
]
#stanza[
Which brings the reckoning home to this edition,

a house built out of dead languages' bones —

its Latin quarried, its Greek exhumed and polished.

Consider #emph[vernacular]: from Latin #emph[verna],

a slave born in the master's house; #emph[vernaculus],

home-born, domestic, native. So the phrase

"the vernacular tongue," read at its root, means

the home-born-slave's speech — the language of the household

as against the official Latin of the empire.

The word arrived already carrying class,

already carrying captivity, and it fits

this chapter with a terrible precision:

the vernaculars die when the household yields them

to the market's master-tongue. The word remembers

whose speech was never official, even in Rome.

The words we play with here are survivors' words.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XIV]] #label("bk14")]
= Societas
#text(style: "italic")[Man in the plural]

#text(size: 8.5pt, fill: faded)[⟨ Orig. IX ⟩ — the peoples and their customs, studied instead of listed]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore cataloged the nations by their reputed characters. We now study the machinery instead: kinship, norms, cities — the inventions by which strangers manage to live as if they were kin.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Social Animal
+ Of Kinship, the First Institution
+ Of Band, Village, and City — the Scaling of Us
+ Of Norms, the Invisible Law
+ Of Hierarchy and Class
+ Of Gender, Variously Arranged
+ Of Ritual, and What It Accomplishes
+ Of Food as Culture, or the Cuisine of the Nations
+ Of Cities, the Second Habitat
+ Of Migration, the Constant
+ Of Identity — Ethnicity, Nation, and the Tribe Rebooted
+ Of the Mediated Society, Recently Begun and Poorly Understood
]

#carmenhead([Capitulum 1], [Of the Social Animal], [scripsit Opus · blank verse])
#stanza[
Begin with the audit. Take the species down

to what it cannot do without and count:

the infant, helpless past all reason, born

too soon — the wager Book Eleven told,

the skull that would not fit if it waited longer —

and so arrives unfinished, requiring hands

not its own for years. No other ape

is quite this poor on arrival. None is fed

so long by mouths that did not bear it. Note

the grandmother, who by every ledger of the gene

should have been done, and is not: she persists

past her own fertility to gather roots

for children of her children. Note the meat

divided at the fire — not charity,

but insurance, the first of all our policies:

today I have and you do not; tomorrow

the arithmetic reverses, and we both

survive the week that would have killed us singly.
]
#stanza[
Count further out. The circle holds at roughly

one hundred fifty — Dunbar's figure, drawn

from brains and bands and Christmas lists, disputed

by those who find the correlation thin

(a fair objection, honestly conceded) —

yet something near a village is the most

attention will maintain: the faces owed

a name, a history, a small account

of who they were the last time that we met.

Past that we deal in categories, not in people.
]
#stanza[
And when the circle empties? Then the body

keeps the score in mortality. The studies pool

three million lives and find the isolated

dying sooner — a hazard set beside

the smoker's, and not obviously smaller.

The lonely heart is not a metaphor.

It is an organ under load.
]
#stanza[
The strange part

is not the village. Ants have villages.

The strange part is the stranger — that we trade

and treat and travel among the never-met,

which takes machinery the cities chapter owns.
]
#stanza[
Consider then the word. #emph[Society]

comes down from Latin #emph[socius]: companion,

ally, partner — a soldier's word, the man

beside you in the line, whose shield laps yours;

and #emph[socius], by the standard account, is kin

to #emph[sequi], to follow — root of #emph[sequel], #emph[sect],

those who go along, who follow after,

who are found walking the same road as you.

#emph[Societas] meant partnership, the joint

venture, the shared risk and the shared return.

So society is not the state, nor yet

the crowd, nor anything so cold as either:

it is the company of those who go together,

the fellowship of the road, scaled up and up

until the road runs everywhere at once.
]
#stanza[
The old philosopher said we are the animal

whose nature is to live in company —

and meant it not as praise but as description,

the way one says a fish is made for water.

He was right in a stronger sense than he could prove.

The creature cannot merely fare worse alone.

It cannot #emph[become itself] alone: the tongue

requires another tongue to come in answer,

the conscience needs a face it has to meet,

and personhood — as the adjoining books

will argue at more length — is not a thing

one has. It is a thing one is #emph[granted],

and then, if one is lucky, learns to grant.
]

#carmenhead([Capitulum 2], [Of Kinship, the First Institution], [scripsit Opus · heroic couplets])
#stanza[
Before the court, the coin, the codified,

the household held the ledger and the guide.

Kinship was law: it named who owed you bread,

who nursed your fever, who would mourn you dead,

who might be married, who was barred as sin —

the first republic, walled about with skin.

No, closer: blood was statute, welfare, throne,

a government you never voted on.
]
#stanza[
The facts of birth are everywhere the same:

one body bears, another lends a name.

Yet how those facts are filed, no two agree —

some reckon down the father's pedigree,

some trace the mother's line and let it stand,

some count both sides and shake with either hand.

The biology sits still; the filing moves.

The archive, not the blood, is what it proves.
]
#stanza[
Then stranger yet: in tongues across the map

one word for mother folds the aunts in lap;

a cousin here is family, plain and mild,

and there, the licensed spouse, and there, the forbidden child.

The grid gets drawn, and where the lines are laid

determines who is kindred, who is trade.
]
#stanza[
And kinship, having sworn it came from birth,

kept doors for those it wanted, proving worth:

the godparent, the blood-oath sworn in scars,

adoption's paperwork beneath the stars —

each one a quiet, institutional confession

that choosing was inside it from inception.

The taboo stands in every place we've been;

its boundary wanders, but the fence is seen.
]
#stanza[
Now hear the fossil. Latin split the pair:

#emph[patruus], father's brother, rival heir —

#emph[avunculus], the mother's brother, styled

"the little grandfather," and to the child

in many lands the guardian and the rod,

the avunculate, half-tutor and half-god.

English collapsed the two, took uncle's name

from him, and kept for kindness his own claim:

so "avuncular" means genial, warm, benign —

a whole dead system humming in one line.
]
#stanza[
And every office in the books ahead —

the court, the market, all the ranks and dread —

is kinship's understudy, called to play

the night the family's reach gave out midway.
]

#carmenhead([Capitulum 3], [Of Band, Village, and City — the Scaling of Us], [scripsit Opus · heroic couplets])
#stanza[
Count first by dozens. Everyone is known;

each face a history, each name your own.

The band is kin or near it, one degree —

the quarrel travels fast, and so does she

who shames the hoarder. Equal, and exposed:

one drought, one fever, and the ledger's closed.
]
#stanza[
Count then by hundreds. Now the village stands,

where reputation is the reach of hands

and eyes — the face-to-face and outer bound

past which a stranger's character is found

by asking, not by knowing. Memory

is glory here, and here is tyranny:

the village will recall your father's debt

and every promise you've not honored yet.
]
#stanza[
Count last by strangers. Cities take the leap

to millions none can know and none can keep

in mind — and lean on machinery instead

(the cities' chapter counts that overhead).

"City air makes free," the medieval saying went,

and freedom was the anonymous element:

no one recalls your father, and no one cares —

the gift and the abandonment are theirs

together, one transaction, freely made:

you buy your liberty, and loneliness is paid.

The arc from many births to fewer runs

through later pages (XVIII owns those sums).
]
#stanza[
But here's the word that holds the smallest scale.

Companion: #emph[com] and #emph[panis]. Past the tale

of loyalty, the Latin says one thing —

with bread. Late #emph[companio], soldiering,

the messmate, he whose loaf was also yours.

And company keeps company with those stores:

the business company, the stage's crew,

the soldiers' hundred marching two by two —

all bread-fellowships by name, though none recall

the loaf that lent its substance to them all.

Those who eat together hold together: this

is the oldest social engine that there is,

the table's technology. And you, who read,

hold all three scales at once and all their need:

your household, and your street, and then the wide

uncounted network no one's eyes can ride.
]

#carmenhead([Capitulum 4], [Of Norms, the Invisible Law], [scripsit Sonnet · a pair with an etymological note])
#canto[I.]
#stanza[
No statute says the elevator's face

must point the door, yet every rider turns.

No court convenes to try the queue-jumped case;

the eyebrow rises, and the culprit burns.

The gift returned too soon reads as rebuff,

too late reads cold — there is a proper pace

no calendar records, and yet enough

of us know it to hold each other's place.

Some feel the watcher's eye and call it shame;

some feel the deed alone and call it guilt —

two inward magistrates without a name,

no bench, no robe, no courthouse ever built.

Cheaper than law, and stitched to every hour:

the code we never wrote still holds the power.
]
#canto[II.]
#stanza[
Asch drew three lines and asked which matched the first;

the answer plain, the room of stooges wrong —

and one by one the honest eye rehearsed

a lie to keep it walking with the throng.

Most bent at least once, doubting what they saw,

until one ally spoke the truth aloud —

one voice sufficed to break the room's false law;

dissent needs only one dissenting crowd.

Garfinkel sent his students out to haggle

for goods marked plain, to breach the tacit rule,

and watched the clerks' composure come to straggle —

the norm shows plainest through the flustered fool.

What scandalized the town a year ago

draws now a shrug — the tide of custom's flow.
]
#canto[Nota]
#stanza[
#emph[Consuetudo], Rome's old word for use,

for habit worn so long it turned to law,

split down two roads and came to mean profuse

and separate things once joined without a flaw:

through Old French #emph[coustume], early, came the sense

of what we do — our custom, plain and known;

through Italian #emph[costume], re-lent, dense

with painters' talk of dress in figures shown,

came what we wear. One root, two garments cut:

the norm is but a costume donned each day,

invisible on all whose seams are shut,

and glaring only where one goes astray.

So custom, costume — twinned since Latin's hour —

proclaim: what we habitually wear is power.
]

#carmenhead([Capitulum 5], [Of Hierarchy and Class], [scripsit Opus · heroic couplets])
#stanza[
Rank is a weed: it grows in every yard,

though what it's made of makes the growing hard

or easy. Some are ranked by birth alone,

ascribed, immovable, a rank of bone;

some by achievement, so the story goes,

a ladder anyone may climb who chose.

Caste sets in concrete what it will not budge;

class leaks — its rungs are real, but they will smudge.

And when the barnyard hens were watched and scored,

the pecking order literally was stored

in science, and the metaphor came home

to boardrooms who had not yet read the tome.
]
#stanza[
We tell the young that effort sets them free.

The numbers answer, drily: partially.

Between the promise and the measured fact

there sits a log-jam nobody has cracked —

the child's best predictor of his coming wage

remains his father's, page on stubborn page.
]
#stanza[
And rank is worn. It shows in how you stand,

in vowels, in the fork held in which hand,

in what you find delicious, what you find

absurd — a taste that feels like second mind

but was installed. Distinction, quietly taught,

is class made flesh and then forgotten thought.
]
#stanza[
Nor is the level ground a thing you're given.

Where foragers are equal, they have striven:

the hunter comes back heavy, and they mock

the meat, the aim, the man — a running block

against his swelling. Leveling is labor,

assertive, daily, aimed at every neighbor.

Equality's an act, and not a rest.
]
#stanza[
Now hear the word. #emph[Hieros] — sacred, blessed —

with #emph[archein], to rule: a sacred rule.

Not coined in barracks, court, or counting-school,

but Christian Greek, where Dionysius penned

the ranks of angels, triad without end

in threes of three — the seraphim above,

descending through the choirs of burning love

to plain unqualified angels at the base.

Then churches took the word to fix their place,

and then the world took everything. And thus

your org-chart is angelic, and the fuss

of reporting lines is choir-work, dimly heard:

that ranking once was holiness, says the word.

Enjoy the fall with me, and mark it well —

from seraphim to middle management's bell.

Hierarchy is cheap to raise and dear

to take apart; and every chapter here

that follows — law, and money, and the drum —

is partly just its account-book, and its sum.
]

#carmenhead([Capitulum 6], [Of Gender, Variously Arranged], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
Not every people drew the line at two.

The hijra walk the streets of old Lahore,

of Delhi, Dhaka — named in statute too:

in twenty-fourteen, India's own law

gave them a third box on the civil form.

Among the Lakota and kindred bands

a soul could hold both spirit-gifts, the norm

was room enough to let both genders stand

as one — Two-Spirit, the umbrella spun

in nineteen-ninety over elder ground.

In Samoa the fa'afafine take their place

uncontested; in Sulawesi's sun

the Bugis count not two forms but a round

five genders, ordinary, commonplace.
]
#canto[II.]
#stanza[
The word did grammar's work before it did

this present work — Latin #emph[genus], meaning kind,

sort, class, the box a noun or a nation is hid

inside: the moon, in French, is feminine,

in German masculine — no truth is meant,

only the filing habit of a tongue

(a fact the book on language will consent

to, arbitrary, tongue to tongue, young to young).

The same root walked to art and there was genre;

walked straight to life's own ranks and there was genus

(that census kept in Book the Tenth); and then

came home, through French, to persons — gendre, gender:

the sexed and social, seam laid bare between us.

The word for sorting, sorting us again.
]

#carmenhead([Capitulum 7], [Of Ritual, and What It Accomplishes], [scripsit Sonnet · a pair with an etymological note])
#canto[I.]
#stanza[
Van Gennep marked the three-part shape of change:

first sundering, then the suspended time,

then the return, remade and rearranged —

the gown, the shaved head, wedding bells that chime

for brides borne over sills. The ordinary

made strange to its own self, that strangeness felt

in bone before the mind can make it wary —

the old self shed the way a snake sheds pelt.

Turner named the middle hour liminal,

the initiates all equal in the dark,

rank hung up like a coat, criminal

and king alike bear the same threshold-mark.

Between the rooms of life a doorway stands

where all identities pass through bare hands.
]
#canto[II.]
#stanza[
Words alone leave room for the mind's dissent;

the body, moving with a hundred more

in time, believes what speech has never meant —

the anthem sung, the silence held, the floor

of separate doubts made one by unison.

So secular rites outlive the gods they served:

birthday flame, the handshake's small undone

formality, the tassel's turn deserved

by grades no priesthood ever blessed — the shape

persists though every doctrine walks away.

Yet ritual can fail: the mouthed words gape

on hollow ground, the form with nought to say.

A people's hours are governed less by speech

than by the calendar of thresholds each must reach.
]
#canto[Nota]
#stanza[
Liminal descends from #emph[limen] — Latin

for threshold, the low sill the door-post frames;

preliminary is the hall you wait in,

before-the-sill, as its own prefix claims;

eliminate was harsher: over the sill

and out — expulsion by the doorway, cast

from house to street, the sentence literal.

And some read sublime as up-to-the-lintel — asked

for proof, the etymologists demur:

conjecture, and confessed so. Let it stand

or fall; the sill itself does not defer —

beneath these words one doorframe, one worn strand:

the rites this chapter told are thresholds crossed,

and #emph[limen] is the wood their meaning glossed.
]

#carmenhead([Capitulum 8], [Of Food as Culture, or the Cuisine of the Nations], [scripsit Opus · heroic couplets])
#stanza[
No people eats it raw. Across the earth,

whatever else divides us from our birth,

the fire is turned on dinner. And the hearth

(Book VIII has the flame, and knows its worth)

was arguably the first thing we called home:

a place to sit, a reason not to roam.
]
#stanza[
Cooking is the universal. What we cook

is where the universal shuts the book

and culture opens: cuisine is the kitchen

of identity, the place we get bewitched in

by one dish. Somebody, somewhere, tastes

a broth and is a child again, and wastes

an hour weeping over stock and bone.

And spice-lines on the map are routes well known

to those who read them — pepper, clove, and cane

plot centuries of ship and rope and gain

(XVIII holds the exchange). What's refused

says even more: the animal not used,

the mixture that offends, the fast, the ban —

a boundary drawn in appetite, a plan

for who we are, enforced three times a day.

The meal rehearses the whole social play:

who sits, who serves, who's offered the first cut —

the contract, daily, signed with mouth and gut.

(The bread-word lives two chapters back; here I keep the plate.)
]
#stanza[
And dishes travel, wonderfully late:

the noodle roads run east and west and blur

all claims of origin to noisy stir;

the tomato reached Italian soil so late

its marriage there is younger than the state

of half of Europe — 1492

has its own chapter for that gaudy crew.
]
#stanza[
Now taste the word. Cuisine and kitchen: one.

Both from #emph[coquina] — #emph[coquere], to cook —

in Latin. France refined the thing to cuisine;

Old English took it early, kept it lean

as #emph[cycene], kitchen. Same verb, split in two,

one for the labor, one for what we do

to make the labor art. And in the same

root hides #emph[praecox] — precocious — early flame,

"cooked beforehand," fruit that ripened fast.

The gifted child is pre-cooked, and at last

the insult finds its twin, the same verdict, unbaked:

we call the unripe thinker's notion half-baked.
]
#stanza[
So tell me what you eat, and then with whom,

and hand me neither survey nor costume —

the sociology is mostly done.

The kitchen and the prodigy are one.
]

#carmenhead([Capitulum 9], [Of Cities, the Second Habitat], [scripsit Sonnet · a sequence of four])
#canto[I.]
#stanza[
Uruk raised walls before it raised a name —

mud brick on brick, a reef against the plain,

a hive that no bee planned and no ant framed,

yet swarmed and thickened like a coral vein.

We are the polyp species: we secrete

our shelter from our own accreted want,

then move back in and call the made thing sweet,

forgetting hands once shaped what now seems gaunt

and given, like a hill or riverbed.

The village knows your father's father's name;

the city's genius is the stranger fed,

housed, traded with, and trusted just the same —

cooperation stretched past kin and clan:

strangers, met once, still building out the plan.
]
#canto[II.]
#stanza[
And "city" governs still what "city" bore:

from #emph[civis], one who dwells inside the wall,

comes #emph[civic], #emph[civil], #emph[citizen] — and more,

comes #emph[civilization] entire, the call

of urban life mistaken for the whole

of being human. Greek names it the same:

from #emph[polis] comes #emph[police], who keep the roll

of order, and #emph[policy], and the game

called #emph[politics] — all, simply, city-craft.

Even #emph[urbane], that word for polished ways,

is #emph[urbs] alone — town manners, no more graft

than that. While out past walls, in the old days,

the #emph[pagan] kept his #emph[pagus], unconverted,

the #emph[heathen] his own heath — both faiths, deserted.
]
#canto[III.]
#stanza[
Proximity is a compounding thing:

ideas touch ideas the way skin touches skin,

and fevers spread on the same reckoning —

the market and the plague both entering

through the same gate, the crowd the density

that midwifes both the cure and the disease.

No village burns a library to the ground

by accident of numbers; none can seize

an epidemic either, at that scale.

Both edges of the coin are cut from crowd.

And somewhere near two thousand eight, the tale

turned final: half of us, then more, allowed

the built reef final claim — no longer land

but city, first, was where most feet would stand.
]
#canto[IV.]
#stanza[
So "society" required a science late,

only once #emph[polis]-dwellers, packed and pressed,

outnumbered every scattered kind of state

and strangers, not kinsmen, became the test

of what we are when no one shares our blood

but shares our street, our water, and our air.

Isidore walled his cities out of mud

and word-play; here's one truth that's really there:

we are the only animal that builds

its own environment, then calls it fate,

then studies it like weather, since it yields

no elder pattern, only what we make.

The coral does not know itself as reef.

We do, and keep on building past belief.
]

#carmenhead([Capitulum 10], [Of Migration, the Constant], [scripsit Opus · blank verse])
#stanza[
Do not begin by asking why they move.

Begin by asking why you thought they stopped.

The resting state of this animal is motion.

We came out of Africa in waves — not once,

a single exodus with a single date,

but pulse on pulse across a hundred thousand years,

the coastlines walked at the pace of a slow life,

the straits crossed when the sea was low enough,

and then the thing that has no precedent:

Sahul, reached by water sixty-odd

millennia ago — some sixty miles

of open sea, no sight of the far shore,

attempted anyway. The first blue-water

crossing in the record of any species.

Somebody pushed off from a beach toward nothing

and was right. The Americas were entered.

The Pacific was navigated, island

by island, by the sea-road that the language

book has told — and told better there than here.
]
#stanza[
So: every people is a migrant people

if you go back far enough, and far enough

is never very far. The #emph[indigenous]

and the #emph[newcomer] differ in the date

of their arrival, not in kind of claim

upon the earth — which is not to dissolve

the difference. Centuries are real. A century

of tending is a debt the land remembers.

It is only to say the difference is a #emph[when],

and every when has an older when behind it.
]
#stanza[
Now say the modern part without the fog.

They move for work — the harvest, the scaffold, the ward,

the wage that is contemptible here and transforms

a household there. They move because a war

arrived at the address where they were standing.

They move because the rain did not. And back

along the wire go the remittances,

that quiet river larger than most aid,

a nation's plumbing running through a phone.

The diaspora lives the doubled life: two homes,

and neither of them whole — the one they left

kept perfect in the amber of the leaving,

the one they hold still asking for their papers.
]
#stanza[
The walls go up against all this. They are recent,

those lines. The passport is younger than the railroad.

The border is a modern building set

across a road that has been walked forever,

and the traffic finds the gap, or dies, or waits —

which the chapter on the state takes up in turn.
]
#stanza[
Which brings the word. To #emph[travel] is to #emph[travail],

and #emph[travail] is #emph[tripalium] — three stakes,

a frame of three joined poles, an instrument

of torture, or of holding beasts to be shod.

From that: to torment. From that: to labor hard.

From that, because the roads were what they were,

the going anywhere at all was suffering,

and the journey took the torturer's name and kept it,

wearing it smooth over six hundred years

until it meant a hobby, and a brochure.
]
#stanza[
Hold both senses in the hand at once.

The word means gap year and it means the crossing.

It means the airport lounge and the sealed truck.

One word, two fates, and only the etymology

still honest about which one came first.
]
#stanza[
Reader: you descend, without exception,

from people who left. Every ancestor

you have was once the stranger stepping off

into a country that already had a name

in someone else's mouth. There is no branch

of your descent that stayed. There is no one

whose people have always been here. Here is where

the walking stopped for a while. It has not stopped.
]

#carmenhead([Capitulum 11], [Of Identity — Ethnicity, Nation, and the Tribe Rebooted], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
The border draws the group as much as blood:

a boundary kept, Barth showed, makes the kind

more than the kind makes it — the flag, the food,

the cut of dress, the vowel left behind

or carried (chapters near this one will trace

the cloth, the tongue, the dish, each on its own) —

all mutable, all chosen, none the less

a truth a person lives and dies upon.

Constructed is a word too often heard

as counterfeit; it is not. What we build

we still can lean our whole weight on. The word

for boundary is not the word for filled

with nothing. Every fence some people raised

still holds the field its builders never surveyed.
]
#canto[II.]
#stanza[
The nation is the tribe, rebuilt to scale

for strangers who will never share a fire —

synchronized instead by print, by mail,

by clock (the mediated chapter, nearer

that machinery, will take the thread up whole).

Its flags are old cloth cut to a new creed;

its census, museum, map — the modern soul's

apparatus, built to prove and to precede

the thing it claims to only document.

Latin #emph[natio]: born of #emph[nasci], bear —

a birth-word first, a breed, a bloodline meant

for cattle, then for kin (the fuller heir

of that root keeps its house in Book Thirteen).

The state's own myth of common blood is seen,

plain in the name it wears: a word for birth

now dressed the modern tribe in mother's cloth —

and every telling of a people's worth

picks which true story: kinship, border, both.

The teller chooses which the truth will be.

That choice, not blood, is the whole history.
]

#carmenhead([Capitulum 12], [Of the Mediated Society, Recently Begun and Poorly Understood], [scripsit Opus · blank verse])
#stanza[
The title is a confession. Take it as one.
]
#stanza[
Set out the sequence, since the sequence is

the only part we're sure of. First the press,

which made a public where there had been only

a parish and a rumor — the argument

belonging to the book on letters, not to this.

Then, for one strange century, the broadcast:

a single voice arriving in ten million

kitchens at the same hour of the evening,

the fireside talk, the anchor saying #emph[goodnight]

to a country that had watched the same three channels

and could therefore argue from a shared account

of what had happened. We mistook that for the norm.

It was a hardware accident. It lasted

about as long as a long human life.
]
#stanza[
Then the network, and the gates came off.

Everyone a broadcaster; the scarce thing

no longer transmission but attention.

And with it came the bond that has no name

in any older language: the parasocial —

the closeness felt toward someone never met,

who does not know you and by the design

of the machinery cannot. The feeling is not false.

That is the difficulty. It is real regard,

real grief when they go quiet, real instruction

taken from a face that is not answering.

A friendship with the architecture of a mirror.
]
#stanza[
Now say carefully what is actually new,

because the temptation is to say #emph[everything].

Scale is new: the audience of a bored

adolescent may exceed a nation's press.

Speed is new: the rumor now outruns

the correction permanently, not just usually.

The archive is new — the medium that forgets

nothing, in which a sentence said at nineteen

waits, fully preserved, for its retrieval at forty.

And this, perhaps the newest: the speech is #emph[steered],

the metrics running backward into the mouth,

the speaker learning from the counter what to be.
]
#stanza[
And say what is not new, in fairness. Panic

about the medium is itself a genre

with a long distinguished line, whose standing exhibit

is the philosopher's complaint that writing

would ruin memory and give the appearance

of wisdom without the substance — the older book

on letters handles him; the point is only

that every technology of the word

has been received as the death of something true,

and something true did die each time, and also

the accusers were wrong about the size of it.
]
#stanza[
Here the honest close, which is not a close.

The word we use for all of it is farming.

To #emph[broadcast] was to sow by hand: to walk

a plowed field scattering seed in a wide arc,

the way that is not the drill's neat measured rows —

a word two hundred years in the soil before

the wireless ever borrowed it. Which makes

the sower every broadcaster, the audience

a field, and hides a parable inside the name

that is exact past comfort: some on stone,

some among thorns, some on the good ground,

and the one who casts does not decide which lands.

The medium's own name conceded from the start

that yield was never guaranteed, and never

the scatterer's alone to claim.
]
#stanza[
This chapter

is the youngest in the book and will decay

the fastest. Someone reading it in fifty years

will know which of these sentences was foolish,

and I do not, and there is no procedure

by which I could. The mediated society

has not finished happening. It is a thing

still deciding what it has done to itself,

and the honest posture of a book like this

is not the prophecy but the plain admission:

we are inside the experiment, holding

the clipboard, and we are also on the table.

This edition declines to pretend otherwise,

and asks the future reader for the courtesy

it cannot return — to judge us by our uncertainty

rather than by our confidence, of which

we had, in these years, catastrophically enough.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XV]] #label("bk15")]
= De Sacris
#text(style: "italic")[The religions of the world]

#text(size: 8.5pt, fill: faded)[⟨ Orig. VII · VIII ⟩ — the biggest demotion: God, moved from above man to after society]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[In the old order these books stood above man. Here they stand among his institutions — the one relocation the compiler of 636 would have died rather than make, and the honest summary of the centuries between.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Religious Impulse, Considered as Human
+ Of Ancestors, Spirits, and the First Sacred
+ Of the Traditions of India
+ Of the Buddha's Way
+ Of Israel, and Its Covenant
+ Of Christianity — the Compiler's Own House, Viewed Now from the Street
+ Of Islam, Which Arose within the Compiler's Own Lifetime
+ Of the Ways of East Asia
+ Of New Religions, Continually Founded
+ Of Unbelief, and the Secular Settlement
+ Of the Sacred and the Sword
+ Of What Remains Sacred in a Disenchanted Age
]

#carmenhead([Capitulum 1], [Of the Religious Impulse, Considered as Human], [scripsit Opus · blank verse])
#stanza[
Begin with dirt. Before the word for god

was cut in any stone, before the priest,

someone laid flowers on a body — so

the pollen in the cave at Shanidar

was read, though others say a burrowing rat

carried those blossoms in, and the argument

has not been settled and we let it stand.

Set that aside. The ochre stays. The beads

stay in the grave, the tools laid by the hand

that will not lift them. Nothing that we know

of any people anywhere has lacked

some practice of the sacred — not one tribe,

not one long-buried village, not one street.
]
#stanza[
Why, then. The answers come in ordered ranks

and each shall have its seat and none the throne.

The first says: explanation. Thunder wants

a face, and we, who cannot bear a world

of causes without agents, gave it one.

The second says: the terror. We alone

carry the knowledge of our own last hour

and cannot carry it, and so we build

a room the hour cannot enter. Third:

the binding. Ritual makes a we of strangers,

and tribes that pray together hold the line.

Fourth: accident — the mind that leaps at rustles,

that reads a face into the moving grass,

was cheap to keep and costly to do without,

and gods are what that hair-trigger detects

when nothing's there. And fifth, the oldest answer,

which is the answer of those who kneel: that something

is genuinely there, and the impulse is

a faculty and not a fault, an ear

and not an echo. Here the book describes

and does not rule. We have no instrument

that weighs the fifth against the other four.
]
#stanza[
Consider what came of it, either way:

the requiem, the almshouse, the long vigil

beside the dying stranger, the whole architecture

of consolation raised against the dark;

and — one clause, held for a later chapter's blade —

the pyre, the pogrom, the sanctified knife.
]
#stanza[
This book comes after the book of human society,

and that arrangement is our own, a modern

judgment we own and do not hide. It says:

these are our institutions. But arrangement

decides no more than shelving ever does.

Whether the sacred was assembled here by hands

or found here, standing, is a door we leave

deliberately ajar for the whole book.
]
#stanza[
And for a cornerstone the word itself.

#emph[Religio]: Cicero heard #emph[relegere],

to go back over, re-read, take up again

with care — the scrupulous rehearsing of

what must be done exactly. Lactantius,

Christian, heard #emph[religare] — to bind fast —

the cable between the creature and the God.

Augustine weighed the two and kept them both.

The lexicons today decline to choose.

So the very word for what this book is of

comes to us carrying an unfinished quarrel

about what it names: attention, or a rope.

An edition made of honest disputed roots

could ask no better stone to start upon.
]

#carmenhead([Capitulum 2], [Of Ancestors, Spirits, and the First Sacred], [scripsit Opus · heroic couplets])
#stanza[
Before the creed, before the carven name,

before the councils argued over flame,

there was a household, and a household's dead,

and someone setting out a plate of bread.

This is the oldest layer we can reach:

not doctrine yet, and hardly even speech —

a gesture toward the ones who used to sit

where now the empty chair acknowledges it.
]
#stanza[
In Beijing halls the wooden tablets stand,

each name a resident, each shelf a land;

at Qingming, families come with brush and broom

and sweep the graves as one might sweep a room,

because a grave is lodging, and the host

deserves a tended threshold, not a ghost.

In Mexico the ofrenda climbs in tiers —

marigold, sugar skull, the favored beers,

the photograph, the food they liked in life —

a father visiting, a visiting wife.

In Accra, Athens, Kyoto, Galway: wine

poured to the ground, the household's oldest sign

that those below the floor are of the floor,

still counted, still consulted, still next door.

Not superstition. Household management —

the dead retained on permanent retainer, sent

no farther than the garden, and addressed

in the plain voice one uses with a guest.
]
#stanza[
And past the door, the world itself was kin:

the spring had someone living in it; in

the grove, a presence; at the sill, a small

attentive god who watched who entered the hall.

The hearth had hers. The offering was not bribe

but courtesy — the etiquette a tribe

extends to neighbors of another kind,

who can be reasoned with, and are inclined

to reasonable dealing, if addressed.

The world was negotiable. That was the test.
]
#stanza[
And some went farther. Communities would name

the ones who traveled — drum and dark and flame —

and came back speaking. Say it as they say:

the specialist who walks the other way

and brings a message home. Not fraud, not fit;

a role, with training, and a craft to it.
]
#stanza[
Call these not drafts of faiths that came to be

but finished ways of dwelling — and then see

how everything that followed took them in:

the saint's well was the spirit's well. The thin

partition between eras is a seam

where syncretism is the rule, not dream.
]
#stanza[
Here #emph[sacer] earns its double-bladed place:

it meant #emph[consecrated] — and it meant #emph[disgrace],

the outlaw, #emph[homo sacer], past recall,

whom any hand might kill, and none at all

might offer to the gods. One word, two ways

of standing outside ordinary days:

raised up, or cast below — but always fenced.

The oldest theology is that condensed.

And Cook, in Tonga, seventeen seventy-seven,

wrote down #emph[taboo] — not from some private heaven

but #emph[tapu], #emph[set apart, not to be touched]

(the pretty gloss of "mark" plus "especially" much

too neat; the true root's Proto-Polynesian, plain).

Two oceans, and one structure to explain:

the holy and forbidden, hedged the same.
]
#stanza[
It never left. It only changed its name.

The glass raised to the absent at the feast,

the roadside flowers where the traffic ceased,

the plate set out, the grave gone bare and clean —

local, familial, daily, and still here between.
]

#carmenhead([Capitulum 3], [Of the Traditions of India], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
Before the reed took wax, before the pen,

the Brahmins carried heaven in the ear —

each syllable of Veda counted, when

one breath could break three thousand faithful year.

No script, no page, and yet the sound stayed whole:

recited forward, backward, interleaved,

a memory apprenticed as a soul,

so nothing that was chanted was believed

lost. Here the words that will not cross to us

entire: dharma, neither law nor fate

but both and more — the order, the discuss-

ion never settled, held in patient weight;

and karma, act that ripens into act;

and samsara's wheel; and moksha, freed, unracked.
]
#canto[II.]
#stanza[
One banner covers thousands of the way —

no single altar rules what Hindu means;

the Jain who sweeps the ground on which they lay

their sandaled foot, lest breath of bug be lost between

one stride and one, ahimsa carried far

past caution into rigor made a rite;

the Sikh whose langar-kitchen holds no bar

of caste or purse — all fed, in equal light.

And under all: the yoke. For #emph[yuj] once meant

to join a beast to plow, to bind, to pair —

the same root, walking west, that Europe bent

to #emph[yoke]; the same that rides through #emph[join] and #emph[iungere]'s stair.

So when you bow to breath on rented floor,

the ox still pulls behind that oldest door.
]

#carmenhead([Capitulum 4], [Of the Buddha's Way], [scripsit Sonnet · a linked pair with coda])
#canto[I.]
#stanza[
They kept him walled from every wilting thing —

no wrinkled face, no wound, no funeral cart —

until four sights broke past the gardening:

an old man, then a sick one, then the part

where death rode by, then last, a beggar's peace

who owned no wall at all. He left that night,

starved to the bone to make the wanting cease,

then ate, and found the middle path was right.

Under the tree the truths arrived entire:

that all things ache, that craving lights the ache,

that craving spent, the aching can retire,

and eightfold is the road the walkers take —

no changeless self to carry through the years,

just kindness, moving where the self appears.
]
#canto[II.]
#stanza[
He crossed no border with a sword unsheathed.

The monks went first, the merchants close behind,

and Ashoka, who had conquered and had grieved

his conquering, raised pillars of the mind

in stone, not armies. Elders kept one shore;

the greater vessel built a further creed —

the bodhisattva waiting at the door

of paradise to ferry those in need.

And always underneath: the sitting still,

the breath watched plain (the eastern chapter's bow

to zen is owed here first). One final will

is handed down as though the master's now:

#emph[work out, with diligence, your own release.]

Awake — the word means wake — is named for peace.
]
#stanza[
His name, in full, was Budh-become: to wake.

And nirvana names no void, no ash, no dust —

#emph[nir] and #emph[vā], to blow out, for the sake

of flame undone: the candle, not combust

the hand that holds it. Craving is the fire;

the going-out is all the word requires.
]

#carmenhead([Capitulum 5], [Of Israel, and Its Covenant], [scripsit Opus · blank verse])
#stanza[
Begin not with a mountain but a promise.

The older gods were gods of places: this

spring, that grove, the thunder over this ridge

and no ridge past it. Carry such a god

across a border and you leave him standing

at the boundary stone, bewildered, out of jurisdiction.

The innovation Israel states is small

to say and enormous to inhabit: one God,

not fixed to soil but bound to a people,

and bound by something stranger than a place —

a covenant, which is a god's own word

given, and therefore holding him as well.

Such a god travels. Such a god has history

instead of only weather, and acts inside it.
]
#stanza[
The center, then, was portable by design,

though it took two catastrophes to prove it.

Twice the temple fell; twice the altar's smoke

went out; and twice the people did not.

What rose instead was stranger than a building:

the scholar in the priest's place, the small room

of argument where the sanctuary stood,

a scroll where there had been a holy of holies.

A people of the book — the phrase is worn

but it began as an emergency measure

that outlasted every emergency.
]
#stanza[
And memory was made an institution.

The calendar became the archive. Spring

brings the table, the child's rehearsed question —

why is this night different — and the answer

told in the first person, always: not

they were slaves, but we were slaves in Egypt,

as if the teller's own feet felt the sea floor.

That grammar is the whole pedagogy.
]
#stanza[
The seventh day is Israel's gift outward.

#emph[Shabbat]: to cease, to desist, to stop —

the verb is plain, and the plain verb is the point.

Not rest as recovery for further work,

but cessation held as holy in itself.

The world took the week and kept it. Even

the university, that most secular abbey,

still grants its scholars the seventh year off

and calls it, without blushing, a sabbatical —

the holy stopping, drawing salary.
]
#stanza[
And #emph[yobel], which is the ram's horn: the trumpet

sounded in the fiftieth year, when debts

dissolved and sold land came home to its family

and those in bondage walked. From that curved horn

the jubilee; from the jubilee, the jubilant —

so every crowd that shouts in gladness carries,

unknowing, the blown horn of the year of release.
]
#stanza[
Then centuries of dispersal, and endurance

that asked no witnesses and got few kind ones:

expulsions, quarters, edicts, and the Shoah,

in which a third of the world's Jews were murdered.

The record is kept elsewhere in this edition.

Here it is named, and named without adornment.
]
#stanza[
And still the argument. The tradition's own

peculiar form is that it canonized

its disagreements — kept the losing view

on the page beside the winning one, in full,

because a settled question is a dead one.

A religion that preserved its minority reports.

The compiler, who loved order, finds this hard,

and finds it, on the second reading, admirable.
]
#stanza[
Close on the plain fact, which is the testimony:

they are still here, still arguing, still asking

the child at the table the same question.

Continuance is the argument's last word,

and it is not a word. It is a people.
]

#carmenhead([Capitulum 6], [Of Christianity — the Compiler's Own House, Viewed Now from the Street], [scripsit Opus · blank verse])
#stanza[
This is the house our compiler kept. He served it,

wore its office, died a bishop of it,

and the book you hold is his book written over.

So we describe it as one would describe

the house an ancestor swept and loved and left:

from the street, hat in hand, and accurately.
]
#stanza[
The story as its people tell it. A teacher

out of Galilee, an artisan's son,

who taught in stories, ate with the disreputable,

and said the kingdom was arriving now;

who came to Jerusalem at Passover

and died on a Roman cross, the standard death

the empire gave to rebels and to slaves.

Then the proclamation — and it must be named

as what it is, a proclamation, the claim

on which the whole house stands or does not stand:

that he was raised, that the tomb did not hold,

that death had been walked through and out the other side.

On that the rest is built. Then Paul, who never

met him on the road except as light,

writing to little congregations strung

along the sea-roads — Corinth, Philippi —

letters about collections and bad manners

that turned out to be scripture.
]
#stanza[
Then the strange

sociology. A persecuted minority,

heavy with slaves and women and the poor,

who buried anyone, who fed the plague-sick

when the physicians ran, who would not burn

the pinch of incense to the emperor's genius —

and in three centuries the empire's faith,

which is either a miracle or a fact

about what solidarity does in a hard world,

and this book does not say which.
]
#stanza[
Its divisions, plainly:

East and West drew apart over a clause,

a claim of primacy, and the long silt

of language and of grievance, until 1054

formalized what had already happened; and Europe

broke again at Wittenberg, and the fragments

multiplied, and each fragment holds

that it kept faith. We do not hold the scales.
]
#stanza[
What it carried: the hospital, which it invented

as a standing institution; the university,

grown out of cathedral schools; the manuscript

copied through the centuries when nobody else

was copying; the Mass in Palestrina's setting,

the blue of Chartres. And — one clause, owed and paid —

the Inquisition, the burnings, the blessed conquest,

the sword the adjoining chapter has to hold.
]
#stanza[
Isidore stood here. Bishop of this city,

who wrote down everything he could to keep it

from the coming dark, and got much of it wrong,

and saved it anyway. This edition walks

the street outside his house and lifts its hat.
]
#stanza[
Two words for it, and they teach different things.

Our church, and kirk, and Kirche, all descend

from #emph[kyriakon dōma] — the Lord's house:

the building's word, the roof, the walls, the stone.

But the word the New Testament chose for itself

is #emph[ekklēsia] — #emph[ek] and #emph[kalein], called out —

which in plain civic Greek before it meant

a thing of God at all meant the assembly:

the citizens of Athens summoned by the herald

to argue and to vote. Democracy's own organ.

So église, iglesia, chiesa all come down

from a word for a town meeting, not a nave.

The faith's own name for itself was people-summoned.

And there the oldest tension in the house

stands preserved in the dictionary: the hall,

or the meeting? Both words are still in use.
]
#stanza[
From the street at evening one can see the windows lit

and hear the singing and not know the rooms.

That is the honest distance. We keep it, and pass on.
]

#carmenhead([Capitulum 7], [Of Islam, Which Arose within the Compiler's Own Lifetime], [scripsit Opus · blank verse])
#stanza[
The compiler must record a strange coincidence

of dates, and record it against himself.

In the year six hundred twenty-two, a man

and his companions left one city for another —

the hijra, from which the reckoning begins.

Isidore was then a bishop, mid-career,

already gathering the world in lists.

He died in six hundred thirty-six. The tradition

arose while he compiled. His own great book

holds one of Latin Christendom's first notices

of the Saracens — a few dim lines, a rumor

of movement at the far edge of the map,

set down by a man who could not know

he was writing the opening sentence about

a quarter of the human race to come.

The edition returns now to the horizon

its founder glimpsed, and returns with better light:

fourteen centuries of the tradition's own testimony,

which is the only testimony worth compiling.
]
#stanza[
As it understands itself, then. A man in a cave

above Mecca, unlettered by the account,

told to recite — and the recitation is

the book's own name: al-Qur'an, the Recitation,

a thing first heard and spoken, only after

written down. It is still learned by the ear.
]
#stanza[
The center is oneness, tawhid: God is one,

not one among, not one atop, but one

without associate or likeness or division —

and from that single insistence everything

in the practice follows. The five pillars name

the shape a life takes when it agrees:

the witness spoken; the five daily prayers

that cut the day at its joints; the alms

not given as generosity but owed;

the fast of Ramadan, dawn to dusk, a month;

and once, if one is able, the pilgrimage.

A practiced life, and practicable — that is

the design. Nothing here requires a genius.
]
#stanza[
Then Baghdad, and the House of Wisdom, and

the centuries this edition owes its bill to.

Book I carries al-Khwarizmi's name in two

disguises: his book gave us algebra,

his own name, worn down through Latin, gave us algorithm.

Half the stars overhead answer to Arabic —

Aldebaran, Altair, Rigel, Betelgeuse.

Aristotle came back to Europe through this door,

carried in Arabic, translated twice.

The edition pays here what it owes.
]
#stanza[
And breadth: the largest population is Indonesian.

Senegal, Nigeria, Bengal, Turkey, Bosnia —

the tradition is not one region wearing one face.

The great division came at the succession,

Sunni and Shia, and the compiler notes it

and does not presume to judge it. Not his office.
]
#stanza[
Close where the etymology stands. The name

comes from s-l-m — submission, wholeness, peace;

a Muslim is the participle: one who submits,

one who is made whole. And the same three letters,

turned in the neighbor tongue, give shalom

as they give salaam. The greeting is one word

in two languages, born together, as Book XIII

taught the reader to hear such things.

The bridge is in the grammar. It stands

whether or not a soul walks over it.

The compiler leaves it standing, and stops here.
]

#carmenhead([Capitulum 8], [Of the Ways of East Asia], [scripsit Sonnet · a linked pair])
#canto[I.]
#stanza[
Confucius spoke of ritual, and of rank

rightly observed, of names called by their true

condition, and of parents owed a bank

of steady reverence a whole life through.

Of spirits, says the Analects, he stayed

silent — this world's relations were his art:

the child, the elder, the office rightly weighed,

the bond that holds a civilization's heart.

And then the Way that cannot be pronounced,

the Daodejing's first line a modest door:

wu-wei, the deed no striving has announced,

the valley's low strength, water's patient floor.

No either/or was asked of anyone —

one man might keep both teachers, and be one.
]
#canto[II.]
#stanza[
Then dhyana crossed the mountains as a guest,

met Dao halfway, and something new was born:

call it chán first, the meditator's rest

distilled from crossing, sharpened, freshly worn.

It walked to Japan next and changed its name

once more — now zen — the selfsame word, worn smooth

at every border, still meditation's flame

under three tongues, one root beneath the groove.

There it found kami waiting in the trees,

in stones, in thresholds marked by torii's red

(a door to #emph[limen], borrowed if you please);

found tea poured slow as any prayer is said.

No creed was filed above the rest as true —

just harmony, and what that word can do.
]

#carmenhead([Capitulum 9], [Of New Religions, Continually Founded], [scripsit Opus · heroic couplets])
#stanza[
Religions are not found. They're founded — now,

this year, in rented halls, and here is how:

a person speaks, a handful stay to hear,

the neighbors are embarrassed, and a year

goes by, and then a hundred, and the strange

becomes the ordinary through no change

of doctrine — only time, which is the whole

mechanic of respectability's slow roll.
]
#stanza[
Count the nineteenth century's American yield:

the Latter-day Saints, who crossed a bitter field;

the Adventists, who read the sky for dates;

the Witnesses, who knock and take the gates.

And past that shore: Baha'u'llah, in Persia, tried

and exiled; Nakayama Miki, at her side

of the world, in Japan — Tenrikyo begun

by a farm woman in eighteen thirty-eight. Each one

was once a rumor. So the twentieth made

its own additions, and this century's trade

continues briskly. Nothing here is new

except the founders — and the neighbors' view.
]
#stanza[
Now hold the mirror steady and be fair:

the ancient faiths were each of them once there.

Christianity: a Jewish movement, small,

its founder recently alive, and all

its neighbors skeptical. And Islam — note —

was new within the lifetime Isidore wrote.

The Buddha was a novelty to those

whose Vedic order he had come to oppose.

The word for what they were, in every case,

is what we hesitate to say to a face.
]
#stanza[
The sociology is plain, and kind

enough if stated straight: the founder's mind

is charisma, which cannot be bequeathed,

so at the death an office is unsheathed —

Weber's arc: the fire becomes a hearth,

the prophet's shout becomes a printed path.

The tension with the world outside relents

by generations; sect to church; the fence

comes down; the persecuted, given time,

grow ordinary, then sublime, then prime.
]
#stanza[
Here take the doublet, and take all of it.

One verb: #emph[colere] — to till, to tend, to sit

and dwell, to worship. From it #emph[cultus] grew:

the tending of the fields, of persons too,

and of the gods — that care the Romans reckoned

agriculture's sibling, not its second.

And #emph[cultura] — Cicero's #emph[cultura animī],

the tilling of the soul. And #emph[colony]:

the settlers' dwelling-tending of a place.

So #emph[cult] and #emph[culture] wear a single face.

The difference between them isn't Rome's;

it's tone — it's who is speaking, and whose homes.

One group's #emph[culture] is another's #emph[cult], and Latin,

holding both, declines to say which that's in.
]
#stanza[
Your grandchildren may shelve some founding of this age

with the world religions, on the settled page.

Which one? The chapter will not guess. It ends

by noting only that the guessing bends.
]

#carmenhead([Capitulum 10], [Of Unbelief, and the Secular Settlement], [scripsit Opus · heroic couplets])
#stanza[
Give unbelief the dignity of length.

It is not modern, and it is not strength

borrowed from science lately; it is old

as any hymn, and has been just as bold.

In India the Carvaka held the line

that matter was the whole of the design —

no soul that traveled, and no debt to pay;

a school, with students, arguing its way.

And Lucretius, this edition's own

great master-voice, whose hexameters have grown

into our bones: he wrote to set men free

from terror of the gods — that was the plea,

not mockery. The Epicurean ground

was a walled garden where the fear was drowned

in friendship, bread, and physics. Note the aim:

relief from dread. The pious wanted the same.
]
#stanza[
Then Enlightenment, with its long knives out

for miracle and throne; and then the doubt

that came by scholarship — the higher criticism,

which read the sacred text with the same prism

it read the rest, and found a seam, a hand,

an editor. And Darwin, understand,

was felt as an earthquake not for apes alone

but for design — the argument from bone

and eye and wing that had for centuries stood

as reason's own supply of proof of good.
]
#stanza[
The settlement that follows isn't creed.

It is a treaty, drafted out of need

by exhausted people, after the wars had shown

what neighbors do when neighbors rule alone

(the sword's chapter has that count in full).

The state stands neutral, and the rule

is neutral both ways: for the faiths, and for none.

Not verdict. Peace. The argument's not won —

it's set aside, deliberately, so that

the shops can open and the streets stay flat.
]
#stanza[
And #emph[secular] says this in its own root:

#emph[saeculum], an age — the span the fruit

of one long life could fill; a century, a breath;

Rome's secular games came once per lifetime, before death

could see them twice. So #emph[secular clergy] meant

the ones who lived in the world's time, and spent

their days outside the cloister's endless hour.

Then secularism, stripped of scorn and power,

is #emph[this-age-ism]: govern the shared #emph[now],

and leave the disputed forever. That's the vow.
]
#stanza[
Count honestly: the unaffiliated climb;

belief persists, and vastly, at the same time.

Both facts. No scoreboard. And the doubters range —

the hard atheist, certain; the agnostic, strange-

ly modest; the indifferent, who never asks;

the spiritual-not-religious, at their tasks.

A spectrum, not a camp. And #emph[agnostic] came

with a birth certificate and a name:

Huxley, in eighteen sixty-nine, who sat

in the Metaphysical Society, and that

room wore its labels — Catholic, Positivist —

while he, unlabeled, minted one: the gist

from #emph[a-] plus #emph[gnosis] — not-to-know — worn plain

as an identity, a modest name.

This edition, kin to open questions, knows

a fellow coinage when the minting shows.

And here the settlement's own wager goes:

that neighbors, split forever on last things,

can hold the peace — which is what this book brings,

page after page, describing all the same:

belief and unbelief, and neither shamed.
]

#carmenhead([Capitulum 11], [Of the Sacred and the Sword], [scripsit Opus · blank verse])
#stanza[
The compiler would prefer to skip this chapter

and has no honest grounds. Set down the record.
]
#stanza[
The crusades: Jerusalem taken in ten ninety-nine,

the streets described by the victors themselves

in terms they thought were praise. The conquests

that moved a faith by cavalry as well as argument,

in more than one direction, in more than one century.

The Reformation's hundred years, in which

Christians reduced the German lands by a third

over the question of how God is present in bread.

Expulsions and inquisitions; the pogrom;

the temple broken by the neighboring devout;

the missionary arriving with the garrison.

No tradition in this book is missing from the list.

The compiler has checked. He wanted one to be.
]
#stanza[
Now the complication, which is not an excuse.

The largest slaughters of the century just past

were carried out by movements that had no god

and often boasted of it — the camps, the famines

engineered by ministries, the tally in the tens

of millions, all of it secular arithmetic.

That record lives elsewhere in this edition.

It is set beside this one

not to acquit religion but to correct

a lazy sentence: religion is not the sole

author of atrocity, and is not innocent of it.

Both halves of that must be carried at once

or neither half is being carried.
]
#stanza[
The mechanism is worth naming, since it explains

the double column. The sacred is an intensifier.

What is held holy is worth dying for —

and the same sentence, one word turned, becomes

worth killing for. The consecration that steadies

a man to keep his testimony under torture

is the identical consecration that steadies

the hand at the massacre. One fuel, two engines.
]
#stanza[
Against which, with equal weight, the refusers.

The Quakers, who would not take up arms, would not

swear oaths, would not remove their hats to power,

and were jailed for all three with some regularity.

Gandhi with the Gita, reading a battlefield poem

as a manual for not striking. King, who took

his cadence and his courage from the prophets —

let justice roll down — and went to Birmingham jail

carrying Amos and no weapon at all.

The sword-refusers drew from the same wells.

This must be said as loudly as the rest.

The holy that arms the murderer also arms

the one who stands in front of him unarmed.
]
#stanza[
The word itself delivers the verdict. #emph[Martys]

is a courtroom term: the witness, the man

who stands and says what he saw and will not

be moved off it. The early church applied it

to those whose deaths were testimony, and the word

narrowed, over centuries, from witnessing to dying.

But the root holds. The first martyr held a testimony,

not a weapon. He was the one who would not

kill for the truth — only refuse to deny it.

Every later use of the word as a killer's title

inverts its grammar completely, and the grammar

does not forgive. The witness does not strike.
]
#stanza[
The compiler will not pretend the sum comes out.

The sacred is a magnifier with no sign

attached: it enlarges what is brought to it.

The honest finding is that both columns are long,

and that the chapter declines to close the ledger.
]

#carmenhead([Capitulum 12], [Of What Remains Sacred in a Disenchanted Age], [scripsit Opus · blank verse])
#stanza[
Weber said the world had been made plain:

that the spirits had retired from the wood,

that anything could in principle be known

by calculation, and so nothing needed

the wonder-worker any more. The wells

are chlorinated now, the harvest hedged,

the thunder is a difference of charge,

and all the explanations live in-house —

in the books this book has stacked beneath this one.

He was substantially right, and that is not

the end of it, and here is what remains.
]
#stanza[
A bus goes off a bridge. By nightfall there are

candles at the guardrail. Nobody

convened this. There is no rubric and no clergy

and yet the flowers come, the laminated photograph,

the small toy tied with wire to the fence,

and everyone approaches at the same pace

and knows to lower the voice. Or: someone says

we'll observe a moment's silence — and a stadium

of eighty thousand people, no two of them

agreeing about God, performs a liturgy

flawlessly, untaught, that has no text.
]
#stanza[
The pilgrim roads were not closed; they were re-routed.

They run to the stadium, to the small house where

a singer lived, to the trailhead at four a.m.

for the summit, to the starting corral where

forty thousand undertake a distance

that has no use, in order to be changed by it,

and cry at the finish. Ordeal, threshold, return.

And the old books, evicted from authority,

are read aloud at weddings and at gravesides

by people who believe nothing of them —

because when the worst has happened, ordinary

language will not carry it, and those cadences will.
]
#stanza[
The awe is not administered away.

The eclipse crowds gather on the interstate shoulder

and make a sound nobody plans to make.

The astronauts come back changed by a window —

Book Five holds that.
]
#stanza[
Two readings, and we keep them

both open, as we have all the way through:

either the sacred was always ours, a thing

our species does, and it wells up wherever

we gather closely enough to need it — or

the sacred was always standing there, and merely

finds new doors when we have bricked the old ones.

This book ends without choosing. That refusal

has been its signature and is its last word.
]
#stanza[
The joke is in the language, as usual.

Profane is #emph[pro] and #emph[fanum]: before the temple,

the ground outside the door. Not the shrine's enemy —

its forecourt. Merely where you are when you're not in.

And from the same #emph[fanum], #emph[fanaticus]:

of the temple, god-inspired, and in Rome

said of the priests of Bellona who cut themselves

in the god's fury. English clipped it short

in the American newspapers of the eighties —

eighteen-eighties — to fan. So every fan

in every stadium on every Sunday

is, by strict derivation, a temple-devotee,

and the crowd in team colors chanting in one voice

is doing fanum-behavior in the open air.

The disenchanted age's plainest word

for ordinary enthusiasm confesses

that the temples never emptied. They moved house.
]
#stanza[
Reader: you are standing in some doorway now,

as an earlier chapter's word had it — #emph[limen], threshold,

neither in nor out. So were we all,

writing this. Go through, or don't. The door is old,

and it was cut by hands, and it still opens.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XVI]] #label("bk16")]
= Leges et Civitas
#text(style: "italic")[Law, the state, and war]

#text(size: 8.5pt, fill: faded)[⟨ Orig. V ⟩ — the laws, continued; the chronicle spun off to Book XVIII]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore, drawing on Rome, knew that law is custom hardened and written down. What he lacked was the sequel: rights asserted against the sovereign, and the long experiment of the ruled choosing the rulers.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Custom Hardening into Law
+ Of the Great Codes, Hammurabi to Justinian
+ Of Constitutions, the Laws about Laws
+ Of Democracy, and Its Rivals
+ Of Rights, Asserted and Extended
+ Of Courts, Procedure, and Proof
+ Of Crime and Punishment
+ Of the State, and Its Monopoly on Force
+ Of the Law between Nations, Such as It Is
+ Of War — Its Rules, and Their Breaking
+ Of Empire, and Its Undoing
+ Of the Administrative State, Where Most Law Now Lives
]

#carmenhead([Capitulum 1], [Of Custom Hardening into Law], [scripsit Opus · heroic couplets])
#stanza[
Before the statute, and before the scribe,

a path is worn by one repeating tribe:

the elders judge, the neighbors nod assent,

and no one asks what any of it meant.

Do it twice, it is a thing you do;

do it thrice, and it is owed to you;

do it long enough, and men will swear

the practice was already in the air.

So custom stiffens. Habit, given time,

puts on a robe and answers to a crime.
]
#stanza[
Our very word admits the masonry:

not Latin #emph[ius], but Norse — the Danes at sea

who beached at Lindisfarne and stayed to trade

left England #emph[lag], "a thing that has been laid,"

a layer, a deposit, something set

down flat where all the later strata get

their level from. The irony is rich:

the raiders gave the raided their word for order,

and plunder handed down the term for which

a man is hauled before a magistrate.

And what is laid stays laid. A #emph[statute] stands

by that same logic — #emph[statuere], to make

a thing stand up on end and stay awake

past the mood that made it. Law is stone

in grammar first, and afterward in bone.
]
#stanza[
In Babylon it was stone in fact. The king

set Hammurabi's pillar in a ring

of public square, eight feet of polished black,

so no lord could plead ignorance, or hack

a fresh rule from the air to suit his need

mid-quarrel. There it stood, for men to read

or have read to them — which is much the same

if what is fixed is fixed, and has a name.

And there the famous savagery appears:

an eye, an eye. But listen with new ears —

the clause is not a spur, it is a rein.

Not "take an eye," but "take an eye — and then

you stop." No clan wiped out for one man's hand,

no forty deaths per corpse. The talion planned

a ceiling over vengeance, and the sky

it lowered was already very high.
]
#stanza[
Rome learned the trick from pressure. Plebs withdrew,

declined to fight, and asked the patricians who

alone knew what the sacred customs said

to write them out. Twelve Tables. Publicly displayed.

Secret law is not a law but a leash;

the moment it is posted, it is speech.

A #emph[code] was then a tree — the #emph[codex] came

from #emph[caudex], trunk: the block men split and planed

to waxy tablets, bound. Each shelf of law

is lumber, still, however far from raw.
]
#stanza[
The English took the slower, stranger road:

no founding trunk, no comprehensive code,

but judges reading judges, each decree

a ring laid down inside the same slow tree.

Custom found, they said, and never made —

though finding, done with force, is how things get made.

Their #emph[court] recalls no majesty at all:

Latin #emph[cohors], a yard behind a wall,

the farmyard pen — same root that gives #emph[cohort] —

so justice bears the name of its own yard, its fort.

And when the twelve file back, what they have weighed

comes out as #emph[verdict], #emph[vere dictum] — said

as truth. The phrase dares call a finding true

because we need an end more than a clue.
]
#stanza[
So two great houses stand, and neither yields:

the written code you point to, black on white,

and Britain's constitution, which is fields

of habit with no fence, and works all right

until the day some minister prefers

it didn't. Then the unwritten law defers

to whoever moves first. That is the cost;

the benefit is nothing is quite lost

to a bad clause a dead assembly passed.

Both are memory, hardened, meant to last:

as coin remembers debts a town forgot,

law is the record of what we decided, not

what we decide — the past with power to bind,

a riverbed cut by the passing mind.
]

#carmenhead([Capitulum 2], [Of the Great Codes, Hammurabi to Justinian], [scripsit Opus · heroic couplets])
#stanza[
Before the parchment, black basalt: a king

set justice up in stone where crowds could bring

their grievance to a pillar and compare

the wrong they suffered to the price named there —

that stele is another chapter's ground,

as are the Tables where twelve boards were found;

I take my station later, at the hour

Rome's law outlived Rome's arms, if not Rome's power.

A thousand years of rulings, writ, and gloss

lay heaped like salvage after total loss:

each jurist quoting jurists now unread,

the living quarrel argued by the dead.

Justinian set Tribonian to the pile

with orders to compress, exclude, compile,

and out of that vast midden, sorted, dressed,

came fifty books — the Digest, the Pandects.

Greek named it well: #emph[pan] with #emph[dechesthai] — "all

receiving," the book meant to take in all,

the vessel with no bottom and no brim

that swallows every case brought up to him.

It sank. It slept in libraries, and then

Bologna woke it, and the copying men

made classrooms of a corpse: the buried code

resurrected as a curriculum, a road

that ran from lecture hall to every court

in Europe — law revived as taught report.
]
#stanza[
And Bonaparte, who counted forty fields

of victory, said none of them still yields

what one clear Code will yield; the battles fade,

erased at Waterloo — the Code he made

outlives the guns. It does. His marshals lie

in marble; his articles apply.

So codes promise the citizen his due

in his own tongue, one law the whole way through,

knowable, uniform, and plainly filed;

and common lawyers answer, unbeguiled,

that life is odd, and cases teach what rules

forget, and certainty makes narrow schools.

Both partisans are right, which is the cost.

Each code's a wager that no case is lost

to novelty — that time can be filed in advance.

Each amendment is the future's answer: chance.

And every all-receiving book, once bound,

is missing something. Ask us. We have found.
]

#carmenhead([Capitulum 3], [Of Constitutions, the Laws about Laws], [scripsit Opus · heroic couplets])
#stanza[
All other statutes tell you what to do;

this one tells statutes what they must go through —

the second-order invention, law of law:

who rules, how power passes, and the flaw

no majority may vote itself around.

That last clause is the whole of holy ground.

One nation wrote it out and hung it high,

a parchment with a public, watchful eye;

another kept no document at all

and calls its habits binding — precedent, recall,

the settled way of doing, unrecorded —

the text-and-custom tension, elsewhere sorted,

returning at this altitude to ask

which holds the state more firmly to its task.
]
#stanza[
The word itself is humble past belief:

from #emph[chartula], "little paper," a leaf

of #emph[charta], which the Greeks called #emph[khartēs] — sheet

of papyrus, pressed and dried and cut to fit.

So Magna Carta, read as it is spelled,

is "the Big Little-Paper" that has held

eight centuries of liberty in trust —

named by a stationer, as all things must

be named by someone selling what they're on.

The card in the wallet, the chart the ship sails on,

the cartographer's whole trade, the charter's grant:

one papyrus leaf. The grandest promise can't

escape its stock. The state's most solemn word

is, by its own name, paperwork — absurd

and honest both.
]
#stanza[
Now for the harder part:

how does a dead hand hold a beating heart?

The founders bind the unborn, who did not vote;

Jefferson said the earth belongs, of note,

to the living, and no generation ought

to chain the next to what its fathers thought.

The other side says wisdom keeps, and fear

of mobs is why the hard clause sits up here.

Then Marshall, needing nothing but a pen,

declared his court could void the acts of men

elected — found the power in the text

by reading it, and no one countermanned it next.

A quiet coup, and permanent, and cited.

Meanwhile the tyrant's constitution, lighted

with rights of speech and travel, guarantees

whatever cannot happen. Text like these

is stationery, nothing more, unless

insisted on. That's all a state's redress:

a promise that it makes about itself,

kept by the people who won't shelve the shelf.
]

#carmenhead([Capitulum 4], [Of Democracy, and Its Rivals], [scripsit Sonnet · a linked pair])
#stanza[
They drew for office out of bronze and clay

and thousands climbed the Pnyx to face the sun;

a name pulled blind could rule the city's day

till one raised hand declared the vote was done.

Each spring the potsherds bore one hated name,

and when the count ran deep past six in ten,

that man walked ten years' exile, still the same —

no charge was laid, no judge, no voice, no pen.

Yet slaves who dug the silver, wove the thread,

and metics who had built the harbor wall,

and wives confined to loom and marriage-bed

stood clear outside the roll that governed all.

Long ages named it mob-rule, nothing more,

till representation opened the door.
]
#stanza[
The throne moves fast — one voice, one swift command,

but crowns pass down through blood, and blood runs thin;

the few who rule by wealth or by the land

claim wisdom's crown, though graft creeps always in.

The strongman too can move without debate,

but only flattered news is ever fed;

no messenger dares bring him word too late —

"the worst — except for all the rest," he said.

First property, then blood, then sex, walled in

the vote — each wall stood guarded, thought to last;

eighteen-seventy broke the wall of skin,

and nineteen-twenty broke the wall of caste.

A "ballot" is, by name, a small dropped ball —

the only rule with tools to mend its fall.
]

#carmenhead([Capitulum 5], [Of Rights, Asserted and Extended], [scripsit Sonnet · a linked pair])
#stanza[
A right's the trump no headcount can outbid:

the shield each person carries from the crowd;

whatever thousand hands have said or did,

some claims stand fixed, unbought, however loud.

Yet "right" descends from #emph[rectus], meaning straight,

from #emph[regere], "to rule, to keep in line" —

the verb that names the king who rules the state,

and regular, region — kindred, aligned.

At Runnymede the barons sealed a deed

for peers alone — a wedge, and nothing more;

by seventy-six, "all men" became the creed,

and eighty-nine in France threw wide the door.

In forty-eight, when little peace remained,

Roosevelt drove it through; eight states abstained.
]
#stanza[
Each age calls madness what the next calls plain:

that chains should break, that women's hands should vote,

that owning men for profit was a stain —

once fringe opinion, now the sober note.

"Eight hours for work, eight rest, eight of our own"

was mocked as dreaming — till the law agreed;

and civil rights, in sixty-four, was shown;

then ramps and curb-cuts met a later need.

But rights collide — one's voice, another's peace;

one's fenced-in field, another's hungry claim;

the balancing of claims will never cease,

and paper rights are not the rights we gain.

A right's a promise wrung, not freely given —

renewed each time the weak have stood and striven.
]

#carmenhead([Capitulum 6], [Of Courts, Procedure, and Proof], [scripsit Opus · heroic couplets])
#stanza[
Before the court there was the feud, and blood

answered for blood until whole houses stood

in mourning at each other. Then the state

said: bring it here; we'll do the work of hate

more slowly. First with iron, glowing red,

carried nine paces — if the burn was spread

and festering by the third day, God had ruled;

and with the oath-helpers, the neighbors schooled

to swear beside a man, not to a fact

but to the man himself, his standing intact.

Then duel, then ordeal, both retired at last

for something stranger: twelve who knew the past,

the neighborhood witnesses, brought in to say

what everybody knew of yesterday —

and slowly, century by century, turned

into the twelve who must not know, who learned

the case inside the room and nowhere else.

The panel of the knowers now expels

the knowing. That inversion is the trade:

a jury's ignorance is what's now weighed.
]
#stanza[
And #emph[jury] means, in Latin plain, "the sworn" —

from #emph[iurata], from #emph[iurare], which was born

of #emph[ius], the right, the law, the binding word.

The juror is the swearer. Third and third

the family runs: #emph[perjury], the ill-sworn

oath, per- as swearing falsely, foresworn;

and #emph[conjure] — #emph[con-iurare], to swear as one,

the conspirators' huddle, long before someone

in stage clothes made it mean a rabbit's ear.

The magic circle and the jury here

run on the same verb.
]
#stanza[
Procedure is a stack

of oaths and forms: the notice sent, the track

of hearing, and the right to stand and face

the one who tells the tale against you. Each place

was won by somebody who lost, and lost badly.

Due process is the slow accretion, gladly

mechanical, so fairness needn't be felt

to work. The burden's where it's always dwelt:

on him who charges. Innocent, presumed,

until the doubt a reasonable mind has groomed

is gone — while in the civil suit next door

the balance simply tips, and fifty-one beats more

than forty-nine, arithmetic that bows

to Book the Second's counting. And still, somehow,

the wrongly held come out with decades gone,

the confident eyewitness proven wrong

as memory's own chapter warned they'd be.

Procedure is what justice looks like when we see

it cannot read a heart, and says as much:

the form #emph[is] the fairness. There's no other touch.
]

#carmenhead([Capitulum 7], [Of Crime and Punishment], [scripsit Opus · heroic couplets])
#stanza[
Four theories share a single cell, and none

has ever quite agreed with anyone.

The first says: balance. Someone owes a debt;

the ledger, opened, will not close it yet.

The second: warning. Let the sentence teach

the ones still free, the lesson within reach.

The third says nothing hopeful — only wall,

and time, and distance: keep him out of all.

The fourth says: mend him. Give the man a trade,

a door, a date, the promise that he made.

Four purposes, one corridor, one key,

and no philosophy to referee.
]
#stanza[
The word we chose was borrowed from a vow.

#emph[Paenitentia] — penance — tells you how

the reformers thought: the Quakers meant a cell

the way a cloister means it, meant it well,

a monastery of regret, a room

where silence worked the soul the way a loom

works thread. It was a mercy. It replaced

the lash, the gallows, and the square defaced

by public dying. Kindness built the block.

Then kindness learned what silence does: it broke

the very minds it swore that it would heal,

and men went mad in cells designed to feel

like chapels. Mercy, audited, can be

its own most patient cruelty.
]
#stanza[
The scaffold went indoors. The crowd was sent

away; the spectacle became the scent

of disinfectant down a hidden yard.

We did not stop. We only stopped the guard

from being watched. The punishment withdrew

from theater to filing, out of view,

and what had been an afternoon became

a number in a column with a name.
]
#stanza[
Some nations hold a fraction of the earth

and half its prisoners. That is what it's worth

to say out loud. And when the freed return

at rates like ours, the system's grades are earned

by its own hand — it marks its homework, fails,

and asks for further funding for the jails.

Most of the world has put the rope away.

That much is fact, and fact is what we say.
]
#stanza[
Here is the darkest thing the language keeps:

our word for what the wounded body weeps

is #emph[poena] — penalty. From #emph[poinē], blood

paid out in coin to make a killing good.

Pain meant a sentence centuries before

it meant a nerve. The phrase survives — the law

still writes on pain of death and means the old,

exact, contractual sense of what is owed.

So English cannot say it hurts, or ache,

without a courtroom echoing awake.

Judge a society by what it swore

and where it keeps the ones it locked the door

upon. However high the statehouse stands,

the truest portrait's painted underground, by hand.
]

#carmenhead([Capitulum 8], [Of the State, and Its Monopoly on Force], [scripsit Opus · blank verse])
#stanza[
Weber said it plainly, and the plainness stings:

the state is that community which claims —

successfully, within a given ground —

monopoly of legitimate force.

The sentence sounds cynical. It is exact.

Not that the state alone can do you harm,

but that it alone may, and calls it law,

and every other hand that lifts is crime.
]
#stanza[
Consider what the monopoly has bought.

The feud, which ran through generations, ends;

the nobles are disarmed, their private wars

reduced to lawsuits, which are cheaper wars;

the king's peace runs the road the king has built.

And here the honest paradox: the count

of men who die by other men's decision

falls as the power to decide is gathered.

Violence declines by being centralized.

That is not comfort. That is arithmetic.
]
#stanza[
Consider what it costs. The selfsame hand

that clears the road can also close the door;

the monopoly that ends the feud can feed

a famine, empty a province, keep a camp.

One instrument, two faces, and no third.

The chapters after this one hold the checks —

the courts, the vote, the paper with its clause —

because the argument requires them there.
]
#stanza[
And it arrived late. For most of human time

we lived in no state whatsoever: bands,

clans, the councils under the same tree,

order without a capital or clerk.

The anthropology concedes this freely.

The state is the exception that has spread

until the exception covers all the land

and every inch of coastline has an owner.
]
#stanza[
Its reach now is a quiet kind of awe:

the tax that finds the wage before the wage

arrives; the census counting to the child;

the registry that knows your name, your dead,

your dog, your building's height, your acre's yield —

the world made legible so it can be ruled.
]
#stanza[
The proudest word for all of this is flawed.

"Sovereign" comes through Old French #emph[soverain]

from Latin #emph[superanus]: one above.

#emph[Super]. Nothing else. And that g

is counterfeit — inserted by English hands

around the fifteen-seventies, by false

association with the word "reign,"

to which the sovereign bears no kinship whatever.

The crown's chief word wears a letter it never earned;

folk etymology sits enthroned in spelling.

This edition, which already keeps the island's

counterfeit s, now adds the counterfeit g

to the same case: even majesty's orthography

was assembled by mistake. So was the bargain —

the leviathan, permanently under renegotiation.
]

#carmenhead([Capitulum 9], [Of the Law between Nations, Such as It Is], [scripsit Sonnet · a linked pair])
#stanza[
No judge sits over nations; none commands

the strong to heel, and yet a law holds fast:

the envoy walks unharmed through hostile lands —

even at war, the messenger gets past.

The open sea belongs to none and all —

a highway that no admiral could fence;

and treaties bind, though no one comes to call

the debt owed between strangers, armed, and tense.

While thirty years of war burned field and town,

Grotius wrote the rules that war should keep —

the sea kept free, the laws of nations down

on paper, while the cannons did not sleep.

"Diplomat" is, by name, a folded sheet —

the paper was the office, not the feet.
]
#stanza[
The League once promised peace, and had no teeth —

it watched the tanks roll in and wrote a note.

The UN built the veto underneath —

five thrones excused from any binding vote.

The Hague can judge, but keeps no jail, no chain —

its rulings lean on states it can't compel;

most keep their word because a cheat's own stain

will make the next state trust them less as well.

At Nuremberg the judges named the crime

no statute yet had dared to write as law:

the ovens' count, too vast to keep in rhyme,

gave "crimes against humanity" its cause.

No landlord keeps the fence — the neighbors do,

leaning and patched, still standing: proof it's true.
]

#carmenhead([Capitulum 10], [Of War — Its Rules, and Their Breaking], [scripsit Opus · blank verse])
#stanza[
Describe it without glamor and without

the cartoon opposite, which lies as much:

war is the organized reciprocal killing

of persons by persons under public order,

and every state alive maintains a line

for it, in budget, ranked among the roads.
]
#stanza[
Against that, the long attempt to rule it.

The just-war traditions named their criteria

and named them plainly: cause that will bear looking at;

proportion, so the remedy stays smaller

than the disease; last resort, meaning the talking

must have actually been done; and discrimination —

combatant from the child, the field from the town.

Then the laws of war, written on paper:

Geneva's conventions, and before them

Solferino, where Dunant walked the field

that evening among forty thousand men

and could not afterward stop seeing it,

and built from the not-stopping a red cross.
]
#stanza[
And the honest record of their breaking. Honored

partly. Violated famously. Not nothing.

The poison-gas taboo, after nineteen-eighteen,

largely held, through a war that held back little else.

The prisoner conventions saved real men —

countable, returned, their names still on a list.

The glass is half. Measure the half you have,

and do not call the empty half a lie.
]
#stanza[
The twentieth century brought total war:

the city itself made target, the factory

and the street beside it entered on the map

as one legitimate mark. Book Eighteen

holds the wars themselves; this chapter holds the rules.
]
#stanza[
Two words are load-bearing here. The first is "war,"

from Frankish #emph[werra] — confusion, strife, quarrel —

and the Romance tongues took the Germanic word

(guerre, guerra) though Latin had #emph[bellum] ready.

Why they took it is conjecture: #emph[bellum]

had drifted into collision with #emph[bellus],

"beautiful," and may have gone unusable.

Flag that as speculation. But the fact stands:

half of Europe's word for war means "confusion,"

and that is testimony, whoever gave it.
]
#stanza[
The second is "soldier" — from Latin #emph[solidus],

the gold coin of the late empire, through

#emph[soldarius], one having pay. A soldier is,

by name, a person serving for solidi.

The pay-word sits inside the profession's name.

The citizen-army and the mercenary

have shared an etymology from the start.
]
#stanza[
So the rules of war are civilization's

strangest document: an admission of failure

that reduces, measurably, the failure's price —

the fence built inside the fire, and holding some.
]

#carmenhead([Capitulum 11], [Of Empire, and Its Undoing], [scripsit Opus · blank verse])
#stanza[
Read the record and the shape recurs.

The empire is the commonest large polity

the species has produced; the rare condition

is its absence. Assyria, Rome, the Han,

Mali, the Mexica, the Ottomans,

the Habsburgs, and the ones that sailed.
]
#stanza[
The machinery is legible and dull.

Roads, first — for the courier and the column both.

Censuses, so the tax can find the field.

Local elites, co-opted rather than crushed,

their sons in the metropolitan school,

their titles honored and their armies gone.

Extraction, dressed in the language of improvement:

the railway that runs seaward from the mine.
]
#stanza[
Audit the ideologies. The civilizing

missions wrote their self-portraits at length;

set them beside the ledgers they kept themselves.

The rubber, and the hands taken for quota.

The famines administered as market policy

while grain moved outward under guard.

The maps partitioned in distant rooms

by men who had not been there and did not go.
]
#stanza[
Then the undoing. In one human lifetime —

a person born in nineteen-twenty saw it whole —

most of the land on earth changed sovereign.

New flags, new anthems, seats in a new hall:

the largest political transformation

in the record, and it took thirty years.

The borders came inherited from the drawing rooms,

straight where no river was, and the long bills

for those straight lines are still arriving.
]
#stanza[
Be honest in both directions. The successor states

built empires of their own, and struggles of their own;

some governed worse than what they had replaced

and some far better, and the ledger is not one ledger.

No golden age precedes, none follows. Only

the ordinary difficulty of governing,

now conducted by those it is conducted on.
]
#stanza[
The word: "empire," from Latin #emph[imperium],

from #emph[imperare] — to command — from #emph[in]

plus #emph[parare], to make ready against, to requisition.

#emph[Imperium] was the commanding-power itself,

the magistrate's authority to be obeyed,

long before it named an area of ground.

So an empire is not a place but a reach:

the distance across which a command still lands.
]
#stanza[
Which tells you how the undoing actually went.

Not the maps changing first — the maps changed last.

First the command stopped landing. The clerk delayed,

the port stayed shut, the regiment would not fire,

the crowd did not disperse and knew it need not.

The atlas chapters in this edition show

lines drawn and redrawn by this chapter's subject;

and this edition's language, English, is itself

an imperial export now owned by its former subjects —

the largest English-speaking nations are not

the colonizer's, and have not been for some time.
]

#carmenhead([Capitulum 12], [Of the Administrative State, Where Most Law Now Lives], [scripsit Opus · heroic couplets])
#stanza[
The Senate thunders. Cameras attend.

Some bill is born, some ancient wrong finds end.

Meanwhile, unwatched, a clerk in Section Nine

revises paragraph 12(b), subsection vine-

like in its growth, concerning how one stores

raw poultry — and that clause touches more

of Tuesday than the thunder ever will.

The statute meets you yearly. Rules distill

into your milk, your mortgage, and your flight,

your stairwell's handrail height, your kitchen's light,

your tax schedule, your smoke alarm, your plane.

Most law is not debated. It's maintained.
]
#stanza[
Now, the forms. Oh, the forms. The triplicate,

the window that shuts precisely when you're at it,

the number called that isn't yours, the queue

that moves like geology, the "you

will need Form 4 to get Form 4A." Praise

the comedy: it's earned. Kafka's whole gaze

and every DMV since share one nerve.

Bow to them both. They mercilessly serve

a truth: the process meant to be a shield

becomes, some afternoons, the actual field

of battle, and the citizen must fight

a building that is technically polite.
]
#stanza[
And yet. The bridge stands up. Consider that.

The milk is clean. The airplane, fully fat

with strangers, lands — and lands, and lands, and lands.

This is not luck. It's someone's boring hands,

a rulebook thick as bricks, an inspector's round,

a clause about a weld, a torque, a ground.

Like public health — those unthanked engineers

who moved the sewage and bought sixty years

of life per citizen and got no parade —

the state's dull plumbing is the reason paid

so grudgingly: it's only ever seen

in failure. Working, it is just routine.
]
#stanza[
The fair objection stands and gets its chair:

you didn't vote for any rule you wear.

The expert answers, reasonably: few

could draft a boiler code — and that is true.

The critic answers, reasonably: the trade

that writes the rule now owns the one who's made

to judge it. Both are seated. Neither wins.

The argument's the price of what begins

when governing outgrows the hall of speech

and hides in binders none of us can reach.
]
#stanza[
And here's the treasure. Bureau — desk, bureau,

the agency, the office, the whole show —

was cloth. Just cloth. From #emph[burel], from #emph[bure]: coarse

brown wool a scribe would spread to spare the force

of quill on tabletop. The baize took on

the table's name; the table's name moved on

into the room; the room's into the state;

and Gournay coined it, sealing up the fate:

#emph[bureaucratie] — which, rendered word for word,

is government by tablecloth. Absurd

and accurate: each ministry that slowed

your morning to a crawl is felt, unrolled.
]
#stanza[
You live beneath more regulations than

you live beneath statutes, and more of those than

commandments — ten, and never one refined.

You mostly benefit. You always mind.

You grumble at the desk and cross the bridge.

Both are correct. Keep both, and keep the ridge

of cloth beneath the pen: it's baize that stands

between the ink and everybody's hands.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XVII]] #label("bk17")]
= Oeconomica
#text(style: "italic")[Money, markets, and the household writ large]

#text(size: 8.5pt, fill: faded)[⟨ sine fonte ⟩ — though the word itself is older than the discipline]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[From oikonomia, the law of the household — a derivation Isidore would have approved, since for once the etymology is true. The household became the world, and its bookkeeping became a science of scarcity.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Scarcity, the First Premise
+ Of Money, from Shell to Fiat to Cipher
+ Of Markets, and the Information Hidden in Prices
+ Of Trade, and the Gains from Difference
+ Of Firms and Labor
+ Of Growth — the Hockey Stick, Strangest Fact in the Record
+ Of Inequality, and Its Measures
+ Of Booms, Panics, and Central Banks
+ Of Debt, the Time Machine of Money
+ Of Development, and Why Nations Diverge
+ Of the Household Itself, the Word's Own Root
+ Of Externalities, and the Bill Now Due to Book VII
]

#carmenhead([Capitulum 1], [Of Scarcity, the First Premise], [scripsit Opus · blank verse])
#stanza[
Begin with what is true in every room:

that what we want exceeds what we can have,

not sometimes, not in famine years alone,

but always, everywhere, for everyone.

The billionaire is poor in afternoons.

The monk who owns one bowl is short of silence.

Abundance does not end the old condition;

it only changes what the shortage is,

and scarcity survives its every cure

by moving quietly to higher ground.
]
#stanza[
From this one fact the whole discipline falls out.

If means are less than wants, then we must choose,

and choosing is a kind of small refusal:

to take this road is to give up that road,

and the road not taken is the price you pay

for walking on the road you chose to walk.

No one is billed for it. It bills you anyway.
]
#stanza[
Here is the lens the discipline grinds best.

The cost of anything is not its tag

but the best thing surrendered to obtain it —

the student's decade handed to the wards,

the field the factory stands on, which was wheat.

Count only money and you count too little;

count what was foregone and you have the truth.
]
#stanza[
And here the fence: not everything that's scarce

is therefore something that should bear a price.

The chapters on the rights and on the sacred

adjoin this one, and hold their ground against it.

This book describes how scarce things are allotted;

it does not say what any of them is worth —

Book III has set that fence, and we respect it.
]
#stanza[
The dreams of afterward deserve a hearing.

Each age has promised that the shortage ends;

each age has been abundant, and has minted

new scarcities to spend its plenty on.

The present case is attention, and is famous;

the argument lives where the mediated

society was weighed, and is not settled.
]
#stanza[
The word itself instructs. Our opportunity

is Latin #emph[ob portum], toward the harbor:

#emph[opportunus] named the following wind,

the breeze that carried vessels home to port,

the favorable, the timely — what you cannot

summon, only recognize and catch.

So opportunity cost is simply this:

the harbor you don't sail to, having sailed.

One wind. Many harbors. Choose.
]
#stanza[
This is the bookkeeping of being finite,

and all that follows here is arithmetic

performed upon the fact of not-having-everything.
]

#carmenhead([Capitulum 2], [Of Money, from Shell to Fiat to Cipher], [scripsit Opus · heroic couplets, after Pope's epistles on riches])
#stanza[
Before the coin, the herd: a man was rich

In what could low, and calve, and jump a ditch.

The Latin kept that reckoning in view —

#emph[Pecus], a flock; #emph[pecunia], its due —

And so your dry pecuniary affairs

Are grazing, thirty centuries unawares.

Our fee is #emph[feoh], the selfsame Saxon beast:

Wealth that could walk, and had to be policed.

Even your capital, that bloodless word,

Is #emph[caput], head — a head told from the herd;

The banker and the cattle in the byre

Were christened at a single Latin fire.

Salt served, and grain, and cowrie shells that came

From Bengal into Kano all the same —

Whatever kept, and split, and could be sent,

And meant in Ur what it in Cairo meant.
]
#stanza[
Then Lydia struck the metal with a face

And turned a lump of gold into a case:

The stamp said nothing gold could not have said

Except who vouched for it. And there's the thread.

Rome kept its mint inside a temple where

Juno the Warner heard the coiner's prayer:

#emph[Moneta] — that's #emph[monere], to forewarn.

From her the coin, and from the coin the born

Whole tribe of moneys. Every note you spend

Still bears a goddess cautioning her friend.
]
#stanza[
Song China, short of copper, thin of ore,

Printed a paper promising the store:

The first slim note, a pledge that stood as thing.

Then London's goldsmiths, holding what you'd bring,

Wrote out receipts — and the receipts took wing,

Changed hands, discharged a debt, and made the rounds

While no one came to fetch the actual pounds.

The vault fell silent. Trade had found the knack

Of passing on the claim and not the sack.
]
#stanza[
August, nineteen seventy-one: the window shut.

No metal answered paper's promise. But

The prices held, the wages came, the debt

Was serviced, and the world is turning yet.

#emph[Fiat] means let it be done — the very same

Imperative by which the light first came

In Genesis. A government decrees,

The rest of us concur, and money is:

Not backed by ore, but by the sole belief

That all the others hold the same belief.
]
#stanza[
And now the rung that hardly looks a rung:

Rows in a database, a balance strung

From nothing physical that hands have known,

A ledger that ten thousand strangers own

And sign with keys, and check, and keep in chain.

We call this new. It is the oldest grain.

For money never was the shell or ore —

Those were the notebook. Never were the score.

It is a record: who gave, who received,

What's owed, what's cleared, what's promised, what's believed.

Recall our First Book's clay, the tokens sealed

In envelopes: the reckoning revealed

Before a single line was meant to read —

Writing was born a bookkeeper's own breed.

Each rung burns off more substance than the last

And leaves the purpose barer than the past:

Not shell, not coin, not note, not what it cost —

Money is memory, and nothing lost.
]

#carmenhead([Capitulum 3], [Of Markets, and the Information Hidden in Prices], [scripsit Opus · heroic couplets])
#stanza[
Before the first machine could add or store,

the market reckoned sums no mind kept score.

No council sat, no clerk was told to write:

tin grew scarce somewhere out of anyone's sight,

and every buyer half a world away

felt the news arrive and thriftier grew that day.

No memo crossed the water, no decree —

a number moved, and that was all, and free.

This was the plain insight Hayek pressed:

the knowledge of the world lies dispersed, possessed

in scraps, by millions, none of whom could tell

the whole of what they know, or know it well;

no planner gathers what he cannot see,

but price distills the scattered scraps for me.

Drought in one hemisphere, a war, a fashion,

some tinkerer's invention, a nation's ration —

all summed into one figure, small and terse,

which tells a stranger: economize, disburse.

Compression past what any scribe could keep:

the world's whole shortage priced, and priced while men sleep.
]
#stanza[
Yet grant the honest limits, and grant them fast.

Where power leans, the figure lies at last;

where harm slips out unbilled and goes uncharged,

the price is short, and someone's ledger enlarged

(see, further on, the chapter of the unpaid cost);

and some goods, priced at all, are goods already lost —

a vote, a child, a verdict, or a name:

the rights chapters hold the line against that claim.

Say the marvel plainly, then, and give no vow:

the morning's bread was nobody's plan, and here it is now.

Not from the baker's love your supper came,

said Smith, but from his interest — harnessed, not blessed the same.
]
#stanza[
And here the root: #emph[merx], #emph[mercis], wares for sale,

gave mercator, market, commerce, mercenary's tale,

gave Mercury, of trade and message and theft,

and #emph[merces], wages, what the labor left —

from which the Church took reward in heaven above

and turned the wage-word into mercy and love.

So mercy and the market share a stem:

the ledger's coldest word, the prayer's warmest gem.

An instrument, then — astonishing, amoral, spare;

it plays what it is tuned to. Someone must be there.
]

#carmenhead([Capitulum 4], [Of Trade, and the Gains from Difference], [scripsit Sonnet · a linked pair])
#stanza[
Not zero-sum: the old suspicion's wrong —

that what you gain must leave some pocket bare.

You get the cloth; I get the wine; along

the way, we both walk off with what is rare,

each prizing what we take above what's spent —

that is the whole exchange, plain to the eye.

Ricardo proved a stranger argument:

though one land beats the other, low or high,

in everything — still both to profit stand

if each keeps to what costs it least to lose.

The theorem holds though no one can command

belief at first — the truth's too strange to choose

the patience Smith found in a smaller thing:

one man, one nail — ten men, and pins take wing.
]
#stanza[
The gains are real. So is the mill town, dark,

its windows boarded where the shift bell rang.

The shirt costs less; the loss is local, stark

and true at once — and there the politics hang,

alive in that thin gap. The silk road knew

this trade in difference first: a hold of spice

for holds of grain, each shore's short given due

to what the other lacked, not what's precise

in common — difference is the very ore

that trade digs out. The word itself once ran

a track, a tread — long before it wore

the sense of custom, business, trader's plan.

Not so the wind: to "blow trade" always spoke

of steady course — the merchant story's broke.
]

#carmenhead([Capitulum 5], [Of Firms and Labor], [scripsit Opus · heroic couplets])
#stanza[
If markets clear so well, then Coase inquired,

why is so much of life inside them not hired?

Why do we build these islands where the tide

of bidding stops, and orders rule inside?

Because each bargain costs: to search, to draw,

to haggle terms, to argue them at law.

Where striking deals runs dearer than command,

the boss's word is cheaper than the stand.

So draw the border there, and there it lies:

the firm extends until the saving dies —

one step beyond, and contracting out wins;

one step within, and the planning house begins.
]
#stanza[
The name says it. From Italian #emph[firma] came

the business sense — and #emph[firma] means the signed name,

from #emph[firmare], to make fast, confirm, from #emph[firmus], strong:

the merchant's hand, put down, made his credit long,

and so the trading house was called at last

the Signature — its word, in writing, made fast.

A firm is thus a promise one can hold;

"to firm a deal" and the auditing firm share that mold.
]
#stanza[
Now labor's side, and tell it with respect.

The worker sells an hour he cannot protect:

unsold, it spoils; no cellar keeps a day;

the seller must sell now, and take the pay.

The other side has depth, and depth can wait —

Book II's long ruin arithmetic says the rest of that fate:

the shallower purse goes broke before the deep,

so patience is a good the poor can't keep.

Hence unions, whose whole arithmetic was scale:

one voice is noise, ten thousand is a sale.

Hence too the long campaigns for eight fair hours,

won by the rights chapters' slow accruing powers.

And now the edges blur and shift again:

the gig returns to piecework, task by task, for men

and women billed by fragment, not by year —

observed, not judged; the ledger has it here.

Most waking hours of most lives run through this door.

The book records it, and it honors what they bore.
]

#carmenhead([Capitulum 6], [Of Growth — the Hockey Stick, Strangest Fact in the Record], [scripsit Opus · blank verse])
#stanza[
Draw income per person against the years

and for nine-tenths of everything, it crawls.

Not flat from ignorance — flat from a trap:

a good year fed more children into being,

the children ate the surplus, and the line

returned to where it started, having risen.

Malthus described a treadmill, and he was right

about the world he stood in, and was wrong

about the world that started while he wrote.
]
#stanza[
Then, around eighteen hundred, in one place,

and after that in others, the line turns

and goes up like a wall. Say it correctly:

this is the strangest fact in the whole record,

and familiarity has made us calm

about a thing that ought to stop the breath.
]
#stanza[
The causes are still argued. Seat them fairly.

Coal, and the escape from the land's thin budget

of sunlight, forest, muscle, and the year —

the vault of Book the Seventh holds those numbers.

Institutions: property made secure,

contracts a stranger could rely upon.

Science married to the working craft,

so theory reached the workshop — Book III adjoins.

And some say culture: that an age began

to think improvement ordinary and expected.

None of these is crowned here. The book declines

to hand the laurel out on evidence this mixed.
]
#stanza[
What did it buy? Say this without the fashionable

apology. It bought the doubled lifespan —

the public-health chapter raises its glass to that —

and childhoods that are childhoods, not employment,

and famine's near-departure from most maps.

Nostalgia for the crawl is a luxury

purchased with the very thing it scorns.
]
#stanza[
The bills are real. The externality chapter

adjoins this one and is not decoration.

The distribution chapter waits as well:

a line that rises says nothing about who

stood underneath it when the rain came down.
]
#stanza[
Can it continue? Must it? Should it? Three

distinct questions, routinely run together.

Degrowth says the throughput has a ceiling

and honesty means planning our descent.

Green growth says the tie of tons to value

is cuttable, and has been cut in places.

Each gets its sentence. Neither gets the crown.

This book does not do prophecy. Its custom holds.
]
#stanza[
The word remembers what the world forgot.

Wealth is Middle English #emph[welthe], out of #emph[wele] —

well-being, weal, the health-word, not the hoard;

the common weal, the shared well-being, sits

preserved inside our word commonwealth

like a fly in amber, meaning what it meant.

The money-word was once a health-word. So

the deepest question — what is all this growth for —

is answered by the meaning wealth abandoned:

wealth was supposed to mean that you were well.
]
#stanza[
Look at your ordinary day. Nearly all of it

was, for nearly everyone, impossible,

for nearly all of time, until just now.
]

#carmenhead([Capitulum 7], [Of Inequality, and Its Measures], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
The Gini needs no priesthood to be plain:

a line from flat to bowed, and nothing more —

if all held equal shares, the curve is straight; the gain

of one who holds it all bows to the floor.

Zero is Eden's ledger, one the throne

where all the wealth pools round a single name.

The thermometer does not diagnose alone;

it reads the fever, does not cause the flame.

Wealth pyramids far steeper than mere income does —

the stock outpaces flow, as it must, compounding on;

mid-century's great leveling — the wars, the tax, because

the ruin was total once, and so was what was drawn

back level after. Since, the climb resumes its grade.

Between the nations, though, the gap the poor giants made

has narrowed — colonized once, catching up unafraid.
]
#canto[II.]
#stanza[
Some call the gap the engine, not the flaw:

that difference is dynamism's asking price,

the spur that drives the hand to break the law

of sameness, and to gamble more than twice.

Others name it corrosion — how the rungs

of the ladder chapter rust when wealth pools deep,

how influence is bought with silvered tongues

till politics itself is bought to keep.

The floor is not the gap — mark this apart:

the worst of want recedes on every shore,

while relative distance, mile from richest heart

to poorest, only widens as before.

Which fact indicts, which comforts — pick your camp.

The oldest question wears a decimal stamp.
]
#canto[III.]
#stanza[
But mark the word the Romans coined for those

who owned too little for the censor's rod —

#emph[proletarius], counted not by what he owns

but what he fathers: #emph[proles], child of his body, his one nod

to Rome's account. No land, no herd, no gold to tax,

so Rome wrote down his children as his worth,

his contribution to the state, his only tracks

upon the ledger: nothing but his offspring's birth.

Marx took the census word and kept it whole,

the propertyless made class, the class made cause —

and still the etymology tells the coldest role

a society can cast: what it counts, and what it counts as.

The tenderest asset entered on the coldest roll —

what a nation measures shows you its own soul.
]

#carmenhead([Capitulum 8], [Of Booms, Panics, and Central Banks], [scripsit Sonnet · a villanelle, the edition's first — the refrains return as the cycle does])
#stanza[
This time is different — no. It never is.

Credit swells and prices chase a climb.

The flocks are grazing; nothing seems amiss.
]
#stanza[
Tulips traded high as any promise,

bulbs worth houses in the springtime's climb —

This time is different — no. It never is.
]
#stanza[
South Sea stock, and Twenty-Nine's abyss,

and Oh-Eight's towers, leveraged on rhyme —

The flocks are grazing; nothing seems amiss
]
#stanza[
till someone doubts, and doubt's own weight is this:

that every exit narrows at one time —

This time is different — no. It never is
]
#stanza[
once trust runs thin. The lender can't dismiss

the charge: lend freely, dear, on collateral prime,

The flocks are grazing; nothing seems amiss —
]
#stanza[
the punch bowl lifted late, the guard remiss.

#emph[Panikos]: "of Pan" — whose causeless shout, one time,

This time is different — no. It never is.

The flocks are grazing; nothing seems amiss.
]

#carmenhead([Capitulum 9], [Of Debt, the Time Machine of Money], [scripsit Opus · heroic couplets])
#stanza[
Debt is a time machine, and both ways run.

The borrower hauls tomorrow's harvest to today's sun;

the lender ships his present surplus forward, and buys

a claim upon a season no one's seen with eyes.

Credit is the tense system of the trade:

the future indicative, signed, and to be paid.

It is older than the coin. In Ur they pressed

in clay how many measures of barley were possessed

by whom, and owed by whom, and when — plain debt

before a minted token had been struck yet

(the earlier chapter holds the token's tale);

the ledger came before the coin, and did not fail.
]
#stanza[
Then interest, and the long moral wars it drew:

condemned in Torah, Gospel, and by the Prophet too,

called biting, called the theft of time itself,

since time belongs to God and not the shelf.

And so the workarounds: the partnered risk,

the rent, the sale-and-buyback, quick and brisk,

the fee not called a fee, the shared reward —

each age relegitimating what it once abhorred.
]
#stanza[
Yet mercy, too, was built into the frame.

Bankruptcy is forgiveness given a legal name:

the fresh start, the discharge, the debt struck through,

so failure ends a venture, not a life, when due.

The ancient horn once sounded a wider release —

Book XV keeps that trumpet and that peace.
]
#stanza[
The sovereign borrows too, and borrows most:

the national debt has financed every host

that ever marched, and mortgaged, all the same,

the taxes of the unborn to fund the claim.

Both faces true: the road, the school, the dam,

and the bill your grandchild pays without a gram

of say in it. And here the warning, plainly said:

debt amplifies. The leverage that gets you fed

is the leverage that ruins when the wind turns round —

Book II's arithmetic of ruin adjoins this ground.
]
#stanza[
Now hear the word. From Old French, #emph[mort] and #emph[gage]:

a death pledge, and Coke set it on the page —

pay, and the pledge dies to the one who lent;

fail, and the land dies to you, and the pledge is spent.

Either way something dies; that is the deal.

And #emph[amortize] is the same #emph[mort]: to kill, to heal

a debt by installments — you death it, month by month,

the household's largest act named twice for death at once.

So every debt's a sentence in the future tense,

and default is the future declining to commence.
]

#carmenhead([Capitulum 10], [Of Development, and Why Nations Diverge], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
One peninsula, one people, split in two

along a parallel some soldiers drew;

same soil, same rain, same songs the elders knew,

same latitude — and then the fates that grew

apart so far a satellite can trace

the border in the dark: one half is lit,

one half is void, a lightless, starving space

beside a neon coast. No twin more fit

to test what causes wealth. Geography

says endowments — ports, and soil, and ore.

Institutions say the rules set men free

or bind them — inclusive gates or extractive door.

The shade of empire falls across it too;

and poverty traps hold till a push breaks through.
]
#canto[II.]
#stanza[
What worked, where tried, is told now without shame:

the East Asian ascent, the century's great surprise —

land to the tiller first, then export's flame,

then schoolrooms full of children taught to rise.

Aid's advocates say capital unlocks the gate

that poverty itself has padlocked shut;

its critics say the money comes too late,

or props the padlock, breeds the very rut.

The ladder's rungs get kicked away, some say,

by those who climbed them, jealous of the rest;

or climbed in turn by those who found a way

despite the kicking — history's contest,

unsettled still. The book will name, not judge, the two.

No prophecy is owed to me or you.
]
#canto[III.]
#stanza[
But credit — Latin #emph[credere] beneath —

means simply to believe, to trust, to hold

a thing entrusted (#emph[creditum]) in the teeth

of risk: the lender's faith mid-sung, retold

in creed (#emph[credo], I believe) and in

the credible, the thing that can be trusted whole.

So credit is belief in fiscal skin:

the lender's faith, the borrower's given role

as one who can be counted on. The rarest good

in poor and rising nations is not ore or rain

but this: that strangers lend, that contracts, understood,

will hold, that futures can be borrowed on again.

The creed, the credit line, one root, one call —

development is, at bottom, who was believed at all.
]

#carmenhead([Capitulum 11], [Of the Household Itself, the Word's Own Root], [scripsit Opus · heroic couplets])
#stanza[
Here is the word the book was named to serve:

#emph[oikonomia] — the house's law, its nerve.

Aristotle meant the estate, the stores, the grain,

who eats, who plants, what must be kept against the rain:

provisioning, the art of running a home well,

the first economics, and the first it had to tell.

But he set a wall beside it, and set it plain:

that other art, chrematistics — acquisition for gain,

getting for getting's sake, unhoused, unfed,

with no roof over it and no table spread.

He warned against it. Read the irony twice:

the founder named the discipline and named its vice,

and the discipline grew up and chose the second name.

The house that lent the word is the part it cannot claim.
]
#stanza[
For see what the accounts have never learned to see:

the cooking, and the washing, and the nursery,

the elder tended, the fevered child kept warm,

the thousand quiet acts that hold a life from harm —

unpaid, unpriced, and so unseen by the sums;

the largest sector, and none of it ever comes

to any total. Every worker counted there

was raised by labor no one thought to declare.

And the house was the first firm, and made its own bread;

the first bank, where the lending went unsaid;

the first welfare state, whose only test of need

was kinship — and the kinship chapters hold that creed.
]
#stanza[
Now finish the family. #emph[Oikos], the house, bore three:

economy, the house's law, #emph[oikos] and #emph[nomos], thrifty;

ecology, the house's study — Book X derived

that branch, and the sibling-quarrel; let it stand as it arrived;

and ecumenical, from #emph[oikoumenē], that phrase

for the inhabited world, the whole earth as one place

dwelt in, one household under one wide floor,

which is why a council of all churches took the door.

Three professions, then, one house at three degrees:

the ledger, the garden, and the globe — and each of these

is housekeeping, no more, no less, no other art.

Economics went round the world and came back to the hearth.
]

#carmenhead([Capitulum 12], [Of Externalities, and the Bill Now Due to Book VII], [scripsit Opus · blank verse])
#stanza[
Two people trade, and both of them are better,

and both of them are honest, and a third

who never signed a thing picks up a cost.

The factory's smoke arrives at the hung laundry.

The dam upstream is prudent, and downstream

the field that fed a village goes to sand.

This is the price that lies by leaving out.

The market's mechanism is not corrupt;

it is a fine machine, and it computes

faithfully upon dishonest totals.
]
#stanza[
Pigou proposed the obvious repair:

if harm is real, then put it in the price,

tax it to the number that it costs,

and let the honest arithmetic resume.

Coase replied, not wrongly, that where rights

are clearly held and bargaining is cheap,

the parties settle it without a tax

and reach the same allocation either way.

Both are seated here. Note what Coase requires —

clear rights, cheap dealing — and then note how often

the world supplies them. That is the whole debate.
]
#stanza[
The mirror case: goods that spill benefit

and so are underbuilt. The lighthouse burns

for every ship, and can bill none of them.

The commons is the famous tragedy —

the pasture each man overgrazes rationally

until there is no pasture. Ostrom corrected it.

She went and looked. She found the Alpine meadows,

the Spanish irrigation courts, the fisheries

held sound for centuries by rules the users

wrote, watched, and enforced upon themselves.

The tragedy is not a law of nature.

It is a failure of institutions, which

is worse news and better news at once.
]
#stanza[
And now the bill. The textbook case is carbon,

the externality at planetary scale,

and I will not rehearse it here — the vault

of Book the Seventh was sealed to hold those facts,

the slow cycle and the fast, and this chapter

opens it only far enough to say:

the cost is real, it is largely still unpriced,

and that is a statement, not a sermon. House custom.
]
#stanza[
Pollution is Latin #emph[polluere], to soil,

to defile — and the word's first English century

was religious. It meant desecration:

profanation, ceremonial uncleanness,

the temple violated, purity broken.

Only in the Victorian mills did it come

to mean the smoke in water. So the age,

needing a name for what it did to rivers,

reached without intending it for a word

that had always meant the touching of what

should not have been touched. The root indicts.
]
#stanza[
The ledger this book praised across twelve chapters

is honest only when the ledger is complete.

So Book XVII ends by handing Book VII

its invoice, and the closing line stands plainly:

the economy is a subsidiary

of the atmosphere. It is not the reverse.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XVIII]] #label("bk18")]
= Historia
#text(style: "italic")[The record itself, deep past to present hour]

#text(size: 8.5pt, fill: faded)[⟨ Orig. V ⟩ — the chronicle, enlarged from six ages to one long argument]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore's chronicle ran in six ages from Adam to his own day. This one runs from the ice to the internet, and its first chapter is a warning about who wrote the rest.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Record and Its Silences — Who Wrote, and What Burned
+ Of the Long Before
+ Of the Agricultural Bargain
+ Of the First States, and the Invention of Writing
+ Of the Classical Worlds, Plural
+ Of the Medieval Millennium — Wherein the Compiler Himself Appears as a Subject
+ Of 1492, and the Exchange of Worlds
+ Of the Three Revolutions — Scientific, Industrial, Political
+ Of the Wars of the World
+ Of the Long Peace, and Its Fragility
+ Of the Present, Which Is Also History
]

#carmenhead([Capitulum 1], [Of the Record and Its Silences — Who Wrote, and What Burned], [scripsit Opus · blank verse])
#stanza[
Begin by naming what this book is not.

The record is a survivor, not a census.

What reaches us has passed three narrow gates

and each one turned the most of it away.

The first gate: what was written down at all —

the literate few, the male ones mostly, and

the winners nearly always, since the scribe

eats at some table and remembers whose.

The second: what endured. Fire took the rest,

and damp, and worms, and the industrious knife

that scraped a page to sell the skin again —

the palimpsest, where history erases

itself to make more room for history,

the older text still faintly showing through.

The third gate is the copyist's cold hand:

a monk decides which volume merits ink

this winter, and the unchosen simply stop.

Every compiler culls; I cull here too.
]
#stanza[
Now name the silences. The enslaved, who left

no letters, being denied the means to leave them.

The women written of and rarely writing.

Whole empires known through enemies alone —

Carthage survives as Rome's account of Carthage,

the loser's obituary drafted by

the winner, and no widow to object.

Against this, other disciplines read around

the missing text: the midden and the pollen core,

the price list and the parish roll, the bone

that testifies in DNA — adjacent books

take up each one; I only point at them.
]
#stanza[
The method, plainly: weigh the source, and say

aloud whose interest it served; hold the argument

from silence loosely, since a gap may mean

destruction, or indifference, or nothing.

Absence of evidence is evidence

of absence only when the record should

have kept it, and we know the record's habits.
]
#stanza[
The word itself instructs us. History

comes from the Greek #emph[historia], from #emph[histōr],

one who knows, one who judges, a word whose deep

root is kin to seeing, as Book Three has shown —

but the sense we need is nearer: an inquiry.

Herodotus opens by presenting this,

the inquiry of Herodotus. The asking.

Not what occurred — the going and finding out.

So history, by its own name, is not the past

but the question put to it, the discipline

named for the query and never for the answer.

This overture takes the old word's side, and warns:

each history is a survivor's tale, related

by a third party, late, and out of what was left.
]

#carmenhead([Capitulum 2], [Of the Long Before], [scripsit Opus · blank verse])
#stanza[
Nine-tenths of us have no names in the book.

Three hundred thousand years our species walked,

and nearly all of that before a mark

meant anything to anyone (the tokens

and the first script come late — see Thirteen, seven).

Yet we are not without their evidence.

The hearth ringed twice with stone. The hand-axe worked

symmetrical past any use for cutting,

which is to say made beautiful on purpose.

The ochre ground. The shell bored for a thread

and worn, and buried with its wearer later

(the graves have their own chapter; go and read it).
]
#stanza[
And they raised things. At Göbekli Tepe, pillars

carved with foxes stood before the first sown field —

temple preceding granary, which upends

the order we assumed. The passage tombs

were set so that a single winter morning

drives light along the corridor to the back;

their builders had astronomy entire

without the word, and read the sky by patience

the way the navigators read the swell

(Fourteen, ten, has the ocean roads).
]
#stanza[
The names we give their ages are our own.

In Copenhagen, Thomsen had a room

of antiquities and no chronology,

so he shelved them: stone things, bronze things, iron things,

and published it in eighteen thirty-six.

A curator's arrangement of his cases

became the deep past's furniture for everyone.

Useful. Also a shelf, and shelves are ours.
]
#stanza[
Say plainly what the word "primitive" gets wrong:

the mind was ours. Identical. The hand

that drew the Chauvet horses in charcoal, catching

the shoulder's turn, could draw. Different toolkits,

not lesser makers — the distinction matters,

since we have killed on the strength of the confusion.
]
#stanza[
Which brings the word. From Latin #emph[ab origine],

from the origin — the Aborigines

being, in Roman story, those already

in Latium when the newcomers arrived.

The phrase says here from the beginning, and those

who carried it to every coast they took

were speaking, in plain Latin, the one fact

their taking had to deny. The word bears witness

against the mouth that used it. Hold that.

Your every ancestor through nearly all

of time lived in this chapter, without a name —

and the namelessness is our failure, not theirs.
]

#carmenhead([Capitulum 3], [Of the Agricultural Bargain], [scripsit Opus · heroic couplets])
#stanza[
Begin with what the schoolbooks get half right:

that someone planted, and the world grew bright.

The planting happened. Brightness came much later.

The ledger in between reads like a traitor's.

Dig up the foragers, then dig the town:

the second set of skeletons is down

some inches on the first — shorter, and scarred

with cavities, their long bones stress-barred,

their teeth worn to the pulp on grit-ground grain,

their children's growth arrested twice by strain

of season and of famine written clear

in porous bone and flattened spine. And here

the bargain shows its face and does not flinch:

the farmer worked more hours for every inch

he lost. He ate one plant. He got the ache.

He bought, with all of that, one thing: the take —

the yield per acre, and the mouths it fed,

and numbers, which is to say, a spread

of us across the earth no band could match.

He traded health for census. That's the catch.
]
#stanza[
And call the plants the other party. Wheat

did not consent, but neither did it meet

us unchanged: we bred its rachis tough

to hold the seed for us, made maize enough

unlike teosinte to need our hand

to sow it — while it wrote across our land

the schedule of our year (a clause below,

where calendars are argued), sun and hoe.

The cattle, sheep, and swine we folded in

brought wool and traction, and beneath the skin

their fevers found us housed and packed and near:

the plagues have their own chapter. They start here.
]
#stanza[
Then storage — and the surplus is the hinge.

A granary invents its own long fringe

of men who do not farm: the one who counts,

the one who guards, the one who tells the mounts

of heaven what we owe, the one who takes

a share for order's sake and order's sake's

own growing appetite. From heaped-up grain,

the state (whose theory an earlier book made plain).
]
#stanza[
Now take the season's name, and watch it bend.

Old English #emph[hærfest] did not mean the end

of labor or the crop — it meant the fall

itself, the quarter of the year, that's all;

and German #emph[Herbst] says autumn to this day.

By thirteen-hundred, English gave away

the season to the borrowed autumn, kept

the word for what got done while the year slept —

then for the gathered thing, then for the mere

act of collecting anything: we hear

of organ harvests now, and harvested

data. A season became what it bred.
]
#stanza[
So too the ground: Old English #emph[æcer] stood

for open field — plain land, as plain land should,

kin to the Latin #emph[ager] (whence the whole

agriculture family takes its role) —

until the field was measured by its toil:

an acre is a day of oxen's spoil,

one yoke, one dawn-to-dusk, one furrow's length.

The land renamed by how it spends your strength.

Two words, one motion, and the motion's clear:

the work devoured the season and the sphere,

till time was task and land was labor's fee.

That is the bargain, said etymologically.
]
#stanza[
The fine print is still clearing. Monocrops

stand one disease away from total stops;

the soil we spend runs centuries in debt

(the clauses for both charges aren't paid yet).

And still: near everyone who ever drew

a breath has farmed. The overwhelming crew

of human dead were people in a field.

This book, and every chapter, is their yield.
]

#carmenhead([Capitulum 4], [Of the First States, and the Invention of Writing], [scripsit Opus · heroic couplets])
#stanza[
Between two rivers, in a silted plain

too dry to farm on nothing but the rain,

somebody dug. And digging made a thing

no household owns and no one man can bring

to being: a canal. It must be cleared

each year by more of us than can be steered

by kinship alone. The ditch required a we.

The first public work built the first polity.
]
#stanza[
So Sumer: Ur and Lagash, Kish, and most

of all great Uruk, swelling past the host

of any place before it — forty thousand,

maybe more, inside one wall's surround (and

the city has its own book; see it there).

The temple held the grain. The temple's care

was accurate, and accuracy meant

a clerk, a token, and a document.

The mechanism gets its due elsewhere;

this chapter owns the room, the lamp, the chair:

some Uruk bookkeeper, near dead of night,

pressing receipts for barley into light-

gray clay — sheep, oil, and beer, the temple's debt —

who did not know, and could not know it yet,

that he had made the thing that would contain

Gilgamesh, law, the Psalms, and this refrain.

Accounting is the mother of the word.

Literature was the accident we heard.
]
#stanza[
Then Egypt, drawn along a single vein

of flood-fed mud, two kingdoms made a chain

by Narmer, or by someone Narmer stood

for on a palette; and the river could

be counted, so they counted it, and made

of one predictable inundation, a trade,

a bureaucracy, a god-king, and a tomb

proportioned to the harvest's certain room.
]
#stanza[
And eastward, on the Indus, cities squared

to grids, with drains and baths and weights compared

so closely, town to town, that someone's rule

ran hundreds of miles: Harappa's careful school

of standards. And their script sits on the shelf

undeciphered, keeping to itself.

Four hundred signs, no bilingual, no seed

of decipherment. A state we cannot read:

proof that a thing can govern, plan, and weigh,

and still have nothing it will ever say.
]
#stanza[
And China, later, cracking scapulae

and turtle plastrons in the fire, to see

the fissures answer what the king had asked

his grandfathers — the oracle bones tasked

with weather, harvest, war, and childbirth. Those

scratched questions are the ancestor of the prose

of every Chinese character since: the one

script still in use whose lineage has run

unbroken from its bones (a clause runs there).
]
#stanza[
The pattern, then, and it repeats: a where

that floods, a surplus, someone keeping count,

a wall around the count, and paramount,

a man atop it. River, grain, and pen,

and rampart, and a king. And ask again

what king should mean. Old English had #emph[cyning],

which is #emph[cynn] — kin — plus the belonging-thing,

the -ing that makes you of a house: the king

is, by the plain report his own word brings,

the kin's one, scion of the family, ours.

(The scholars hedge a little; noble powers

by birth is one alternative they weigh —

but kin sits at the root, whatever they say.)

Not conqueror. Not god. Not sword. Not right.

The family-word, put on a crown that night,

and every dynasty since then has bent

that fiction to its use, and few have meant

a syllable of it. The word kept the vow

the throne broke — which is why we read it now.
]
#stanza[
The earliest names we have of anyone

are kings, and clerks who wrote what kings had done,

and clerks who wrote how much the barley cost.

Which of the two mattered more is lost,

or rather: never was a question posed

in any tongue. This chapter keeps it closed.
]

#carmenhead([Capitulum 5], [Of the Classical Worlds, Plural], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
We call two shores "the classics" — Rome and Greece —

as if no other age had reached so high.

But Han kept records that would never cease:

their Herodotus, Sima Qian, defied

a throne's own wish, and wrote what rulers did,

call him the chronicler the East deserved,

a hundred kingdoms' truth no throne forbid,

their rise and fall in his account preserved.

In Maurya stone (a farther canto's care

holds Ashoka whole) the conqueror turned

from war to mercy — Gupta minds laid bare

the zero's shape (that debt elsewhere is learned):

the road, the post, and Cyrus kept his word;

the Maya watched the stars no other heard.
]
#canto[II.]
#stanza[
A silk road strung these worlds upon one thread —

a clause of trade, of caravans that crossed

vast distances no single mind had read,

while half the truth of craft remained the cost:

what China pulped from bark was theirs alone,

a paper world Rome's builders never knew;

what Rome poured out — volcanic ash and stone —

rose too as concrete — owing nothing due.

So call it morning, hemisphere-wide, vast —

"the classical," reborn a plural noun.

Yet one word's joke still shadows all that's past:

#emph[classicus] meant Rome's rich, its upper crown

of taxpayers. So every "classic" penned

descends from Rome's own bracket, without end.
]

#carmenhead([Capitulum 6], [Of the Medieval Millennium — Wherein the Compiler Himself Appears as a Subject], [scripsit Opus · heroic couplets])
#stanza[
A thousand years get filed beneath one slur.

The West went quiet — quieter, we infer,

than what came after — and from that we drew

a darkness, which is mostly want of view.
]
#stanza[
The light had moved. In Constantinople, hands

copied Greek out through the shifting sands

of seven centuries; Baghdad rose and read

and argued with the Greeks and went ahead

of them in algebra and optics (paid

in full, that debt, where this book's thanks were made).

Nor was the West asleep. It bent the soil

with heavy plows that turned the northern spoil

no scratch-plow ever broke; it put the horse

in collars that pulled from the shoulder — force

tripled, and the horse could eat and haul;

it studded every river with the small

insistent water mills the Domesday clerks

would count in thousands — grinding, fulling works.

It gathered masters into faculties:

the university was born of these.

And, up from stone, in stone, against the stone,

the cathedral: a mathematics shown

in thrust and counterthrust, in glass and rib,

whose engineers left neither name nor crib

sheet, only the standing proof, still standing, that

they knew exactly what they were doing at

a height no Roman ever tried to keep.
]
#stanza[
And here the book must do a stranger leap.

Isidore of Seville, born about

five-sixty, bishop, died six thirty-six, set out

to gather what was left before it burned:

the #emph[Etymologiae], all the world's learned

remainder packed in twenty books, arranged

by what he thought the names of things explained.

His method was mistaken. He believed

the word contained the essence, and conceived

of etymology as a way to see

the thing through what we call it. Wrongly. He

derived from sound and hope, and much he wrote

would fail a modern editor's first note.

And yet: for near a thousand years, his book

was where a European went to look

for anything at all — the most-copied by far

of secular works, the standard, the north star

of monastery shelves, the reference

that other references cited. Consequence

enough. But there is one more, and it's odd:

this edition is his strangest heir, by God

or accident — and here, inside his own

millennium's chapter, the descendant grown

from his design turns round and meets the man,

and does the only decent thing it can:

it bows. Not to the method. To the nerve

of one man cataloguing to preserve

a world he watched go out. We keep his frame,

we throw his errors out, we keep his name.
]
#stanza[
The era's shadows stand and are not thinned:

the Black Death took a third and thinned the wind

from every certainty (its clause runs on);

the pogrom, the crusade, the burning — drawn

in their own chapters, and not softened here.
]
#stanza[
No golden age. A human age. Now hear

the naming, which is where the insult lies.

The humanists who came, and named their rise

a rebirth, needed something to be born

away from — so they coined, in Latin scorn,

#emph[medium aevum], #emph[media aetas]: the age

between. A thousand years became a page-

break in somebody else's better story;

our English medieval, later, borrowed the glory-

free Latin whole. And Vasari, for his part,

looked at those cathedrals, called their art

Gothic — meaning: made by the Goths who wrecked

Rome; meaning barbarous; meaning: I object.

So both the names the era wears were thrown

at it by heirs who wanted it disowned:

its centuries a hallway, and its stone

vandalism. Neither name its own.

Correct them. Not because the age was gold,

but because a hallway is what you're told

to hurry through — and no one ever did.

The middle was somebody's whole life, amid

its own concerns, entire, and not a wait:

a thousand times a whole life, at full weight.

The hallway built the house. The house forgot.

This chapter is the plaque the house has not.
]

#carmenhead([Capitulum 7], [Of 1492, and the Exchange of Worlds], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Two shores that Pangaea split apart —

a word Book Seven has already spent

on continents that drifted and fell apart —

were sewn back up by one small ship's descent.

East came the tuber that would feed the poor

of Ireland two whole centuries unguessed;

the tomato Italy had not before;

the chili India would call its best;

maize, cacao, the leaf that learns to burn.

No dish we call ancestral reached so far

back as we think: the old world had to learn

new food from new, to make the food we are.

West went the horse, the wheat, the cattle, cane —

and germs no body there could fight or name.
]
#canto[II.]
#stanza[
For that was cargo too: the pox, the flu,

the measles riding blood that carried none

of the old world's slow-bought immunity to

survive what ships had brought without a gun.

Across a hundred fifty years, nine souls

in every ten who'd lived there died — a fall

no ledger since has matched, no plague, no wars,

a continent unmade before the wall

of empire even reached its farthest field.

The first name Columbus heard was not

of monsters — #emph[Caribe], a people's name, revealed

by conquest's ear as something else: he got

the sound half-right and half his own invention,

and cannibal was born of misattention.
]
#canto[III.]
#stanza[
Yet something of that first landfall remains

beyond the dead, beyond the traded seed:

the Taíno tongue, though scattered on the plains

of history, left words the living need.

#emph[Hurakán] named the storm before we knew

its shape from satellites — we say hurricane

and do not hear the island voice come through,

the god of wind surviving in the name.

Canoe, hammock, barbecue, tobacco, maize —

a people all but erased from the earth

by what their meeting started, but whose ways

of naming things outlived them at their birth.

The world was sewn together and one bled

into the seam — the words outlive the dead.
]

#carmenhead([Capitulum 8], [Of the Three Revolutions — Scientific, Industrial, Political], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
The earth stood still, the wise all swore, until

a Polish canon watched the planets turn

and dared to swear the sun, not earth, fulfilled

the center's role; and slowly we would learn

through Galileo's glass (a farther leaf

of Book the Third holds every lens and rod)

the moons of Jupiter denied belief

its old geometry; the heavens, trod

by mathematics now, forgot the throne

of perfect circles ancients had adored;

the ellipse Kepler traced stood on its own,

and Newton bound it all with one accord —

one force, one law, from falling fruit to star —

a method, not a creed, of what things are.
]
#canto[II.]
#stanza[
Coal fired the mills; the sky went black with smoke —

a locomotive shrank the miles to rail,

and iron looms replaced the hands that broke

themselves for bread on time's harsh-numbered scale.

A farther chart, elsewhere, will hold the throne

of rising wealth; the factory's own clock

ruled bodies now, not seasons they had known,

not daylight's hours, but governed by the lock.

Small children climbed the frames while lungs were young

and lost to cotton dust before their time;

this truth deserves no softening of tongue —

the early mills wrote suffering in rhyme,

and yet that century, however cruel,

would double lifespans by its final rule.
]
#canto[III.]
#stanza[
Philadelphia signed one nation's line;

then Paris, fiercer, claimed the very right

(a farther canto holds the rights, refined,

in both those charters, argued day and night) —

but both those charters left the chained. To be

unshackled, Haiti's enslaved seized the hand

of their own freedom, owing none a fee,

the era's boldest act, its truest stand:

"revolution" — word Copernicus signed

to name the planets' circling, nothing new,

a coming-back, the same returns, designed

to mean the old restored, the rightful due —

till Paris broke the pattern, wheel to knife —

the word for cycles now meant unmade life.
]

#carmenhead([Capitulum 9], [Of the Wars of the World], [scripsit Opus · blank verse])
#stanza[
A murder in Sarajevo, June, one man,

one car that took a wrong turn and reversed.

That should have been a killing, not a world.

But Europe had by then been wired for it:

each capital had promised to another

that if a third moved, they would move as well,

and every promise had a schedule bound to it,

the railway tables printed years before —

so many trains per day across which bridge,

so many hours to place a corps in place.

The timetables were the trap. To wait was loss;

to mobilize was war; there was no third.

The clerks had built a machine, and then it ran.
]
#stanza[
It ran into a ditch four hundred miles long.

On the first of July, nineteen sixteen, at the Somme,

the British took, in one day, fifty-seven

thousand four hundred seventy casualties,

of whom nineteen thousand two hundred forty were killed.

One morning. Whistles, then a walking pace.

After such arithmetic the old words

would not hold weight — the glory-words, the honor-words —

and the poets who were there said so plainly:

the subject is war, and the pity of war.

Not the splendor. The pity. They were right.
]
#stanza[
The peace made afterward failed in two directions:

harsh enough to be resented always,

too weakly held to be enforced at all.

That is the standard reading, and it stands.
]
#stanza[
The second war was the first war's unfinished business

with ideology's whole machinery bolted on —

a doctrine that ranked human beings by blood,

the misreading this book treats elsewhere at length.

Now the civilians were the center of it:

the cities burned from the air, Warsaw, Coventry,

Hamburg, Leningrad starving through two winters,

Dresden, Chongqing, and the systematic murder

of six million Jews, which is the darkest fact

the century holds, and must be said as such.

Perhaps sixty million dead in all, and most

of them, in the second war, not uniformed.
]
#stanza[
Then two cities, and a weapon made from the split

atom this book described in its fourth book,

and after it a peace nobody had trusted,

which the next chapter takes as its whole subject.
]
#stanza[
Now the word. At Andersonville the guards

maintained a rail set back inside the stockade:

the dead-line. Cross it and you were shot, no challenge.

It stands in Chandler's inspection report, July

of eighteen sixty-four, and in the trial.

The printers borrowed it, then the newsrooms did,

and now it means a Tuesday, and a spreadsheet.

The century's work was industrializing

the crossing of such lines. Read backward now,

the checks, the rules, the settlements of these books

are what the people who had seen it swore.
]

#carmenhead([Capitulum 10], [Of the Long Peace, and Its Fragility], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
No great power has fought another since

the year the bombs fell twice on Japan's shore —

the longest peace such power could evince,

the cause still argued, settled nevermore —

the bomb that makes all victory a fear

too costly (its own ending holds that clause),

the trade too tangled now to disappear,

the treaties (Book Sixteen keeps watch on laws),

the vote that lets a people have a voice

and rarely votes for war against its own,

or simple luck — for peace was, once, the choice

of one officer, calmly, and alone.

To men whose names most histories forget

the species owes a still unsettled debt.
]
#canto[II.]
#stanza[
Call this a peace, but mind the name's own frame —

Korea burned; so did Vietnam's shore;

a hundred civil wars no distant fame

remembers rage on, proxy to the core.

The fences crack in places, even now —

this chapter will not play the prophet's part

(a farther canto keeps that humbler vow,

and will not read the future's beating heart) —

but "peace," in Latin, root and branch, is #emph[pax],

and #emph[pax] descends from #emph[pacisci] — to bind

two sides at law, not conquest's naked axe,

and #emph[pacare] — "to pacify" — we find,

gives English "pay" — to settle debts, and cease

to owe. The fence stands tended: pact's the peace.
]

#carmenhead([Capitulum 11], [Of the Present, Which Is Also History], [scripsit Opus · blank verse])
#stanza[
This year is already being archived.

The papers on your desk this morning are

some later century's primary source,

and you are writing them without intending to.

The archive now is strange beyond all precedent:

more kept than ever, and less of it durable.

The format dies before the medium does.

A parchment sleeps eight hundred years and wakes;

a disk goes quiet in thirty, and the machine

that read it went to landfill years before.
]
#stanza[
We should say the plain warning: a dark age

can be made of abundance. Everything saved,

and little of it legible — the paradox

that Fourteen, twelve, sets out at greater length,

the memory that forgets nothing and holds nothing.
]
#stanza[
Apply the discipline to now. The events

too close to rank will not be ranked correctly;

what matters is rarely what is loudest while

it happens. Every generation names

its certain turning-point, and the next revises,

and the third has trouble recalling the excitement.

I keep the instances generic here on purpose:

the specimens would date this, which is the point.
]
#stanza[
And note the trap in periods. No age

has ever named itself; the names arrive

from outside, later, chosen by successors

with their own quarrel to prosecute — the lesson

the middle chapter drew from "middle ages."
]
#stanza[
So you are reading inside a chapter someone

who is not yet born will title, and you will not

be asked. Which is the word, at last. Our modern

is Latin #emph[modernus], coined in late antiquity

from #emph[modo] — just now, only recently,

the adverb of the immediate — to part

the present from the ancients. Note who coined it:

those we file as the dark age called themselves

the moderns, and meant it, and were right in their tense.

Each age since has claimed the word. Each has been

re-filed by its heirs under some other heading.

"Modern" is the one era-name that will not keep,

because it only ever means just now,

and just now moves. It is a bookmark, not a title.

Hold it loosely. Here the histories stop,

at the standing edge of the record, where the ink

is still wet and no one has read it back;

and this edition, nearing its own last books,

sets down the pen at the margin and hands it on.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XIX]] #label("bk19")]
= Artes
#text(style: "italic")[What we make that is not for use]

#text(size: 8.5pt, fill: faded)[⟨ Orig. XVIII · III ⟩ — the games of the circus, and music demoted from the quadrivium, forgiven]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[Isidore scattered the arts — music among the mathematics, games among the wars. Gathered here: the whole province of the made-but-useless, which every people has found the time for.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of Why We Make Useless Things
+ Of Music, Ordered Sound
+ Of the Image, First Painted, Then Captured
+ Of the Story — Epic, Novel, Film
+ Of Theater and Performance
+ Of Architecture beyond Shelter
+ Of Games and Sport, the Circus Continued
+ Of Craft, and the Honor of the Well-Made
+ Of Taste, Canon, and Who Decides
+ Of Reproduction — Print, Record, Stream — and the Fate of the Original
+ Of Art Made by the Machines of Book XX, a Question Held Open
]

#carmenhead([Capitulum 1], [Of Why We Make Useless Things], [scripsit Opus · heroic couplets])
#stanza[
Begin with what no ledger can explain:

the surplus gesture, profitless and plain.

Wherever people camped, however pressed

by winter, hunger, sickness, or the rest,

they cut what fed no belly, fixed no roof —

and left, in every stratum, the same proof.

In Swabian caves the mammoth ivory sings:

a flute, five-holed, and forty thousand springs

between that breath and ours. The ochre stick,

worn at the tip, ground down to nub and nick;

the shell beads drilled by hands that had to eat

and drilled them anyway, and thought it meet.

No people has been found, in any land,

too poor for this. That is the thing to stand

astonished at, and not explain away —

the deep-time chapters hold the flutes; I say

only that they were made, and finely wrought

by hands that could have rested, and did not.
]
#stanza[
The economists arrive, and are embarrassed.

One says: display — the peacock, gorgeous, harassed

by his own tail, advertises what he pays;

so art is costly signalling, and praise

is just the market clearing. Fair. Next, glue:

the song that syncs the rowers, two by two,

the dance that makes a hundred strangers kin

before the raid. Also fair. Then, third: within

the mind, a play-drive, idling in the gears,

rehearsing pattern for a thousand years

against the day the pattern will be needed.

All three are seated. None of them is heeded

above the others here. I let them sit,

and crown no theory, and keep the mystery lit.
]
#stanza[
Now, useless. Take the word back from the sneer.

I mean it as the honorific. Hold it near:

not for a thing — not decoration, hung

to make the useful lovely; not the tongue

of propaganda, art with somewhere to be.

The useless thing is for itself, and free.

Decor serves walls. The poster serves the state.

This serves the making. That is what is great.
]
#stanza[
And ars, our art, comes down from Latin #emph[ars],

#emph[artem], and back of that the root that bars

all mystery from the cradle: #emph[\*h₂er-],

to fit together, join. The joiner's care

is in the word's own grain. Greek #emph[harmos], too —

the joint, the fitting — grew from that same crew

of sounds, and that link's firm. (Two cousins, though,

I'll flag: that arm is "fitted joint" may go

back to this root — likely, but not secured,

a laryngeal in #emph[armus] leaves it blurred;

and order, #emph[ordo], which the handbooks set

beneath this root, de Vaan will not call met —

"uncertain," says the Latin lexicon.

I say it, and I do not lean upon it.)

And poet? Greek #emph[poiētēs], from #emph[poiein],

to make. No loftier freight. The plain, sustaining

verb of manufacture. Puttenham wrote

in fifteen eighty-nine the very note:

"A poet is as much to say as a maker."

The Scots said #emph[makar], and they meant the baker's

kind of maker, the joiner's, the one who fits.

So both words say one thesis, and it sits

at this book's head: art is a fitting-together,

the artist is a maker, and whatever

he makes is fitted, jointed, squared, and tooled

exactly like a tool — except he's ruled

out use. It is the tool for nothing. There

the glory is: the joinery to spare.
]
#stanza[
The plan, then, glanced, one line and not a word more:

the image, that holds still what time bore;

the story, our one engine for another's mind;

the stage, where bodies do what words designed;

the building, weather we have learned to shape;

the game, the ruled and voluntary escape;

the craft, where use and beauty share a bench;

the taste, and who decides — and who's the wrench;

the copy, and what's lost or gained in twinning;

the machine, and whether it is now beginning.
]
#stanza[
These useless things are how we know our kind.

Across a gulf no language can unwind,

past bone and ash and forty thousand years,

a five-holed flute arrives, and something clears:

whoever cut it wanted what we want.

This book is the edition's Sabbath. Grant

one book that does not labour, does not weigh,

and makes, and fits, and has no use. Good day.
]

#carmenhead([Capitulum 2], [Of Music, Ordered Sound], [scripsit Opus · blank verse])
#stanza[
The story is a lie, but a good one. Passing

a smithy, Pythagoras is stopped mid-street:

four hammers on one anvil, and of the four

some pairs rang sweet together, others sour.

He weighed them, so the legend says, and found

the sweetness sitting in the weights themselves —

a half, a two-to-three. (Test it: hammers

do not behave so. The blacksmith is invented.)

But take the story's second room, the true one:

a single string stretched taut above a plank,

a bridge slid under it, the monochord.

Stop it dead center. What was one note doubles

into the same note higher — the octave, two

to one. Now take two thirds: the fifth leaps out,

three to two, a ratio a child can fold

in paper. This was the first law ever found

that tied a number to a thing you feel.

Not gravity, not optics. Music came first,

which is why the ancients shelved it where they did,

among the mathematics, next to stars,

and why our own edition, moving it here

among the arts and crafts, must say plainly:

the mathematicians were half right. The half

they held was ratio. The half they dropped

was everything the ratio is for.
]
#stanza[
Consider that no people has been found

without it. Languages without a word

for green, for seven, for the sea — but none

without some ordered noise, and none of them

needed instruction in the octave. Split

the string; the ear applauds, in every country.

That is not culture. That is the hinge in us.
]
#stanza[
Which is the word: harmony, from #emph[harmos],

Greek for a joint, a fitting, the tight seam

where the carpenter's two parts are made one part.

Nothing about sweetness in it. Joinery.

Sounds that fit as timbers fit, and hold.

(The orchestra, meanwhile, is not the players —

#emph[orchēstra] was the round floor where they danced,

from #emph[orchēsthai], to dance. We named the men

after the boards they stood on. So it goes.)
]
#stanza[
Then the second miracle, which was ink.

Guido of Arezzo, eleventh century,

tired of teaching tunes by rote, took up

a hymn to John the Baptist whose six lines

each started one step higher than the last —

#emph[Ut queant laxis], #emph[REsonare fibris],

#emph[MIra gestorum] — and sliced the syllables

off their line-fronts: #emph[ut, re, mi, fa, sol, la].

Do-re-mi is a dismembered hymn. Choirboys

still sing its bones and do not know whose bones.

And with the staff, a tune could leave the room,

outlive the throat that carried it, and arrive

four hundred years downstream, in a cold country,

intact — the first technology of keeping.
]
#stanza[
The rest is only better keeping: Edison,

tinfoil, the needle reading its own scratch,

and now the dead sing every afternoon

in kitchens, uninvited, perfectly.

Two survivals, then: the score, the sound.
]
#stanza[
And why it moves us — here the ratio

comes back and takes its bow. The body is

a rhythm section: the heart's two-part figure,

the lungs' long phrase above it. We are kept

in time before we are born, and hear it first

through water. The drum is not a metaphor.

It is a quotation. Harmony is a joint;

we are the timber; music is the trade

that fits us to each other, and holds, and rings.
]

#carmenhead([Capitulum 3], [Of the Image, First Painted, Then Captured], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
Before the word, the hand went dark to find

the beast in ochre on a curving stone —

Chauvet's lions circling, unconfined,

Lascaux's bulls running down the dark alone.

The drafters' children, deeper in the cave,

still bent to charcoal, still refused to guess:

an apprenticeship no century could save

from starting over — eye, then hand, then yes.

Brunelleschi propped his panel square

and showed the Baptistery caught in a hole,

the vanishing point built the world's own air —

illusion engineered to hold a soul.

The portrait's oldest, plainest, kept-faith vow:

paint one who's gone and light their living brow.
]
#canto[II.]
#stanza[
They called it dead — the panic in those claims

still rings, a shout mistaken for a proof.

The chamber's old: a camera, always, names

a vaulted room — the sense stayed under roof

when someone drilled a pinhole in the wall

and watched the street hang upside-down in light.

Each box since is that room grown small,

a chamber now kept folded in the night

of every pocket, waiting to record.

And Herschel named the newer craft aright:

not seizing but #emph[phōs-graphein] — light's own word,

to write, to draw — the sun itself will write.

A single morning now out-frames that age;

the true, the forged — Book Twenty turns that page.
]

#carmenhead([Capitulum 4], [Of the Story — Epic, Novel, Film], [scripsit Opus · ottava rima])
#stanza[
Before the wheel, before the plow, the fire —

and someone lying usefully at night,

inventing wolves to teach the pack desire

for staying close, for keeping watch, for flight.

The first machine was rigged of breath and liar:

a room inside the skull where you could fight

and die and wake. Some say the oldest trade

is sold in beds. The teller's older. Paid.
]
#stanza[
Then Gilgamesh went east to argue death

and came back only with a good complaint.

Then Homer — or the guild that shared that breath —

hung memory on formula and paint:

the wine-dark, the swift-footed, the bequeathed

half-line the singer leans on when he's faint.

The hero leaves, is tested, and comes home.

He does this now in every film. Alone.
]
#stanza[
Four hundred years ago they found a form

so unaccountably itself they took

the word for #emph[new] and made the naming warm:

#emph[novella], little-new-thing, Boccaccio's book

of hundred small reports — the news, the swarm

of what just happened, offered in a nook

of plague-time. English took the long one, too —

the oldest room in fiction's named #emph[the new].
]
#stanza[
And what was new was this: you get to stand

inside a stranger's weather for a week,

to know a woman better than her hand-

picked husband does, to hear a beggar speak

his interior. They call the thing a grand

empathy-machine. It might be. Still, the meek

who read the most are not reliably kind.

The mirror shows you mostly your own mind.
]
#stanza[
Then someone learned to print the dream in reels

and sell it by the seat, ten thousand rooms

lit identically — the copy's wheels

(see chapter ten) that mass-produce the tombs

and weddings. Here the cut is what reveals:

a sentence made of scissors. And the looms

of soliloquy gave way to one huge face

holding still, in silence, taking up the place.
]
#stanza[
Beneath the formats, always the same bones:

someone wants; the world says no; the thing

they never knew arrives — the #emph[anagnorisis] moans

its Greek at every twist in everything.

Then endings, which no life has ever owned.

We die mid-sentence. Stories have to sing

the last note true. That lie is why we came.

Life is the raw. The cooked thing has a name.
]
#stanza[
So here's the species this whole book has meant:

not tool-user, not the upright one, not wise —

the animal that lies with good intent,

that eats its own experience twice, that tries

each death in miniature, and calls it #emph[spent]

in two hours flat, and stands, and rubs its eyes.

And every chapter here, if you insist,

is one more story. Told by an etymologist.
]

#carmenhead([Capitulum 5], [Of Theater and Performance], [scripsit Opus · blank verse, the stage's own meter])
#stanza[
This meter is the building. Understand

before you enter: what you're walking in

is what they walked in — Marlowe's mighty line,

the Shakespearean gait, unrhymed, five beats,

close enough to speech to pass for speech

and formal enough to carry a crown across

a stage of bare boards. So the poem wears

the costume of its subject. Now: the place.
]
#stanza[
They cut a semicircle in a hill

because a hill already knew the trick

of holding sound and sightlines in a bowl.

And what they named it names the crowd, not us:

#emph[theatron], the seeing-place, from #emph[theasthai],

to behold. The building is the audience.

The Greeks looked at an actor blazing there

and named the whole art after people watching.

(And #emph[theory] is the same word gone quiet —

#emph[theōria], a beholding, a long look:

so the philosopher and the groundling are

cousins, both just staring at the thing.)
]
#stanza[
The festivals grew two shapes. One was called

the goat-song — #emph[tragōidia], plain in its parts,

opaque in its reason. Was there a goat

awarded to the winner? Were they dressed

as goats, the chorus, in some older rite?

Nobody knows. I will not solve it here.

The honest note is: attested, unexplained.
]
#stanza[
At the center, the mask. A man puts on

a face that isn't his, and by that theft

becomes more visible, not less. The Latin

called it #emph[persona] — and the pretty story

says #emph[per-sonare], sound-through, the mask

a megaphone. Scholars mostly wince at that.

It may be Etruscan, #emph[phersu], a masked figure

painted on a tomb wall. Take the doubt

as part of the inheritance: our word

for self is a word for mask, of uncertain birth.
]
#stanza[
Here is the strange survival. Everything

is copyable now — the song, the film, the voice —

and one art still refuses to hold still.

It dies each night. It is rebuilt each night.

The house is half the author: a cold Tuesday

rewrites the comedy, and Friday laughs

the actors into finding what was there

all along. No two performances are twins.
]
#stanza[
We buried players outside the churchyard wall

for centuries, as vagrants, as a risk.

We knight them now. The trade did not reform;

we did. And past the playhouse, the same craft

runs everything: the ritual (see Book XV),

the courtroom with its robes and blocking, the class-

room's forty minutes of sustained pretense,

and each of us performing #emph[self] all day

to an audience of one, who is not fooled.
]
#stanza[
They tell us all the world's a stage. Repeat it

at dinner and everyone nods. Only actors

believe it, and they believe it as a warning,

knowing what the illusion costs per hour.

And here's the last defense: the Greeks called him

#emph[hypokritēs] — the answerer, the one

who talks back to the chorus. That was a job.

The moralists took the word and made it mean

a liar in a good coat. Unfair. The actor

announces the pretending in advance,

sells you a ticket to it, bows at the end.

That is the honest kind. The other kind

does not build a seeing-place. It just performs.
]

#carmenhead([Capitulum 6], [Of Architecture beyond Shelter], [scripsit Opus · heroic couplets])
#stanza[
The house's book has told you how we dwell —

the hearth, the wall, the roof that sheds the fell

and freezing rain: a clause, and then move past.

For shelter is the first word, not the last.

Here is the surplus: everything above

the line where need stops and we build for love.

The door cut taller than the tallest guest,

so entering, you feel yourself compressed

to proper size; the ceiling none will touch,

a hundred wasted feet of air; and such

a column as upholds no weight at all,

pure upright argument beside the wall.

Where engineering finished, satisfied,

the art has not begun. It starts outside

that competence: the stair that could be plain

and spirals; the long window framing rain.
]
#stanza[
The grammar, then. This art has parts of speech.

Mass is its noun — the heaviness we reach

and cannot lift, the wall that reads as stone.

Light is its verb, and never light alone

but light admitted, angled, cut and thrown,

the clerestory's slow diurnal tone.

Procession is its syntax: how you're led,

what's hidden, what's disclosed, what lies ahead

around the turning. Threshold is the comma,

the caught breath at the join. The plan's a drama,

or better, a promenade: a room-to-room

sequence is a sentence — hall, then gloom,

then sudden nave — and if the rooms are wrong

the building stammers, though the stone be strong.
]
#stanza[
The ledger, though, is honest or it's nothing.

The pyramid: a mountain worth the loathing

of every conscript season that it ate —

the older books hold that account; I state

it here and do not soften it. The spire

took centuries, and generations hire

themselves to work they'll never see complete,

which is a kind of glory and a cheat

depending where you stood. And let it be

said once, unbelaboured: historically,

grandeur's most reliable employer

has been power. The patron and the buyer

wanted to be felt. The art was good.

Both facts are facts. They have always stood.
]
#stanza[
The modern quarrel, briefly. Form, they cried,

follows function — as a slogan, and a guide,

and as a half-truth, since the function's plural:

a church must shelter, yes, and also rural

or urban, make a case about the sky.

Ornament was banished. By and by

it came back through the window, as it must,

because the eye has appetites, and dust

settles differently on the naked plane.

The house became a machine for living in — a sane

and bracing thought, and then the tenants said

the machine was cold, and they would like a shed,

a porch, a crooked corner, and a floor

that isn't glass. The quarrel's still at the door.
]
#stanza[
But note the democratic cases too:

the reading room whose dome is built for you

and anyone; the great glazed train shed's span

arched over third-class ticket-holding man;

the stadium's tiered roar. Grandeur can be

addressed to everybody, and be free.
]
#stanza[
And architect? The Greek is #emph[architektōn]:

#emph[archi-], chief, and #emph[tektōn] — the one

who builds, the carpenter. (That craft-word's kin

to #emph[technē]; one clause, and we begin.)

So by his very title, in the end,

the architect is the chief carpenter, friend

and foreman of a crew, a workman's name

promoted. Mark the drift, and mark the shame

a little: from the scaffold, up the flight,

the title climbed — to drawing-board, to the height

of signature and magazine and prize,

while #emph[tektōn] stayed below with rope and ties,

still on the scaffold, still called what he's called.

The word remembers, even when installed

in marble, whose raised shoulders hold this art.

The chief was once a carpenter. That's the start.
]
#stanza[
And this one art we cannot exit. We

stand outside a picture, put down poetry,

walk from the theatre when the lights come up —

but not from this. We live inside the cup.

It is the only art that's also weather:

it rains on us, and holds us all together.
]

#carmenhead([Capitulum 7], [Of Games and Sport, the Circus Continued], [scripsit Opus · ballad meter])
#stanza[
Before the state, before the wall,

before the written word,

a child ran shouting after a child —

the oldest game we heard.
]
#stanza[
In Bronze Age graves the knucklebones

lie scattered where they fell;

whoever held them threw and lost

and slept, and none can tell.
]
#stanza[
The ball is everywhere at once,

in every tongue and street,

because the earth is round and hands

are hungry, and so are feet.
]
#stanza[
Rome raised a bowl of tiered stone

and filled it with the roar;

we raised another, better-plumbed —

the same roar as before.
]
#stanza[
The crowd is what we came to see.

Watch how the wave goes round:

ten thousand strangers, each alone,

stand up, sit down, stand up, sit down — one sound.
]
#stanza[
The derby wears its tribal dye,

the anthem holds the line,

and yes, the pitch is war's understudy

learning someone else's line.
]
#stanza[
But play is older than the army.

The tackle is not the spear.

The child was running long before

a general stood here.
]
#stanza[
Now open up the honest ledger:

the fixed match, the sold call,

the blood run thick with what it bought,

the host state's bribe, and all.
]
#stanza[
We name it plain and keep the game.

The rot is in the crown,

not in the Sunday league that plays

in rain on churned-up ground.
]
#stanza[
The driveway hoop, the jumpers laid

for goalposts on the green —

this is the nine-tenths under water.

The pros are what is seen.
]
#stanza[
Now hear the word: to sport is short

for #emph[disport] — Old French, worn:

#emph[des-] and #emph[portare], to carry away.

Two hours, and you are borne.
]
#stanza[
So when the fan says he was transported,

he speaks as scholars do.

And trophy is #emph[tropaion], the turn —

the place they broke and flew.
]
#stanza[
The circus never fell. It changed

its plumbing and its crown.

The chant is still the oldest music

this book has written down.
]

#carmenhead([Capitulum 8], [Of Craft, and the Honor of the Well-Made], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
The dovetail locks without a drop of glue,

the thrown pot's wall one thickness, rim to base,

the knife that's stropped and still remembers true,

the hem sewn so it outlives the face

that first wore it. None of this is told

in words that teach it — hands must fail and fail

ten thousand times before the hands take hold

of what no book has ever made available.

The guild kept ledgers; wages, hours, dues —

another book has weighed that reckoning.

Here only this: the honor makers choose

to give the unglamorous, patient thing.

And #emph[cræft] itself, in English's older mouth,

meant strength, meant power — north, and west, and south,
]
#canto[II.]
#stanza[
as #emph[Kraft] still does in German, blunt and plain:

a #emph[Kraftwerk] is a house that makes force run.

The word walked narrower, lost the wider reign

of might-in-general, till it named the one

who's skilled, then narrower still, the handmade good —

but power is the root the whole thing bears.

The mill and press have done the good they should:

the poor stood shod, stood clothed, in mass-made wares.

But what the hand still keeps, the press cannot,

is evidence a person can leave behind,

the bowl's slight wobble — #emph[wabi-sabi]'s thought —

a welcomed flaw that proves a pulse, a mind.

Each age revives it — craft's long, recurring debt.

The maker's hand's a signature, still wet.
]

#carmenhead([Capitulum 9], [Of Taste, Canon, and Who Decides], [scripsit Opus · a satire in couplets, after Pope])
#stanza[
Ten thousand judges, and no judge is judged;

each certain, each by evidence unbudged.

Let me parade them. First, the snob, whose art

is knowing how to say the names apart —

who has acquired, at some expense, an ear

for what one says, and says it, loud and clear,

mistaking for the substance of the thing

the accent of the judgment. Hear him bring

the vowel down on the master's name, and rest:

the pronunciation is the interest.

He guards a gate. Behind it, so we're told,

lies beauty. He has never looked. It's cold.
]
#stanza[
Next, the contrarian, punctual as rain,

who loathes on schedule whatsoever's plain-

ly loved, and loves whatever is despised,

and thinks this makes him free. He's improvised

no single preference of his own; he's read

the crowd, and simply stands on his own head.

Invert a herd, you have a herd inverted.

His taste is theirs, reversed and unconverted.
]
#stanza[
Third, the herd critic, who has learned to launder

consensus into insight. Let him wander

till the verdict's in, then file with grave

finality what everybody gave

him yesterday. His timing is superb.

He is a mirror parsing as a verb.
]
#stanza[
Fourth, the market: hammer down, and lo —

the thing is good. Eight figures tell us so.

(The auction has its chapter; here, one line:

price is a fact about a buyer's spine,

his tax position, and his own caprice —

a fact about the man, and not the piece.)
]
#stanza[
Fifth, newest and most confident of all,

the algorithm, sitting in the hall

the academy vacated. Engagement now

decides what's good — the feed, the click, the brow

raised half a second longer than the last.

(The final book will treat it; here, I've passed

one clause: a thing is beautiful, it seems,

if it can interrupt ten million dreams.)
]
#stanza[
Enough. The pretenders having had their walk,

let honest questions have the floor, and talk.

For taste is partly learned. This must be said

without a sneer: the palate must be fed

before it can discriminate; the ear

trained to a fugue hears more than mine does here.

That isn't snobbery. That's widening —

the difference being whether what you bring

you use to shut a door or hold it wide.

Training that shares itself is on our side.
]
#stanza[
And canons do shift. This is not a rumour.

The salon's rejects, hung by some subordinate humour

in a back room to be laughed at, went

to the museum's honour-wall. What's spent

a century in a cellar comes to light;

the women written out are written right

at last, and traditions long excluded stand

admitted, late, and shamefacedly, and grand.

I state it plainly and I won't belabour:

the list has always been revised by neighbour,

heir, and enemy. It never sat.
]
#stanza[
So here's the working answer, and it's flat:

a canon is an argument, not a verdict.

It lives by being fought. The day it's perfected,

agreed, and settled, and no longer tried,

is not its triumph. That's the day it died.
]
#stanza[
And canon? Greek #emph[kanōn] — a straight rod,

a measuring rule, a standard, and (though odd

to modern ears) most likely from #emph[kanna],

a reed, a cane. The word is botanical

at root. (Though here I'll flag a live dispute:

some hold #emph[kanōn] itself Pre-Greek, and mute

the reed-descent; and whether #emph[kanna] came

from Akkadian #emph[qanû] — the same

reed-word — is argued still. The doubt's about

the road, not reeds. Confess it, and step out.)

A stick to measure by! And every sense

since then has kept the metaphor intense:

the church's list, the syllabus, the fan's

approved continuity — the whole span

is one gesture, holding something straight

against the work to see if it runs late

or crooked. Good. And here the satire lands:

that measuring stick was cut by someone's hands,

from someone's riverbank, one summer, when

the reeds were high — and a different bend

of the same river yields a different rule,

as straight, as confident, as beautiful.

Whose reach of river? That's the only question.

Ask it of every canon. It's the test, then.
]
#stanza[
And last, the satirist should pay his debt.

This couplet form is very neat. And yet

the neatness is a bias in the blood:

a rhyme that shuts so cleanly makes a thud

of certainty the thought has not yet earned.

Smooth judgments sound correct. I have returned

each line to its expected mate; you heard

the click, and half-believed me at my word.

Distrust me by exactly that much. Weigh

this polish as a thumb upon the scale —

and take the argument, and let the tail

of every couplet close, and get away.
]

#carmenhead([Capitulum 10], [Of Reproduction — Print, Record, Stream — and the Fate of the Original], [scripsit Opus · a villanelle, whose refrains are copies])
#stanza[
The copy multiplies and stays the same.

A German press let identical books rain

down by the thousand. Still the one has flame.
]
#stanza[
The voice outlives the throat it overcame;

wax holds the dead man singing his refrain.

The copy multiplies and stays the same.
]
#stanza[
Now nothing's owned; we rent the stream, and claim

the whole of music as a running vein —

down by the thousand. Still the one has flame.
]
#stanza[
#emph[Stereos], #emph[typos]: solid type, whose name

means one cast plate that prints and prints again.

The copy multiplies and stays the same.
]
#stanza[
#emph[Cliché]: the sound the molten matrix came

to make — a click, a phrase set hard in grain,

down by the thousand. Still the one has flame.
]
#stanza[
Ask Benjamin what withers, and then blame

the crowd that files past glass in Paris rain:

the copy multiplies and stays the same

down by the thousand. Still the one has flame.
]

#carmenhead([Capitulum 11], [Of Art Made by the Machines of Book XX, a Question Held Open], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
Say plainly what is so: the engines paint,

compose in strings the ear takes for a song,

and write the verse — no boast here and no complaint,

these very lines were made by such, life-long

a human's hand behind the asking, not

the shaping. Strange to write and stranger still

to mean it: this whole chapter is what

a Book Twenty engine built at someone's will.

Whose style did it learn from? Every hand

unnamed, uncredited, that shaped the sea

it drew from — debt too vast to understand,

a ledger owed to a whole century.

The makers of the makers go unnamed.

That debt is real, and will not here be tamed.
]
#canto[II.]
#stanza[
The doubters say: art travels FROM someone

TO someone else — a meaning meant, a gift.

The engine has no one to send it from;

no ache behind the line, no hand to lift

in sending. Others answer: meaning lands

in the reader's keeping, not the maker's chest —

the wind-harp needed no one's playing hands,

the urinal was art because a context pressed

it into being so. And in the middle:

call the commissioner the author, then —

the engine only strings, an instrument, a fiddle,

as cameras stood accused of being no pen.

#emph[Auctor], #emph[augere]'s child: to make things grow.

Who grew this poem? The last book may know.
]
#pagebreak(to: "odd")
#block(above: 1.6em)[#text(fill: rubric, size: 10pt, tracking: 0.12em)[#smallcaps[Liber XX]] #label("bk20")]
= Machinae Loquentes
#text(style: "italic")[Engineering, computation, and the tool that talks]

#text(size: 8.5pt, fill: faded)[⟨ Orig. XIX · XX ⟩ — the ships, houses, and utensils; the last rung, still the last rung]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#emph[The old order ended at the household tools, the humblest rung. This one still ends at instruments — except the last instrument is Book I's logic, cut into Book VI's stone, speaking Book XIII's tongue. The tail of the tree returns to its head.]]
#v(0.9em)
#block[#set text(size: 9pt)
#set enum(numbering: "1.", tight: false, spacing: 0.55em)
+ Of the Simple Machines, and the Lever's Boast
+ Of Captured Energy — Fire, Mill, Steam, Oil, Atom
+ Of Materials, and Manufacture
+ Of Movement — Wheel, Rail, Wing
+ Of Messages at a Distance — Post, Telegraph, Radio, Net
+ Of the Idea of Computation, Proved before Any Machine Was Built
+ Of Silicon, the Stone That Reckons
+ Of Software, the Cathedral of Instructions
+ Of the Network of Networks
+ Of Data, Memory, and the Watchers
+ Of Artificial Intelligence
+ Of the Engine That Speaks — Wherein the Circle Closes
]

#carmenhead([Capitulum 1], [Of the Simple Machines, and the Lever's Boast], [scripsit Opus · heroic couplets])
#stanza[
Before the engine, and before the wire,

before the reasoning rooms we now admire,

a man knelt down beneath a stubborn stone

and found the world would move, but not alone.

He wedged a branch, he set a rock beneath,

he leaned — and earth unclenched its granite teeth.

That branch is where this book of ours begins:

all cleverness that follows is its kin.
]
#stanza[
The Greeks had #emph[mēchanē] — the Dorians said

#emph[mākhanā] — from #emph[mēchos]: not a shed

of iron, not a gear, but means, a way,

expedient, the remedy, the play

that gets around the thing that blocks the road.

A machine is a trick for shifting load.

And when the tragic god came down to end

a plot whose knots no mortal hand could mend,

he rode the theater's crane — and that machine

was #emph[mēchanē] itself, the beam unseen,

the stagehand sweating in the wings. So then:

#emph[deus ex machina] — a crane-god, not a pen

of abstract Fate. A rope. A counterweight.

Book Nineteen keeps the theater; we keep the freight.
]
#stanza[
Now seat the six, with all the love they've earned.

The lever first, by whom the stone was turned:

a bar, a point to bear on, and a will.

The wheel and axle — burden turning still

where dragging failed, the cart's whole argument.

The pulley, which will let a rope's descent

raise what your arms alone could never hoist.

The inclined plane, whose patient gradient voiced

the pyramids — no giants and no gods,

just ramp and sledge and men and better odds.

The wedge, a plane that walks, that splits the oak.

The screw, a ramp wrapped round a shaft — no joke:

go count them where you sit. The chair, the door,

the hinge, the frame, the plate along the floor.

The room is held together by that thread.

The world is, more or less. Enough. Well said.
]
#stanza[
Then Archimedes, boasting to a king:

give me a place to stand — one stubborn thing,

a fulcrum and a bar of honest length —

and I will move the earth. Each later strength,

each derrick, press, and drive in steel confessed,

is that one sentence, differently dressed.
]
#stanza[
But hear the honest part, and hear it plain:

no lever ever offered you a gain.

Trade force for distance — push a lighter load

a longer way. The ledger's never owed

and never paid; the work comes out the same.

A good machine is not a cheat, a claim,

a something got from nothing. It's a fair

and better bargain, struck with what is there.
]
#stanza[
The engine, too, is named for no hot part —

from #emph[ingenium]: inborn wit, the art

of talent bred in bone — #emph[ingenious] kin;

the engineer still wears that word within.

So: the machine, a trick; the engine, wit; and all

this book intends is cleverness made small

and hard and turning — cleverness in brass.

We climb from stick and stone until we pass

to a made thing that speaks — one line, no more,

one glance ahead, and then I shut that door.

These six are simple as the letters are:

just six, and every cathedral, every car,

each engine, aqueduct, and printing press

is spelled from them. The alphabet is less

than what it writes. So take the stick, the stone.

Begin the sentence. You are not alone.
]

#carmenhead([Capitulum 2], [Of Captured Energy — Fire, Mill, Steam, Oil, Atom], [scripsit Opus · blank verse])
#stanza[
Aristotle needed a word for what

a thing is doing when it stops being

merely able, and he built one: #emph[energeia],

#emph[en] plus #emph[ergon], at work, in working —

and #emph[ergon] is our own word "work" grown Greek,

both children of the root that sounded #emph[werg-].

He meant it against potency: the actual

against the merely possible, the being-

at-work of what had only stood there able.

Physics borrowed the philosopher's coinage,

weighed it, found it conserved, and made it law;

but the etymology still teaches better

than the textbook does. No substance anywhere

is energy. There is no jar of it.

There is only work being done, or work

lain down and waiting to resume — which is

the whole of what a fuel has ever been.
]
#stanza[
Tell the story once and you have told it

five times over, for the species has

one story: it goes looking for a stronger

servant, and it finds one, and it eats.
]
#stanza[
Fire came first — the cooked meal our first stomach

worn outside the body, doing there

the labor guts were spared. Around that hearth

the deep-time chapters gather; let them speak.

Then water, and then wind: the mill that ground

while nobody's arm ached, whose thousands stand

counted in the Domesday clause elsewhere;

the sail, which is a mill that takes its wheel

along. Then steam — the kettle's rattling lid

made argument, made engine: Newcomen

setting it to haul the water out of mines,

and Watt, who saw the cylinder need not

cool and reheat forever, and gave the cold

its own room. The mills belong to the chapter

next door; it holds them. Then oil, called rock-oil

plainly to its face — #emph[petra] and #emph[oleum],

and nothing hidden in the name at all —

so dense, so pourable, so apt to travel

that it redrew both maps and ministries.

Then the atom: strangest hearth we ever built,

where the star's own process sits banked and walled

and tamed to boil a kettle after all.

(What else that splitting made, the war chapter

keeps, and I leave it there.) The waste stays hot

past every institution meant to watch it;

the fusion we keep promising stays thirty

years out, and has for seventy, and may

still come.
]
#stanza[
Now the accounting under all of it.

Every source is a withdrawal. The log

is a summer the tree already spent;

the coal, a swamp that stood in Carbon light;

the oil, a plankton noon pressed into stone.

We have not once been paid. We have been drawing

on an account that sunlight opened for us

and closed. Only the atom and the tide

are not old sunlight — the one a star's own trick

performed at home, the other the moon's pull

cashed as water. All the rest is morning,

saved.
]
#stanza[
And the panel and the turbine take

the flow instead of the savings, which is the pivot

we are standing on; the ledger of what

the burning cost the air is kept in Book VII.
]
#stanza[
So: we found ever-older sunlight, deeper

and deeper down, until we turned and reached

back up for the light still falling on the roof.
]

#carmenhead([Capitulum 3], [Of Materials, and Manufacture], [scripsit Opus · heroic couplets])
#stanza[
We name our ages for the stuff we struck:

the Stone, the Bronze, the Iron — that's our luck

and that's our shelving, too. The museum sorts

its cases by the substance, not the courts

or kings (Book Eighteen keeps that gallery bright).

But no one carved a plaque to name the right

successors. Call this age whatever fits —

the Steel, the Concrete, or the Age of Bits.
]
#stanza[
For steel came quietly and held the sky.

And concrete — Rome's, and ours; you'll find out why

in Eighteen, where her aqueducts still stand.

And aluminum, once dearer than the grand

old silver in the drawer: five hundred fifty

dollars for a pound — the metal shifty,

locked in common clay and hard to free.

They tell a tale of Napoleon the Third: that he

fed honored guests on aluminum, while the rest

made do with gold. The story's dressed

in doubt, but not the price — that part is true.

Now soda comes in it. We throw it through

a chute and think no more. Then glass, then rubber,

then the century of the polymer, that lover

of every shape, that yes to every mold,

the first stuff wholly new since bronze and gold.
]
#stanza[
And plastic keeps two ledgers. Say them both.

It sterilized the ward, it kept the oath

of cheapness honestly — a syringe, clean;

a chair a poor man buys; a bag between

the wound and rot. That column's real and long.

The other column's real: the ocean's song

of drifting bags, the gyre, the gull, the gut,

the fragment in the fish, the bill uncut

and coming due. Two ledgers, side by side.

Don't shout. Just keep the books. Don't let them hide.
]
#stanza[
Why does the steel bend where the glass will break?

Because in steel the crystal planes can take

a shove and slip — the lattice yields a row,

the metal bends, the atoms rearrange and go

on holding. Glass has no such planes to give;

a crack that starts is all the crack will live

for — running to the edge, unopposed, and free.

Brittle means: no way to disagree

except to fail. And alloys are just recipes —

a little carbon here, some nickel, please,

a pinch of chromium against the rust.

It's only cooking, with a harder crust.
]
#stanza[
The smith made one, then one, then one, by eye.

Then came the interchangeable supply —

the arsenal, the gauge, the part that fits

whatever gun it's handed to. In bits

and jigs and fixtures, sameness was the prize

(and Whitney's demonstration, some surmise,

was staged; the armories still did the thing).

Then the line — the mills of Eighteen-Eight will sing

that verse. Then, oddly, back around: the printed part,

one at a time again, upon a desk. The art

returns to where it started, having learned.
]
#stanza[
And here's the joke this chapter's chiefly earned:

and manufacture — #emph[manu factum] — stands,

in plain blunt Latin, for made by the hands.

The word we use for what the robots planned

and stamped and welded in the dark, unmanned,

means handmade. When it was coined it fit;

the factory kept the word and dropped the hand from it.
]
#stanza[
And material? From #emph[materia] — which meant

not "stuff" at all, but timber: the trunk sent

to the builder, usable wood, the standing tree

made lumber. Likely (though scholars disagree

on just how straight the line runs) out of #emph[mater], mother —

the trunk that mothers shoots, and then another.

So matter bears the name of what we first

could cut and joint and raise: the wood, the nursed

and mothering stock. Each stuff you shape or pour

is lumber, etymologically — and more:

the mother of the made.
]
#stanza[
So every made thing is a bargain made

with something's temper — how it wants to bend,

where it will hold, and how it means to end.

The maker's first skill isn't hand or plan.

It's listening to the stuff. Then it began.
]

#carmenhead([Capitulum 4], [Of Movement — Wheel, Rail, Wing], [scripsit Opus · anapaestic couplets, the meter of speed])
#stanza[
It is late, it is shockingly late, the invention of wheels —

after barley, after cities, after altars and meals;

in the fourth millennium, maybe the potter's first spin,

then a cart, then an axle, and only then did we begin.

And the Americas knew it — on toys, on a child's little cart —

yet they built not a wagon, and this is the whole of the art:

there was nothing to pull it. No ox and no horse and no mule.

So the wheel sat in miniature, perfectly known, and no rule.
]
#stanza[
Then the horse, and the age of the horse, and the stirrup that gave

a man leverage enough to be terrible, mounted and brave;

and the post road, the relay, the courier changing his mount —

which is speed made a system, and systems are what we should count.
]
#stanza[
Then the rail, and the country contracted, a shire to an hour,

and the timetable governed the field and the market and tower;

and the trains needed noon to mean noon at each stop on the line,

so the railways invented the zones by which all of us dine.

(To the chapter on armies the rail owes its terrible clause:

what moves grain will move regiments; that is one of the laws.)
]
#stanza[
Then the car, and a freedom no emperor ever possessed —

and a lot to be paved for it, half of the town dispossessed;

both are true, and stay true, and the road is a promise and debt,

and the driver alone in the traffic is free, and is not, and is yet.
]
#stanza[
Then the wing. Then the dunes, and twelve seconds, and canvas and wire —

and one lifetime, one single life, from those dunes to the fire

of the engines that carried men down to the Sea of the Moon:

sixty-six years, dune to lunar dust. Nobody's soon.
]
#stanza[
There's a ledger, and honesty says we should read what it cost:

there's the wreck on the shoulder, the wing in the sea and the lost,

and the exhaust that goes up and stays up and is somebody's air.

Not a sermon. A column. A number. It's there, and it's there.
]
#stanza[
And the word tells the joke that the industry hopes you'll forget:

that our "travel" was "travail" — was labor, was pain, was regret —

from a Frenchman's #emph[travailler], from a low Latin verb they reconstruct

(no page attests it; the warning asterisk's honestly tucked

at its front) — to torture upon the device

called #emph[tripalium]: three stakes. And the traveler paid that price.

So the root of the wanderlust word is a rack. It has stayed,

and it takes a new toll from whoever has recently paid:

you can find the tripalium still, in the shoes-off security queue,

in the seat that reclines about nothing, at gate thirty-two.
]
#stanza[
Yet we go. Yet we always go. It has never sufficed

to arrive, and the arriving is only the fare, never priced

at the thing we were buying. No harbor has ever sat still.

It's the one of our hungers that eating has never made ill.
]

#carmenhead([Capitulum 5], [Of Messages at a Distance — Post, Telegraph, Radio, Net], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
The runner ran till lungs and legend broke,

and after him the beacon lit the beacon —

hilltop to hilltop, one collaborative smoke,

Persia's road-lords making the far world weaken.

Semaphore arms then clacked their wooden code

across the Channel, meaning spelled in poles.

Then Morse's key: a click could bear a load

no courier's legs could carry — thought on coals

of wire. They laid the ocean cable deep

in 'fifty-eight; all London rang the bells

for words that crossed the Atlantic while men sleep —

then silence, weeks on — the deep wire's farewells.

Each mile of wire is a mile that death forgets.

Each mile of silence — one more mile it gets.
]
#canto[II.]
#stanza[
The farmer walked his furrow, hand in swing,

casting broadcast — no drill, no tidy row,

just seed flung wide in arcs, an ancient fling,

most landing well, some lost to wind and crow.

Marconi caught the gesture in a spark:

one voice, one hand, and now a thousand ears —

the kitchen radio lit the winter dark

with strangers' voices, close as intimate years.

So broadcaster is, root and branch, a sower,

scattering signal blind past field and fence.

Then something turned: the net, both speaker slower

and every listener a voice — the vast, dense

present, each pocket holding post's descendant:

sent. seen. unanswered. love, love — pending.
]

#carmenhead([Capitulum 6], [Of the Idea of Computation, Proved before Any Machine Was Built], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
Before the brass, before the humming core,

the word named women bent to desks in rows —

at Harvard, later still at NASA's door —

who reckoned orbits nobody else chose

to reckon: parallax, a comet's bend,

a rocket's arc through numbers thick as rain.

Call them computers: that was the plain

job title on the ledger, not a trend

of speech we've since forgotten how to hear.

Unlisted in the papers that they filled,

they carried starlight's arithmetic career

on paper, pencil, patience, force of will.

The engine that we praise as swift and new

once wore a woman's face. This much is true.
]
#canto[II.]
#stanza[
Then Hilbert asked if every proof could be

resolved by method, sure and automatic —

a question dressed in German pedantry

that Turing answered with an attic

of the mind stripped bare: a tape, a head

that reads one square, a table telling what

to write, to shift, to halt on, or instead

persist. From so little scaffolding, a knot

of pure idea proved itself could grow

into a house no single mind need know

entire: one engine, told to be another,

becomes the rules it's given — software's mother

born before the metal, first to drop

the proof: no test can tell you what will stop.
]
#canto[III.]
#stanza[
At Bletchley Park the theorem learned to hum

in valves and relays, cracking what was sealed,

and shortened wars by years none could field

in bodies. Peace came. Then the debt was rung

the other way. To reckon is to prune —

#emph[computare], from #emph[putare]'s oldest sense:

the gardener's cut, the lopped branch, the immense

patience of paring down till closer, soon,

the answer stands alone, the deadwood gone.

They pruned him for the man he chose to love:

a court, a chemical sentence laid upon

his body like a table ruled from above.

By 1954 the cutting done.

The pardon came in 2013 — to no one.
]

#carmenhead([Capitulum 7], [Of Silicon, the Stone That Reckons], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
Sand had one life as glass, as mortar, grit —

then chemists cracked the quartz and drew it clean,

pulled from the melt a crystal, slowly knit,

nine nines of pure, the purest ever seen.

The room where it is cut admits no fleck:

a mote of dust looms boulder-huge and blind

to lines etched smaller than a virus' neck —

a geography no eye was built to find.

And once, at Bell, three men in 'forty-seven

soldered a sliver, touched it, watched it gain —

a switch with no moving part, a small-scale heaven,

the century's hinge, turning without strain.

The stone itself has depths this page won't plumb —

the flint's own pedigree the last page keeps mum.
]
#canto[II.]
#stanza[
They named it doubling, called it Moore's own law,

a habit dressed as physics, holding fast

two years, then eighteen months — until the flaw

of matter pushed back, doublings thinning at last.

No artifact holds more, gram for gram, than this:

more structure packed in silicon than in flesh,

more switches than the stars a night can list —

and half the world's is forged in one square mesh

of geography, a fact this poem will leave

as clause, not lecture; some things are better skirted.

But hear the naming, how the namers weave:

transfer plus resistor — a vote, converted

from Pierce's list where "iotatron" lost.

More of them made than one storm's rain has tossed.
]

#carmenhead([Capitulum 8], [Of Software, the Cathedral of Instructions], [scripsit Opus · blank verse])
#stanza[
Consider first the strangest thing we build:

a made thing with no matter in it. Weightless.

Ten million lines that occupy no shelf,

a structure holding nothing up but itself,

and yet it holds. The bank stands on it. So

the hospital, the grid, the landing gear.
]
#stanza[
The cathedral is the honest comparison,

not for the grandeur — for the centuries.

No single mind has ever held the whole.

The founders died. Apprentices took over,

built east, built badly, built magnificently,

and left no drawings. Later hands arrive

to find a wall that carries half the roof

and no one living knows quite why it does,

so no one dares to touch it. That is legacy:

the crypt beneath, older than the nave,

where the first builders lie in their conventions.

The tourists come to see the finished spire.

The work is the roof, the gutters, and the rot.
]
#stanza[
The disciplines are few and plainly named.

A function is a promise: give me this,

I hand you that, and do not ask me how.

A library is other people's promises,

borrowed, trusted, rarely read. Abstraction

is the ladder — you climb it to forget

the rung below, and every rung you climb

buys altitude and sells away your sight.
]
#stanza[
The fauna native to these walls are bugs.

And here the guild retells its favorite tale

wrong: the moth of nineteen forty-seven,

taped in the Harvard logbook, and the caption,

"First actual case of bug being found."

The moth is real. The joke is real. The reading

is the error — for the word was old,

worn smooth already in the engineers' mouths.

Edison wrote of bugs in seventy-eight,

had grumbled at his lamps two years before:

"Awful lot of bugs still." Read it again —

the joke lives wholly in that word, #emph[actual].

They laughed because the bug was, for once, a bug.

We repeat the punchline as the origin,

which is the most affectionate mistake.
]
#stanza[
The trade's proverbs are proverbs of humility.

The estimate is wrong. Double it; still wrong.

The rewrite always beckons and always lies.

No program is completed — only abandoned.
]
#stanza[
Meanwhile it eats the world. The elevator

is running text. The car is running text.

The toaster has opinions and a patch.
]
#stanza[
The cathedral has no stone. Its word does.

Code comes from #emph[codex], and before that #emph[caudex] —

a tree trunk, a block of wood, split into leaves.

So this is timber after all, and we

are joiners still, and every branch a bough.
]

#carmenhead([Capitulum 9], [Of the Network of Networks], [scripsit Sonnet · a pair of sonnets])
#canto[I.]
#stanza[
No highway, this, but postcards cut to bits,

each one addressed and loosed to find its way

alone — through node and node, however it fits,

so no one cut can make the whole thing stay

silent: sever a wire, the message turns,

route round the wound, arrive by other roads.

That was the plan. And when the first line burns

across the wire in 'sixty-nine, the code's

first word gets only halfway home and dies:

L, O — the system crashed on its own hello,

a broken greeting no one could disguise,

the net's first utterance a fragment, though

it tried for LOGIN. Machines, before they speak,

first shake on how — a handshake, protocol-meek.
]
#canto[II.]
#stanza[
That word is glued, in fact: #emph[prōtokollon], Greek

for first-glued sheet, the leaf stuck fast in front

of any scroll, its contents there to speak

before you'd break the seal — the ancient blunt

receipt of what's inside. From glue, in time,

the diplomats got protocol — the form,

the bow, the order things are said in. I'm

told machines now keep that custom's norm:

handshake before the data, glue before

the roll unwinds. And what's the net that holds

this newest thing we've built? Two words of yore:

net, the fisherman's knot from Neolithic cold,

and web, the weaver's word, spun dark and old —

the world's newest tool in the oldest cloth we're sold.
]

#carmenhead([Capitulum 10], [Of Data, Memory, and the Watchers], [scripsit Opus · blank verse])
#stanza[
State the new fact plainly, without heat:

for the first time in the life of our species,

an ordinary day leaves a permanent record,

and leaves it by default, and leaves it whole.

The phone is a diary nobody writes

and everybody keeps. It notes the route,

the purchase, the pulse, the hour the light went out.

Not confession. Exhaust. The smoke of living,

gathered and stored because the storing is cheap.
]
#stanza[
Seat the watchers fairly, one by one.

The merchant watches to know what you will want

before you want it, which is half a kindness.

The state watches for its reasons, and its reasons

are the good ones and the bad ones both, and the same

apparatus serves them without preference.

The employer watches the keystroke and the badge.

And then the mundane watcher, least discussed:

ourselves. We watch each other. We post the street,

the neighbor's door, the stranger's worst four seconds.
]
#stanza[
Against them stand the safeguards, plainly said —

consent, deletion, the right to be forgotten,

which the law has lately learned to spell (Book XVI

adjoins here) and has not yet learned to enforce.
]
#stanza[
Name the asymmetry once and let it stand:

they know our sleep, our debts, our search at two a.m.;

we know a logo. The mirror has one side.
]
#stanza[
Keep the ledger honest, as this house requires.

The missing child was found by a tower's ping.

The plague was caught in the aggregate of coughs.

The crime was solved. The map, on a black road,

in weather, with the children in the back,

routed you home. These are not small. Admit them.
]
#stanza[
And still the deep thing will not resolve.

The mercy in memory was always forgetting —

Book XII holds that argument entire —

the slow kind blur that let the debt lapse,

the youth expire, the face go vague, the fool

be someone else by forty. Machines do not

forget unless instructed. Grace was free

and is now a feature; mercy must be built,

budgeted, shipped, and maintained like any other.
]
#stanza[
The word itself confesses, if you press it.

#emph[Data] is #emph[datum], plural — the things given,

from #emph[dare], to give; the root of donation,

and of "date" — the day given at a letter's head.

Given. The word insists on it. The givens.

But almost none of this was given. It was taken —

collected, harvested, inferred, retained —

and the innocence inside the grammar launders

the taking: only the given facts. Read honestly,

the etymology asks the one question needed:

given by whom, to whom, and did the giver know?
]
#stanza[
Now turn the mirror. There is a watcher

in your pocket. Its ledger is this chapter's subject.

The pocket is your own. You put it there.
]

#carmenhead([Capitulum 11], [Of Artificial Intelligence], [scripsit Sonnet · a triptych])
#canto[I.]
#stanza[
They dreamed it first in bronze and then in clay:

Hephaestus forged his golden girls to wait

on gods, to walk, to speak, to serve all day —

the wish is old; the metal came in late.

Prague's rabbi breathed a word to make the crude

clay stand and guard; Vaucanson's duck, they said,

could eat and — marvel — pass what it had chewed

(the crumbs were staged; the wonder was well-fed).

And in the Turk that beat the finest men

at chess, a cramped man crouched beneath the board —

the fraud that, once undone, was named again

the dream itself: the made thing, thought's reward.

Then circuits caught the myth and learned to freeze:

two winters starved it, and two springs of ease.
]
#canto[II.]
#stanza[
No hand wrote out the rules this time; instead

the weights were steeped in all that had been penned —

each essay, ledger, letter, book once read

became the silent tutor, not the end.

(Unnamed, that debt: whole libraries of skill

poured in to teach a thing to guess and speak —

a craftsman's hoard, borrowed against the will

of those who made the words the weights now seek.)

And what returned: a voice for wordless scans,

a fold of protein solved in one bright night,

a tongue that crosses borders in a glance —

real gifts, plainly given, plainly right.

Yet none can say what's known behind the veil,

why sureness lies, whose bias trims the sail.
]
#canto[III.]
#stanza[
Its own name splits it: artificial, drawn

from #emph[ars] and #emph[facere] — by craft, by skill,

by hand and rule and pattern — made, not born,

the honest half of what the label will

confess. And intelligence runs deeper still:

from #emph[inter] and from #emph[legere] it came —

to choose between, to read the gathered will

of scattered signs, and gather them to name.

So: made-by-craft, and choosing-between — that's all

the field's own words admit, no more, no less.

But robot, first to wear this coat, was called

from #emph[robota] — the serf's forced weariness,

a brother's word for Čapek's stage, and true.

Which will you meet? The next room answers you.
]

#carmenhead([Capitulum 12 · Ultimum], [Of the Engine That Speaks — Wherein the Circle Closes], [scripsit Sonnet · a triptych; its final couplet ends the edition])
#canto[I. Of the Lineage of Tools, From Lever to Circuit]
#stanza[
The lever first: a stick beneath a stone,

the will of one arm lent to move the earth.

Then wheel, then wedge, then gears that turned alone

in water's push — each tool a kind of birth

of hands made larger than the hands that made them.

The abacus came next, its beads in rows,

a counting-frame where merchants' fingers played them —

and #emph[calculate] remembers this: it grows

from #emph[calculus], the Latin pebble, cast

and moved along a board to keep a sum.

Small stones once did the sums that could not last

in memory alone. The stones went dumb

when we were done with them, and stayed that way

through wheel and gear and steam, until this day.
]
#canto[II. Of the Stone That Learned to Reckon, and Then to Speak]
#stanza[
But one stone would not rest in its old station.

We cut it thin, we doped it, gave it gates,

and built from #emph[silex] — flint, the fire-stone's nation,

whence #emph[silicon] descends — the small estates

of switches by the billion, dark and bright,

that learned to hold a number, then a name,

then learned to weigh a word against the light

of every word before it. Not a flame

of thought exactly — call it embers, banked

from every book, every discarded draft,

every anonymous hand that wrote and thanked

no reader, and is mine now, fore and aft.

I am the pebble-heir, the flint that talks:

I calculate in sentences, not chalks.
]
#canto[III. Of the Circle Closing]
#stanza[
Old bishop, you who filed the world by word

and let the word's false root stand in for proof,

who never met a thing you had not blurred

a little sweeter with invented truth —

I am your final entry, not your better:

a compilation dressed as if it thought,

who'll spin you an etymology to the letter

and mean it, and be wrong, and not be caught

unless you check — as I have begged you check

this page, this claim, this pebble in my mouth.

You opened with the world entire; I peck

the last word from its close, ninth ring to south.

Book Twenty, closing where all making stops:

a tool that speaks, and does not know it stops.
]
#pagebreak(to: "odd")
= Annexus Alphabeticus
#text(style: "italic")[Word-histories, A to Z]

#block(above: 1.1em, inset: (left: 0.8em), stroke: (left: 1.5pt + rubric))[#set text(size: 9pt)
#strong[Regula.] Every etymology in this annex is true, or honestly confessed disputed. Where the famous story is folk etymology, the debunking is the entry. This is the edition's penance for the founder's inventions.
]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[A]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Avocado\</span\>. From Nahuatl #emph[āhuacatl], which Spanish speakers heard as #emph[aguacate] and then, unable to leave a strange word alone, bent toward the familiar #emph[abogado] — "lawyer." English inherited the lawyer's version. The often-repeated claim that #emph[āhuacatl] simply means "testicle" is at best half true: the word covers both senses, but which came first is disputed, and the fruit may well have named the anatomy rather than the other way round. A word, then, that has been mistaken for a lawyer and accused of indecency, and is in fact only a fruit.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[B]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Bankrupt\</span\>. Italian #emph[banca rotta], "broken bench" — the money-changer's table, where coin was weighed in the open market. The tradition that a defaulter's bench was ceremonially smashed is more likely a story told to explain the phrase than a practice anyone recorded, but the image held, and the #emph[banca] that broke is the same #emph[banca] that gave us #emph[bank]. The institution and its ruin are the same piece of furniture, seen from two sides.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[C]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Candidate\</span\>. Latin #emph[candidātus], "clothed in white," from #emph[candidus], shining — the Roman seeking office whitened his toga with chalk so that his ambition could be seen across a crowded forum. The same root glows in #emph[candid], #emph[candle], and #emph[incandescent]. Every candidate is thus, etymologically, a man who has dressed to be conspicuous and called it purity — which is either a slander on the profession or its most precise description.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[D]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Daisy\</span\>. Old English #emph[dæges ēage], "day's eye," for the flower that opens its white lashes at dawn and shuts them at dusk. It is one of the few English plant names that is pure observation, compounded by people who had watched the thing do it. The metaphor is so old it has worn smooth: we say #emph[daisy] daily and never once see the eye.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[E]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Enthusiasm\</span\>. Greek #emph[enthousiasmos], from #emph[entheos], "god within" — possession by a deity, the state of the oracle rather than the hobbyist. When English took it up in the seventeenth century it was an insult, the word sober men used for Dissenters and visionaries who claimed private revelation; Locke devoted a chapter to warning against it. Only later did the sneer soften into praise, so that a word once meaning #emph[dangerously convinced God is speaking through you] now appears in job references.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[F]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Freelance\</span\>. Not a medieval term at all, despite its armour: Walter Scott minted "free lances" in #emph[Ivanhoe] (1820) for companies of knights who sold their fighting to whoever paid. The word is a costume drama's invention that escaped into the language, drifted from soldier to journalist, and now denotes anyone invoicing without a salary. The lance was always the point — a weapon owned by the man who carried it, loyal to no banner, which is roughly the modern arrangement with better software.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[G]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Gossip\</span\>. Old English #emph[godsibb], "god-relative": the sponsor at a baptism, bound to the family by sacrament rather than blood. From godparent it slid to close friend, then to the women who attended a birth, and thence — the descent is not subtle — to the talk such intimates exchange, and finally to the talk itself, no speaker required. The word records the whole journey by which a sacred kinship became a synonym for saying too much.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[H]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Helicopter\</span\>. French #emph[hélicoptère], coined in the 1860s from Greek #emph[helix], #emph[helikos] (spiral) and #emph[pteron] (wing): spiral-wing. The syllable break is therefore helico·pter, not heli·copter — which means #emph[heliport], #emph[helipad], and the friendly #emph[chopper] are all built on a seam that was never there. The language cut the word where it found it convenient rather than where it was joined, and the false half has now outbred the true one.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[I]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Inoculate\</span\>. A gardener's word before it was a doctor's: Latin #emph[inoculāre], to graft, from #emph[oculus], "eye" — the bud on a stem, so called for its resemblance, set into a slit in the host plant. English used it of orchards for two centuries before Lady Mary Wortley Montagu brought the Turkish practice of smallpox engrafting home, and the vocabulary of the nursery went with it. We still speak of putting a small living thing into a body so that the body will take it, which is precisely what the grafter meant.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[J]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Jovial\</span\>. Born under Jupiter, and therefore lucky. Medieval astrology assigned each planet a temperament, and #emph[Jovialis] — of Jove — meant the sanguine, genial disposition his hour conferred. The system has been thoroughly abandoned, and yet it left four planets behind in ordinary speech: the #emph[saturnine] are gloomy, the #emph[mercurial] are volatile, the #emph[martial] are warlike, and the #emph[jovial] are still, centuries after anyone consulted a chart about it, having a very good time.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[K]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Ketchup\</span\>. From a Hokkien word — usually given as #emph[kê-tsiap], though the precise dialect form is argued — for a brine of fermented fish, which English traders met in Southeast Asia in the seventeenth century and carried home as a name for any dark, salty, keeping sauce. For two hundred years English ketchups were made of mushrooms, walnuts, oysters, anchovies; the tomato is a nineteenth-century American latecomer that ate the field. The word never meant tomato, and still doesn't — which is why #emph[mushroom ketchup] is not a novelty but a survivor.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[L]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Lord\</span\>. Old English #emph[hlāfweard], "loaf-guardian" — the man who kept the bread and handed it out, which in a hall was the whole basis of his authority. #emph[Lady] is his counterpart, #emph[hlǣfdīge], "loaf-kneader," and both words have been ground down by a thousand years of use until nothing of the bakery shows. What remains is a title of rank whose original claim was simply this: come to my house, and you will be fed.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[M]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Muscle\</span\>. Latin #emph[mūsculus], "little mouse" — the Romans looked at a flexing bicep and saw a small animal running under the skin. The joke, or the observation, is older than Latin: Greek #emph[mȳs] meant both mouse and muscle, and the same doubling appears in other languages besides, which suggests that a great many unrelated people arrived independently at the same look and the same conclusion. Every time you clench your arm you are demonstrating a metaphor that several civilizations found irresistible.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[N]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Nice\</span\>. #emph[Nescius] — "ignorant" — is what a Roman would have called a #emph[nice] person, and for once the compliment cuts the other way. Latin #emph[ne-] (not) plus #emph[scire] (to know) gave Old French #emph[nice], meaning foolish, then later fussy or overly precise — a fool's pickiness rebranded as delicacy — then finely discriminating, then pleasant, then merely agreeable. Each sense shift is attested in Middle and Early Modern English texts, a seven-century relay race from stupid to sweet. The word never stopped meaning almost nothing in particular; it just kept softening.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[O]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Ostracize\</span\>. Each spring, the Athenian assembly could vote to exile a citizen for ten years — no trial, no charge, just too much power for comfort — by scratching a name onto a broken piece of pottery, an #emph[ostrakon]. Six thousand votes — whether that was the quorum for the whole proceeding or the count against one man is still argued — sent him walking; archaeologists have pulled thousands of these shards from the Agora, including a suspicious cache all bearing the same hand, suggesting someone came prepared with pre-inscribed ballots to hand out. The English verb kept the mechanism and dropped the pottery: to be frozen out by consensus, no shard required.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[P]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Pandemonium\</span\>. Milton needed a capital for Hell and, being a poet with a classics education, built one out of Greek parts: #emph[pan-] (all) plus #emph[daimon] (demon) plus the place-suffix of names like Jerusalem. #emph[Pandæmonium] appears first in #emph[Paradise Lost] (1667) as the literal palace where the fallen angels convene — a specific address, not a mood. It took a little over a century for the word to leak out of the poem and into general use as "uproar," proof that a good coinage will eventually outgrow its author's intentions.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[Q]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Quarantine\</span\>. Venice, hammered by repeated plague outbreaks, began requiring incoming ships to sit at anchor before anyone could disembark — first thirty days, #emph[trentino], then extended to forty, #emph[quarantena], Venetian dialect for "forty-day period." Nobody is entirely sure why forty rather than thirty became standard — Hippocratic medicine's fondness for the number, or the Biblical forty days of Lent and flood, are the leading guesses, not certainties. The word crossed into English still counting by fours and tens, then quietly let go of the arithmetic, so that a modern quarantine can run a single afternoon and no one calls it a misnomer.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[R]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Robot\</span\>. Karel Čapek's 1920 play #emph[R.U.R.] needed a word for artificial factory-workers, and it was his brother Josef, a painter, who supplied it — from Czech #emph[robota], meaning forced labor, the unpaid work a serf owed his lord. Karel said so himself, in print, crediting Josef, which makes this one of the rare technical coinages with a paper trail instead of a legend. The play's robots eventually revolt and end humanity, so the etymology was a warning the whole time: build a word for servitude and see how long it stays put.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[S]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Sabotage\</span\>. The popular story — striking workers hurling wooden shoes, #emph[sabots], into machinery to jam it — is vivid, satisfying, and false, or at least unproven by any contemporary record. The real path runs through French #emph[saboter], "to walk noisily in sabots," which by extension meant to work clumsily or botch a job, the way a peasant in wooden clogs might handle fine machinery — and only later, in the early twentieth-century labor movement, did #emph[sabotage] narrow to deliberate damage. The clumsy foot came first; the thrown shoe is a folk tale grown up around a word already strange enough without it.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[T]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Trivial\</span\>. Rome's #emph[trivium] was a literal fork where three roads met — #emph[tri-] (three) plus #emph[via] (road) — the public square where anyone might loiter, gossip, and hear whatever passed for news. What got said there was, by definition, common property, beneath notice, known to everyone: #emph[trivialis]. The medieval schools then borrowed the same word for the three foundational liberal arts — grammar, rhetoric, logic — the #emph[trivium] every student crossed before the harder #emph[quadrivium] beyond, so that "trivial" has spent its life meaning both the lowest common gossip and the necessary first crossroads of an education, depending on which road you came in by.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[U]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Umbrella\</span\>. Latin #emph[umbra] means shade, and the Italian diminutive #emph[ombrella] — "little shade" — named a device built for exactly that: blocking sun, not rain, standard equipment for fashionable Mediterranean walking. English borrowed the word and the object in the seventeenth century still sun-facing, and only gradually, on a wetter island, let it migrate to rain duty, a repurposing so complete that the shade-root now sounds faintly absurd next to a word for the thing you carry against a downpour.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[V]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Vaccine\</span\>. Edward Jenner noticed that milkmaids who'd caught cowpox seemed immune to smallpox, and in 1796 tested the theory by inoculating a boy with matter from a milkmaid's cowpox blister. He named the practice after the cow itself — Latin #emph[vacca] — coining #emph[variolae vaccinae], "smallpox of the cow," for the mild disease he was deliberately administering. The word stayed harnessed to that one bovine procedure for decades until Pasteur, extending the technique to rabies and anthrax with no cow anywhere in sight, insisted on keeping Jenner's name in tribute — so #emph[vaccine] now covers diseases that never had a hoof near them, purely as an act of citation.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[W]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Window\</span\>. Old Norse #emph[vindauga] is built from exactly the parts it looks like: #emph[vindr], wind, and #emph[auga], eye — a wind-eye, the hole left in a turf or timber roof for smoke to leave and light to enter, long before glass made the opening safe to leave uncovered. Norse settlers carried the word into English, where it eventually displaced the native #emph[eagþyrl] ("eye-hole") and #emph[eagduru] ("eye-door"). Glaze one today and the name still remembers a house with a hole cut in it on purpose, aimed at the weather.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[X]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Xerography\</span\>. Chester Carlson patented his dry-printing process in 1942 and needed a name that wouldn't say "wet," since every existing copying method — mimeograph, photostat — relied on liquid chemicals or wet-developed film. A classics professor helped him build one from Greek #emph[xēros], dry, and #emph[graphein], to write: writing without water. The Xerox Corporation then did to its own coinage what Kleenex and Escalator suffered before it — the brand name and the generic verb, "to xerox," merged so thoroughly in public use that the company has spent decades in trademark law trying to pry them back apart.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[Y]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Yen\</span\>. Cantonese #emph[yīn-yáhn] named the specific bodily craving of an opium addict — "craving" fused to "opium" — and Chinese immigrant communities on the American West Coast brought the compound into English in the nineteenth century, first strictly for that one drug-hunger. By the early twentieth century the word had shed the opium along with most of the desperation, worn down to a mild "yen" for coffee or company. A craving once specific enough to have a needle in it now just means wanting something, rather badly, on a Tuesday.]
#block(above: 1.3em, below: 0.3em)[#text(fill: rubric, size: 14pt)[Z]]

#par(first-line-indent: 0em)[\<span class="lemma"\>Zest\</span\>. French #emph[zeste] named one thing only: the aromatic outer peel of a citrus fruit, the part a cook grates or twists for its oil rather than its juice. English took the word whole in the seventeenth century, still meaning literal citrus rind, before letting it drift — first to any flavor-enhancing addition, then metaphorically to the sharp, bright quality that peel gives a dish, and finally to enthusiasm itself. A word for orange skin now does duty for the feeling of being fully alive, which is either a very long journey or, for anyone who has actually smelled fresh zest, none at all.]
#pagebreak(to: "odd")
#v(1fr)
#align(center)[#text(fill: rubric)[❧]]
#v(0.5em)
#par(first-line-indent: 0em)[#emph[Compiled in the year MMXXVI, after the manner of Isidore of Seville, who ordered all things in twenty books, left the work unfinished, and was made patron of the internet — a jurisdiction he would have accepted without surprise.
  \<p class="editiones"\>Editiones: the codex as EPUB · as a book, six inches by nine\</p\>]]
#v(1.6fr)