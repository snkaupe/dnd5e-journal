#let lines(spacing: 8mm) = {
    tiling(size: (10cm, spacing), )[
      #place(line(start: (0%, 0%), end: (100%, 0%), stroke: 1pt))
    ]
}
// #let lines = tiling(size: (10cm, 8mm), )[
//   #place(line(start: (0%, 0%), end: (100%, 0%), stroke: 1pt))
// ]

#let linedpage(title: "") = {
  let skip = 11mm
  [
    #page[
      #if title != "" {
        [#align(center)[#text(size: 8pt)[#title]]]
        skip = 6mm
      }
      #v(skip)
      #rect(fill: lines(), width: 100%, height: 90%)
    ]
  ]
}

// A5 paper size per Typst source code is 148x210 mm:
// https://github.com/typst/typst/blob/0264534928864c7aed0466d670824ac0ce5ca1a8/crates/typst-library/src/layout/page.rs#L770
// A4 is 210x297 mm.
// Out target size is 12x16 cm, so we need to add to our margins accordingly.
// Inside margin needs to be the final value, though, to make sure there is
// no additional spacing between the pages when printing.
#set page(
  paper: "a5",
  numbering: "- 1 -",
  margin: (
    inside: 20mm,
    outside: 8mm + 10mm,
    y: 25mm + 10mm // 210 - 25 - 25 = 160
  ),
)

#set text(
  size: 10pt,
  lang: "en",
  font: "Alegreya"
)

#set par(
  justify: true
)

#let statbox(stat, dx: 0cm, dy: 0cm) = {
  [
    #place(top + left, dx: dx, dy: dy)[
      #rect(width: 2cm, height: 2cm, radius: 2mm, fill: white, stroke: 1pt + black)[
        #align(center)[#text(size: 7pt, [#smallcaps[#stat]])]
      ]
    ]
    #place(top + left, dx: dx + 0.6cm, dy: dy + 1.6cm)[
      #rect(width: .8cm, height: .8cm, radius: 2mm, fill: white, stroke: black)[]
    ]
  ]
}

#let thermo(text, width: 4.5cm, dx: 0cm, dy: 0cm) = {
  [
    #place(center + top, dx: dx, dy: dy)[
      #rect(width: width, radius: 2mm)[
        #align(left)[#text]
        #place(left, dx: width - 1.4cm, dy: -0.8cm)[
          #circle(radius: 0.7cm, fill: white, stroke: black)
        ]
      ]
    ]
  ]
}

#let skillline(name, linelength: 4mm) = {
  [
    #stack(dir: ltr, spacing: 1.0mm,
      align(left + horizon)[#circle(radius: 0.8mm, stroke: 0.5pt + black)],
      align(left + bottom)[#move(dy: 1.0mm)[#line(length: linelength, stroke: 0.5pt + black)]],
      align(left, text(size: 9pt)[#name]),
    )
  ]
}

#let titledbox(title, content, width: auto, height: auto, skip: 4mm, inset: 0% + 5pt) = {
  [
    #let default_inset = 0% + 5pt
    #rect(width: width, height: height, radius: 2mm, inset: inset)[
      #if title != none and title != [] [
        #place(center, dy: -4.5mm + (default_inset - inset))[
          #rect(fill: white, stroke: black, radius: 2mm)[
            #smallcaps[#title]
          ]
        ]
      ] else [
        #place(center, dy: -5.7mm + (default_inset - inset))[
          #rect(fill: white, stroke: black, radius: 2mm, width: 90%, height: 8mm)[]
        ]
      ]
      #v(skip)
      #content
    ]
  ]
}

