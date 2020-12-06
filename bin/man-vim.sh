#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    /usr/bin/man
else
    if man -w $* >/dev/null 2>/dev/null; then
        /usr/bin/man $* |col -b|vim -u $HOME/.vim/man.vim -
    else
        echo "Brak strony: $*"
    fi
fi
