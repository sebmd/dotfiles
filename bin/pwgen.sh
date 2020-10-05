#!/usr/bin/env bash

 . ~/bin/colors

if [[ ! $(command -v pwgen) ]]; then
    msg_error "Brak programu pwgen."
    exit
fi

if [ $DISPLAY ]; then
    pwgen -c -s -n -y -1 32 | xclip -sel clip && xclip -sel clip -o
else
    pwgen -c -s -n -y -1 32
fi