#let npcblock() = {
  [
    #v(3mm)
    #grid(
      //stroke: .5pt + green,
      align: left,
      columns: (1.7cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      inset: (top: 3mm, right: 0mm, bottom: 1mm, left: 0mm),
      // [Name:],
      // [],
      grid.cell(colspan: 1)[Location:],
      grid.cell(colspan: 7)[#v(3mm)#line(length: 100%, stroke: .5pt)],
      grid.cell(colspan: 6)[#grid(columns: (1.26cm, auto), inset: (left: 0mm, right: 2mm), [Species:], grid.cell(inset: (left: 4mm))[#v(3mm)#line(length: 100%, stroke: .5pt)])],
      grid.cell(colspan: 2)[#grid(columns: (auto, auto), [Age:], [#v(3mm)#line(length: 100%, stroke: .5pt)])],
      grid.cell(colspan: 1)[Affilliation:],
      grid.cell(colspan: 7)[#v(3mm)#line(length: 100%, stroke: .5pt)],
      grid.cell(colspan: 1)[Notable:],
      grid.cell(colspan: 7)[#v(3mm)#line(length: 100%, stroke: .5pt)],
    )
  ]
}

#let npcpage() = {
  [
    #page[
      #align(center)[
        #titledbox([], width: 100%, height: 47%, skip: 0mm)[
          #npcblock()
        ]
        #v(2mm)
        #titledbox([], width: 100%, height: 47%, skip: 0mm)[
          #npcblock()
        ]
      ]
    ]
  ]
}

#page(numbering: none, [
  #align(center)[
    #v(2cm)
    #text(size: 16pt)[#smallcaps[Character Journal]]
    #v(3cm)
    #linebreak()
    This journal belongs to
    #v(1.5cm)
    #line(length: 80%, stroke: .5pt)
  ]
]
)

#page(numbering: none, [])

#page(numbering: none, [
  #outline(
    title: [#smallcaps[Contents]]
  )
])

#page(numbering: none)[]

#counter(page).update(1)

#show heading: none

#pagebreak()
= Character 1
#align(center)[
  #v(1cm)
  #text(size: 9pt)[#smallcaps[Character 1]]
  #v(40%)
  #line(length: 85%, stroke: .5pt + black)
]
#pagebreak()
== Basic Data

#titledbox([Name], width: 100%, height: 1.2cm)[]

#statbox(dx: 1.2cm, dy: 1.4cm)[Strength]
#statbox(dx: 3.3cm, dy: 1.4cm)[Dexterity]
#statbox(dx: 5.4cm, dy: 1.4cm)[Constitution]

#statbox(dx: 1.2cm, dy: 3.9cm)[Intelligence]
#statbox(dx: 3.3cm, dy: 3.9cm)[Wisdom]
#statbox(dx: 5.4cm, dy: 3.9cm)[Charisma]

#thermo(dx: -0.9cm, dy: 6.8cm)[Proficiency Modifier]
#thermo(dx: 0.6cm, dy: 8.1cm)[Passive Perception]

#v(8.0cm)

#align(center)[
  #titledbox([Saving Throws], width: 5.2cm, height: 2.3cm)[
    #columns(2)[
      #skillline[Strength]
      #skillline[Dexterity]
      #skillline[Constitution]
      #skillline[Intelligence]
      #skillline[Wisdom]
      #skillline[Charisma]
    ]
  ]
]

#pagebreak()

#align(center)[
  #v(3.5cm)
  #image("img/standing-human-body-silhouette-svgrepo-com-cc0.svg", width: 50%)
]
#place(dx: 1.85cm, dy: -4.4cm)[
  #line(start: (0cm, 0cm), end: (1.9cm, 0.4cm))
]
#place(dx: 6.95cm, dy: -4.4cm)[
  #line(start: (0cm, 0cm), end: (-1.9cm, 0.4cm))
]
#place(dx: 5.55cm, dy: -6.6cm)[
  #line(start: (0cm, 0cm), end: (-0.9cm, 1.9cm))
]
#place(dx: 3.25cm, dy: -6.6cm)[
  #line(start: (0cm, 0cm), end: (0.9cm, 1.9cm))
]
#place(dx: 2.35cm, dy: -1.8cm)[
  #line(start: (0cm, 0cm), end: (1.1cm, -0.6cm))
]
#place(dx: 6.45cm, dy: -1.8cm)[
  #line(start: (0cm, 0cm), end: (-1.1cm, -0.6cm))
]
#statbox(dx: 2.15cm, dy: 0.5cm)[Intelligence]
#statbox(dx: 4.65cm, dy: 0.5cm)[Wisdom]
#statbox(dx: 0.65cm, dy: 3.0cm)[Constitution]
#statbox(dx: 6.15cm, dy: 3.0cm)[Charisma]
#statbox(dx: 1.0cm, dy: 5.7cm)[Strength]
#statbox(dx: 5.8cm, dy: 5.7cm)[Dexterity]

