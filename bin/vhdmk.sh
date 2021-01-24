#!/usr/bin/env bash

# https://leewc.com/articles/how-to-set-up-virtual-disk-encryption-linux/

# sprawdź czy istnieje polecenie pv (pokazuje postęp tworzenia pliku obrazu)
# evhd - kontener szyfrowany
# vhd  - kontener bez szyfrowania

hash pv 2> /dev/null
if [ $? == 0 ]; then
    PV=yes
else
    PV=no
fi

read -r -p "Podaj wielkość kontenera w MB minimalna wartość to 20: "
WIELKOSC=$REPLY

read -r -p "Podaj nazwę kontenera: "
NAZWA_KONTENERA=$REPLY

read -r -p "Czy konterner ma być zaszyfrowany? [T/n]: "
SZYFROWANIE=$REPLY

case $SZYFROWANIE in
    t|T) SZYFROWANIE=yes ;;
    n|N) SZYFROWANIE=no  ;;
    *)   SZYFROWANIE=yes ;;
esac

function szyfrowanie() {
    if [ $PV == yes ]; then
        dd if=/dev/urandom iflag=fullblock | pv | dd of=$NAZWA_KONTENERA.evhd bs=1M count=$WIELKOSC iflag=fullblock
    else
        dd if=/dev/urandom of=$NAZWA_KONTENERA.evhd bs=1M count=$WIELKOSC
    fi
    sudo cryptsetup -y luksFormat $NAZWA_KONTENERA.evhd
    sudo cryptsetup luksOpen $NAZWA_KONTENERA.evhd $NAZWA_KONTENERA
    # ls -l /dev/mapper/your_mapping_name
    # sudo cryptsetup -v status $NAZWA_KONTENERA
    sudo mkfs.ext4 /dev/mapper/$NAZWA_KONTENERA
    mkdir $NAZWA_KONTENERA
    sudo mount /dev/mapper/$NAZWA_KONTENERA $NAZWA_KONTENERA
    # df -h
    # sudo chown myUserName /mnt/encryptedVolume
}

function bez_szyfrowania() {
    echo BEZ SZYFROWANIA
    dd if=/dev/zero of=$NAZWA_KONTENERA.vhd bs=1M count=$WIELKOSC
    mkfs.ext4 $NAZWA_KONTENERA.vhd
    mkdir -p $NAZWA_KONTENERA
    sudo mount -t auto -o loop $NAZWA_KONTENERA.vhd $NAZWA_KONTENERA
}

if [ $SZYFROWANIE == yes ]; then
    szyfrowanie
else
    bez_szyfrowania
fi
