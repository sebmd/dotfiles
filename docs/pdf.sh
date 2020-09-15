#!/usr/bin/env bash

find . -name "*.pdf" -exec rm '{}' \;

FILES=*.md
for f in $FILES
do
    plik=$(basename "$f" .md)
    echo Generuję $plik.pdf
    pandoc --pdf-engine=xelatex -H pdf.tex -N \
        -V colorlinks -V urlcolor=NavyBlue -V toccolor=NavyBlue \
        -V geometry:"top=2cm, bottom=1.5cm, left=1.5cm, right=1.5cm" \
        -V papersize:a4 \
        -V mainfont='Hack Regular Nerd Font Complete' \
        "$f" -o "$plik.pdf"
done