#thermo(dx: -0.9cm, dy: 8.5cm)[Proficiency Modifier]
#thermo(dx: 0.6cm, dy: 9.7cm)[Passive Perception]

#v(2.7cm)
#align(center)[
  #titledbox([Saving Throws], width: 5.3cm, height: 2.3cm)[
    #columns(2)[
      #skillline[Strength]
      #skillline[Dexterity]
      #skillline[Constitution]
      #skillline[Intelligence]
      #skillline[Wisdom]
      #skillline[Charisma]
    ]
  ]
]

#pagebreak()

== Skills & Proficiencies

#align(center)[
  #titledbox([Skills], width: 90%, height: 6.1cm)[
    #columns(2)[
      #skillline[Acrobatics (Dex)]
      #skillline[Animal Handling (Wis)]
      #skillline[Arcana (Int)]
      #skillline[Athletics (Str)]
      #skillline[Deception (Cha)]
      #skillline[History (Int)]
      #skillline[Insight (Wis)]
      #skillline[Intidimation (Cha|Str)]
      #skillline[Investigation (Int)]
      #skillline[Medicine (Wis)]
      #skillline[Nature (Int)]
      #skillline[Perception (Wis)]
      #skillline[Performance (Cha)]
      #skillline[Persuasion (Cha)]
      #skillline[Religion (Int)]
      #skillline[Sleight of Hand (Dex)]
      #skillline[Stealth (Dex)]
      #skillline[Survival (Wis)]
    ]
  ]

  #v(3mm)

  #titledbox([Tool & Other Proficiencies], width: 90%, height: 6cm)[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 2mm,
      inset: (top: 4mm),
      rect(fill: lines(spacing: 6mm), width: 100%, height: 95%),
      rect(fill: lines(spacing: 6mm), width: 100%, height: 95%),
    )
  ]
]

#pagebreak()

