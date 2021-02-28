#!/usr/bin/env bash

cd $DOKU

vim -u ~/.vim/doku/doku.vim $(fzf -m --tac --prompt="Wybierz plik do edycji: ")
