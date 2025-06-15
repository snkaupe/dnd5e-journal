#let lines = tiling(size: (10cm, 8mm), )[
  #place(line(start: (0%, 0%), end: (100%, 0%), stroke: 1pt))
]

#let linedpage(title: "") = {
  let skip = 11mm
  [
    #page[
      #if title != "" {
        [#align(center)[#text(size: 7pt)[#title]]]
        skip = 6mm
      }
      #v(skip)
      #rect(fill: lines, width: 100%, height: 90%)
    ]
  ]
}

#set page(
  paper: "a6",
  numbering: "- 1 -",
  margin: (
    inside: 2cm,
    outside: 1cm,
    y: 1cm
  ),
)

#set text(
  size: 9pt,
  lang: "en",
  font: "Alegreya"
)

#set par(
  justify: true
)

#let statbox(stat, dx: 0cm, dy: 0cm) = {
  [
    #place(top + left, dx: dx, dy: dy)[
      #rect(width: 2cm, height: 2cm, radius: 2mm)[
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

#let skillline(name) = {
  [
    #stack(dir: ltr, spacing: 1.0mm,
      align(left + horizon)[#circle(radius: 0.8mm, stroke: 0.5pt + black)],
      align(left + bottom)[#move(dy: 1.0mm)[#line(length: 4mm, stroke: 0.5pt + black)]],
      align(left, text(size: 8pt)[#name]),
    )
  ]
}

#let titledbox(title, content, width: auto, height: auto, skip: 4mm, inset: 0% + 5pt) = {
  [
    #rect(width: width, height: height, radius: 2mm, inset: inset)[
      #if title != none and title != [] [
        #place(center, dy: -4.5mm)[
          #rect(fill: white, stroke: black, radius: 2mm)[
            #smallcaps[#title]
          ]
        ]
      ] else [
        #place(center, dy: -5.7mm)[
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
      columns: (1.55cm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      inset: (top: 3mm, right: 0mm, bottom: 1mm, left: 0mm),
      // [Name:],
      // [],
      grid.cell(colspan: 1)[Location:],
      grid.cell(colspan: 7)[#v(3mm)#line(length: 100%, stroke: .5pt)],
      grid.cell(colspan: 6)[#grid(columns: (1.26cm, auto), inset: (left: 0mm, right: 2mm), [Species:], grid.cell(inset: (left: 2.9mm))[#v(3mm)#line(length: 100%, stroke: .5pt)])],
      grid.cell(colspan: 2)[#grid(columns: (auto, auto), [Age:], [#v(3mm)#line(length: 100%, stroke: .5pt)])],
      grid.cell(colspan: 1)[Notable:],
      grid.cell(colspan: 7)[#v(3mm)#line(length: 100%, stroke: .5pt)],
      grid.cell(colspan: 1)[Affilliation:],
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
  #text(size: 7pt)[#smallcaps[Character 1]]
  #v(40%)
  #line(length: 85%, stroke: .5pt + black)
]
#pagebreak()
== Basic Data

#titledbox([Name], width: 100%, height: 1.2cm)[]

#statbox(dx: 0.6cm, dy: 1.4cm)[Strength]
#statbox(dx: 2.7cm, dy: 1.4cm)[Dexterity]
#statbox(dx: 4.8cm, dy: 1.4cm)[Constitution]

#statbox(dx: 0.6cm, dy: 3.9cm)[Intelligence]
#statbox(dx: 2.7cm, dy: 3.9cm)[Wisdom]
#statbox(dx: 4.8cm, dy: 3.9cm)[Charisma]

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

== Skills

#titledbox([Skills], width: 100%, height: 5.7cm)[
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

#titledbox([Proficiencies], width: 100%)[]


#pagebreak()

== Combat

#align(center)[
  #titledbox([Hitpoints], skip: 2mm, inset: .5mm)[
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