#align(center)[
  #titledbox([Language Proficiencies], width: 100%, height: 7.7cm, skip: 0mm)[
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 2mm,
      inset: (top: 4mm,),
      grid.cell(colspan: 3)[#align(center)[#box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black)) #emph[Standard Languages] #box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black))]],
      skillline([Common], linelength: 0mm),
      skillline([Dwarvish], linelength: 0mm),
      skillline([Elvish], linelength: 0mm),
      skillline([Giant], linelength: 0mm),
      skillline([Gnomish], linelength: 0mm),
      skillline([Goblin], linelength: 0mm),
      skillline([Halfling], linelength: 0mm),
      skillline([Orc], linelength: 0mm),
      [],
      grid.cell(colspan: 3)[#align(center)[#box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black)) #emph[Exotic Languages] #box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black))]],
      skillline([Abyssal], linelength: 0mm),
      skillline([Celestial], linelength: 0mm),
      skillline([Draconic], linelength: 0mm),
      skillline([Deep Speech], linelength: 0mm),
      skillline([Infernal], linelength: 0mm),
      skillline([Primordial], linelength: 0mm),
      skillline([Sylvan], linelength: 0mm),
      skillline([Undercommon], linelength: 0mm),
      [],
      grid.cell(colspan: 3)[#align(center)[#box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black)) #emph[Other Languages] #box(inset: (bottom: 1mm, right: 1mm), line(length: 2.0cm, stroke: 0.5pt + black))]],
      skillline(([#move(dy: 2.4mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.4mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm),
      skillline(([#move(dy: 2.5mm)[#line(length: 20mm, stroke: 0.5pt + black)]]), linelength: 0mm)
    )
  ]
]

#pagebreak()

== Combat

#align(center)[
  #titledbox([Hitpoints], skip: 2mm, inset: 1mm)[
    #place(dx: 20mm, dy: 6.6mm, rect(width: 2mm, height: 3.5mm))
    #place(dx: 48mm, dy: 6.6mm, rect(width: 2mm, height: 3.5mm))
    #grid(
      align: center,
      //stroke: 1pt + green,
      columns: (2.1cm, 2.8cm, 2.1cm),
      inset: 1mm,
      rect(width: 100%, height: 1.5cm, radius: 2mm)[
        #align(center)[#text(size: 7pt, [#smallcaps[Maximum]])]
      ],
      rect(width: 100%, height: 1.5cm, radius: 2mm)[
        #align(center)[#text(size: 7pt, [#smallcaps[Current]])]
      ],
      rect(width: 100%, height: 1.5cm, radius: 2mm)[
        #align(center)[#text(size: 7pt, [#smallcaps[Temporary]])]
      ]
    )
  ]
]

#pagebreak()
== NPCs

#npcpage()
#npcpage()

== Notes
#pagebreak()
#linedpage(title:[Notes])
#linedpage()
#linedpage()
#linedpage()

#pagebreak()

#show heading: it => [#align(center)[#text(size: 1.2em)[#it.body]]]
== Tests & Experiments

#align(center)[
  #block[
    #rect(width: 5cm, height: 3cm)
    #place(
      dx: 0mm,
      dy: 0mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.line((0mm, 1mm)),
        curve.line((-1mm, 1mm)),
        curve.line((-1mm, 0mm)),
        curve.close()
      )
    )
    #place(
      dx: 100% + 1mm,
      dy: 0mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.line((0mm, 1mm)),
        curve.line((-1mm, 1mm)),
        curve.line((-1mm, 0mm)),
        curve.close()
      )
    )
    #place(
      dx: 100% + 1mm,
      dy: -100% - 1mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.line((0mm, 1mm)),
        curve.line((-1mm, 1mm)),
        curve.line((-1mm, 0mm)),
        curve.close()
      )
    )
    #place(
      dx: 0mm,
      dy: -100% - 1mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.line((0mm, 1mm)),
        curve.line((-1mm, 1mm)),
        curve.line((-1mm, 0mm)),
        curve.close()
      )
    )
  ]
]

#v(.25cm)
#align(center)[
  #block[
    #rect(width: 5cm, height: 3cm, stroke: none)
    #place(
      dx: 0mm,
      dy: 0mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.move((0cm + 1mm, 0cm + 0mm)),
        curve.line((5cm - 1mm, 0cm + 0mm)),
        curve.line((5cm - 1mm, 0cm - 1mm)),
        curve.line((5cm - 0mm, 0cm - 1mm)),
        curve.line((5cm - 0mm, -3cm + 1mm)),
        curve.line((5cm - 1mm, -3cm + 1mm)),
        curve.line((5cm - 1mm, -3cm + 0mm)),
        curve.line((0cm + 1mm, -3cm + 0mm)),
        curve.line((0cm + 1mm, -3cm + 1mm)),
        curve.line((0cm + 0mm, -3cm + 1mm)),
        curve.line((0cm + 0mm, 0cm - 1mm)),
        curve.line((0cm + 1mm, 0cm - 1mm)),
        curve.close()
      )
    )
  ]
]

#v(.25cm)
#align(center)[
  #block[
    #rect(width: 5cm, height: 3cm, stroke: none)
    #place(
      dx: 0mm,
      dy: 0mm,
      curve(
        fill: white,
        stroke: 1pt + black,
        curve.move((5cm - 1mm, 0cm + 0mm)),
        curve.quad((5cm - 1mm, 0cm - 1mm), (5cm - 0mm, 0cm - 1mm)),
        curve.line((5cm - 0mm, -3cm + 1mm)),
        curve.quad((5cm - 1mm, -3cm + 1mm), (5cm - 1mm, -3cm + 0mm)),
        curve.line((0cm + 1mm, -3cm + 0mm)),
        curve.quad((0cm + 1mm, -3cm + 1mm), (0cm + 0mm, -3cm + 1mm)),
        curve.line((0cm + 0mm, 0cm - 1mm)),
        curve.quad((0cm + 1mm, 0cm - 1mm), (0cm + 1mm, 0cm - 0mm)),
        curve.close(mode: "straight")
      )
    )
  ]
]
