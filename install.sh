#!/bin/bash

BACKUP_DIR=$HOME/.backup
SCRIPT_DIR=$PWD
mkdir $BACKUP_DIR

cd $HOME

while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L $LINE ]; then
        cp -R $LINE $BACKUP_DIR/
        rm -rf $LINE
        ln -s $SCRIPT_DIR/$line $line
    fi
done < "$SCRIPT_DIR/files"

ln -s $PWD/.vim ~/.vim
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/view
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.aliases ~/.aliases
ln -s $PWD/bin ~/bin

vim -c ":PlugInstall" -c ":qa"

mkdir -p $HOME/notes
mkdir -p $HOME/tmp
mkdir -p $HOME/.config/zathura
ln -s $PWD/.config/zathura $HOME/.config/zathura

# stworzenie linków symbolicznych w katalogu ~/bin
cd ~/bin && funkcje -i
