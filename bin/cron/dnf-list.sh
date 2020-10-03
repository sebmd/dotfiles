#!/usr/bin/env bash

PAKIETY_LISTA=~/temp/dnf-list.txt
DATA=$(date +%F)

function pobierz() {
    sudo dnf update --refresh --assumeno
    dnf list -q | cut -f 1 -d' ' > $PAKIETY_LISTA
    sed -i 1d $PAKIETY_LISTA
    sed -i /Available/d $PAKIETY_LISTA
 }

if [ ! -d ~/temp ]; then
    mkdir -p ~/temp
fi

if [ ! -f $PAKIETY_LISTA ]; then
    pobierz
    exit
else
    PAKIETY_DATA=$(stat -c %w $PAKIETY_LISTA|cut -f 1 -d ' ')
fi

if [ "$PAKIETY_DATA" != "$DATA" ]; then
    pobierz
fi
