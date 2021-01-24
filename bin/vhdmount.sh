#!/usr/bin/env bash

OBRAZ=$(fzf -q .vhd)

if [ -z $OBRAZ ]; then
    echo "Nie wybrałeś kontenera."
    exit
fi

NAZWA_KONTENERA=${OBRAZ%.*}

sudo cryptsetup luksOpen $OBRAZ $NAZWA_KONTENERA
ls -l /dev/mapper/$NAZWA_KONTENERA
sudo cryptsetup -v status $NAZWA_KONTENERA
mkdir -p $NAZWA_KONTENERA
sudo mount /dev/mapper/$NAZWA_KONTENERA $NAZWA_KONTENERA
# sudo chown myUserName /mnt/encryptedVolume
