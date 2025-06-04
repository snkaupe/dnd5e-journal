# DnD 5e Journal

A player's journal for DnD 5e characters meant for binding into a book.

## What is this?

This project contains a Typst file that, when compiled, generates a player's journal for several *Dungeons & Dragons 5th Edition* characters. The generated pages are of A6 size, as this character sheet is meant to be bound into a small book and this size allows you to use ordinary A4 printer paper in the [correct grain direction](https://blog.papercraftpanda.com/the-most-important-rule-in-bookbinding-grain-direction/).

## Current State

**Heavily** WIP. Only small parts of the typical character sheet have been provided yet. At the moment, this is closer to a proof-of-concept than anything resembling a finished product.

## How to Use

TODO: Write properly

- Turn into PDF using Typst
  - use `just c[ompile]` to generate the PDF using the included font files
  - you can switch between using the serif or sans font using `just serif`and `just sans`
- Throw into [BookbinderJS](https://momijizukamori.github.io/bookbinder-js) to turn into signatures for binding (A4 paper, Quarto size)
- Print on A4 paper using appropriate settings (mirroring along short side, IIRC)
- Bind into book using a method of your choosing

## Why?

I've been low-key interested in bookbinding for quite some time, but never had any actual *reason* to bind myself a book. The simplest projects for beginners you see are often notebooks, something I don't use, and binding a bunch of notebooks only to then throw them out seemed unnecessarily wasteful.

Recently, however, we finally started up a new tabletop campaign at home and by chance, I stumbled upon the rather fantastic [DnD 5e Player Journal by GlassStaff](https://www.glassstaff.com/products/dnd-5e-player-journal), which I can recommend as a great product wholeheartedly.

Anyway, this gave me the inspiration for an actual project that I can turn into a book and I set out to make my own version of a player's journal.

## Acknowledgments

This repository contains copies of the excellent [Alegreya](https://www.huertatipografica.com/en/fonts/alegreya-ht-pro) and [Alegreya Sans](https://www.huertatipografica.com/en/fonts/alegreya-sans-ht) font families by [Huerta Tipográfica](https://www.huertatipografica.com/en), licensed under the Open Font License (OFL).

Thanks to the awesome people over at GlassStaff for the inspiration. Also, my wife loves the roleplaying stickers you add into orders (and I have to agree, the kitten warrior is incredibly cute).
