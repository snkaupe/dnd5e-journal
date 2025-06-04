alias c := compile

compile:
	typst compile --ignore-system-fonts --font-path ./fonts character-journal.typ

clean:
	rm -f character-journal.pdf

sans:
	sed -i 's|Alegreya|Alegreya Sans|g' character-journal.typ

serif:
	sed -i 's|Alegreya Sans|Alegreya|g' character-journal.typ
