#let lines = tiling(size: (10cm, 1.0cm), )[
  #place(line(start: (0%, 0%), end: (100%, 0%), stroke: 1pt))
]

#let lined_page() = {
  [
    #page([
      #v(1.25cm)
      #rect(fill: lines, width: 100%, height: 90%)
    ])
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
  font: "Alegreya"
)

#set par(
  justify: true
)

#let statbox(stat, dx: 0cm, dy: 0cm) = {
  [
    #place(top + left, dx: dx, dy: dy, [
      #rect(width: 2cm, height: 2cm, radius: 2mm, [
        #align(center, [#text(size: 7pt, [#smallcaps([#stat])])])
      ])
    ])
    #place(top + left, dx: dx + 0.6cm, dy: dy + 1.6cm, [
      #rect(width: .8cm, height: .8cm, radius: 2mm, fill: white, stroke: black, [])
    ])
  ]
}

#let thermo(text, width: 4.5cm, dx: 0cm, dy: 0cm) = {
  [
    #place(center + top, dx: dx, dy: dy, [
      #rect(width: width, radius: 2mm, [
        #align(left, [#text])
        #place(left, dx: width - 1.4cm, dy: -0.8cm, [
          #circle(radius: 0.7cm, fill: white, stroke: black)
        ])
      ])
    ])
  ]
}

#let skillline(name) = {
  [
    #stack(dir: ltr, spacing: 1.0mm,
      align(horizon, [#circle(radius: 0.8mm, stroke: 0.5pt + black)]),
      align(bottom, [#move(dy: 1.0mm, [#line(length: 4mm, stroke: 0.5pt + black)])]),
      text(size: 8pt, [#name]),
    )
  ]
}

#let titledbox(title, content, width: auto, height: auto) = {
  [
    #rect(width: width, height: height, radius: 2mm, [
      #place(center, dy: -0.45cm, [
        #rect(fill: white, stroke: black, radius: 2mm, [
          #smallcaps([#title])
        ])
      ])
      #v(0.4cm)
      #content
    ])
  ]
}

#page(numbering: none, [
  #align(center, [
    #v(2cm)
    #text(size: 16pt, [#smallcaps([Character Journal])])
    #v(3cm)
    #linebreak()
    This journal belongs to
    #v(1.5cm)
    #line(length: 80%, stroke: .5pt)
  ])
]
)

#page(numbering: none, [])

#page(numbering: none, [
  #outline(
    title: [#smallcaps([Contents])]
  )
])

#page(numbering: none, [])

#counter(page).update(1)

#show heading: none

#pagebreak()
= Character 1
#align(center, [
  #v(1cm)
  #text(size: 7pt, [#smallcaps([Character 1])])
  #v(40%)
  #line(length: 85%, stroke: .5pt + black)
])
#pagebreak()
== Basic Data

#titledbox([Name], width: 100%, height: 1.2cm, [])

#statbox(dx: 0.6cm, dy: 1.4cm, [Strength])
#statbox(dx: 2.7cm, dy: 1.4cm, [Dexterity])
#statbox(dx: 4.8cm, dy: 1.4cm, [Constitution])

#statbox(dx: 0.6cm, dy: 3.9cm, [Intelligence])
#statbox(dx: 2.7cm, dy: 3.9cm, [Wisdom])
#statbox(dx: 4.8cm, dy: 3.9cm, [Charisma])

#thermo(dx: -0.9cm, dy: 6.8cm, [Proficiency Modifier])
#thermo(dx: 0.6cm, dy: 8.1cm, [Passive Perception])

#v(8.0cm)

#titledbox([Saving Throws], width: 100%, height: 2.3cm, [
  #columns(2, [
    #skillline([Strength])
    #skillline([Dexterity])
    #skillline([Constitution])
    #skillline([Intelligence])
    #skillline([Wisdom])
    #skillline([Charisma])
  ])
])

#pagebreak()
== Skills

#titledbox([Skills], width: 100%, height: 5.7cm, [
  #columns(2, [
    #skillline([Acrobatics (Dex)])
    #skillline([Animal Handling (Wis)])
    #skillline([Arcana (Int)])
    #skillline([Athletics (Str)])
    #skillline([Deception (Cha)])
    #skillline([History (Int)])
    #skillline([Insight (Wis)])
    #skillline([Intidimation (Cha|Str)])
    #skillline([Investigation (Int)])
    #skillline([Medicine (Wis)])
    #skillline([Nature (Int)])
    #skillline([Perception (Wis)])
    #skillline([Performance (Cha)])
    #skillline([Persuasion (Cha)])
    #skillline([Religion (Int)])
    #skillline([Sleight of Hand (Dex)])
    #skillline([Stealth (Dex)])
    #skillline([Survival (Wis)])
  ])
])

#pagebreak()

#pagebreak()
== Notes
#lined_page()
#lined_page()
#lined_page()
#lined_page()
#lined_page()
#lined_page()
