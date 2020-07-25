#!/bin/bash

BACKUP_DIR=$HOME/.backup
SCRIPT_DIR=$PWD
BIN_DIR=$HOME/bin

# tworzy potrzebne katalogi
mkdir -p $BACKUP_DIR
mkdir -p $BIN_DIR
mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/view
mkdir -p $HOME/.vim/viminfo
mkdir -p $HOME/notes
mkdir -p $HOME/tmp
mkdir -p $HOME/.config/zathura

cd $HOME

# odczytuje plik 'files' sprawdzając czy odczytany plik z pliku 'files' istnieje
# i nie jest linkiem symbolicznym, po czym kopiuje go do katalogu $BACKUP_DIR
# następnie usuwa go i tworzy w jego miejsce link symboliczny do pliku 
# w redpozytorium dotfiles
while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L $LINE ] && [ -e $LINE ]; then
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
cd $BIN_DIR && funkcje -i

function bin_dir() {
    mkdir -p $HOME/git
    git clone https://github.com/sebmd/dotfiles_bin $HOME/git/dotfiles_bin
    ln -sf $HOME/git/dotfiles_bin/fzf $HOME/bin/fzf
    ln -sf $HOME/git/dotfiles_bin/lf $HOME/bin/lf
    ln -sf $HOME/git/dotfiles_bin/rg $HOME/bin/rg
    ln -sf $HOME/git/dotfiles_bin/sd $HOME/bin/sd
}

echo
echo    " ---------------------------------------------  "
read -p "Pobrać repozytorium z plikami binarnymi? [T/n]: " odp

case $odp in
    t|T)
        bin_dir
        exit
        ;;
    n|N)
        echo "Zły wybór ;)"
        exit
        ;;
    *)
        bin_dir
        exit
        ;;
esac
