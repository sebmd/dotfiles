#!/bin/bash

BACKUP_DIR=$HOME/.backup
SCRIPT_DIR=$PWD

mkdir -p $BACKUP_DIR
mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/view
mkdir -p $HOME/bin
mkdir -p $HOME/notes
mkdir -p $HOME/tmp
mkdir -p $HOME/.config/zathura

cd $HOME

while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L $LINE ]; then
        cp -R $LINE $BACKUP_DIR/
        rm -rf $LINE
        ln -s $SCRIPT_DIR/$LINE $LINE
    fi
done < "$SCRIPT_DIR/files"

# przygotowanie edytora Vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c ":PlugInstall" -c ":qa"

# stworzenie linków symbolicznych w katalogu $HOME/bin
cd $HOME/bin && funkcje -i
