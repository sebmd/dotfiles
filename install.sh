#!/bin/bash

ln -s $PWD/.vim ~/.vim
mkdir ~/.vim/undo
mkdir ~/.vim/view
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.aliases ~/.aliases
ln -s $PWD/bin ~/bin

vim -c ":PlugInstall" -c ":qa"

mkdir $HOME/notes
mkdir $HOME/tmp
ln -s $PWD/.config/zathura $HOME/.config/zathura

# stworzenie linków symbolicznych w katalogu ~/bin
cd ~/bin && funkcje -i
