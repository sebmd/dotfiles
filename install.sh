#!/bin/bash

BACKUP_DIR=$HOME/.backup
SCRIPT_DIR=$PWD
mkdir $BACKUP_DIR

cd $HOME

while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L $LINE ]; then
        cp -R $LINE $BACKUP_DIR/
        rm -rf $LINE
        ln -s $SCRIPT_DIR/$LINE $LINE
    fi
done < "$SCRIPT_DIR/files"

mkdir -p ~/.vim/undo
mkdir -p ~/.vim/view
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c ":PlugInstall" -c ":qa"

mkdir -p $HOME/notes
mkdir -p $HOME/tmp
mkdir -p $HOME/.config/zathura

# stworzenie linków symbolicznych w katalogu ~/bin
cd ~/bin && funkcje -i
