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

function create_bin_symlinks() {
    ln -sf ~/bin/fzf_sebmd ~/bin/fzf
    ln -sf ~/bin/lf_sebmd ~/bin/lf
    ln -sf ~/bin/rg_sebmd ~/bin/rg
}

echo
echo    " ------------------------------------------------------  "
read -p "Czy chcesz użyć plików binarnych z katalogu ~/bin [T/n]: " odp

case $odp in
    t|T)
        create_bin_symlinks
        exit
        ;;
    n|N)
        echo "Zły wybór ;)"
        exit
        ;;
    *)
        create_bin_symlinks
        exit
        ;;
esac
