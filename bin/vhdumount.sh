#!/usr/bin/env bash

NAZWA_KONTENERA=$(find /dev/mapper/* | grep -v control | fzf)

if [ -z $NAZWA_KONTENERA ]; then
    echo "Nie wybrano kontenera."
    exit
fi

sudo cryptsetup -v status $NAZWA_KONTENERA
sudo umount $NAZWA_KONTENERA
sudo cryptsetup luksClose $NAZWA_KONTENERA
