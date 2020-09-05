#!/bin/bash

BACKUP_DIR="$HOME"/.backup
SCRIPT_DIR="$PWD"
BIN_DIR="$HOME"/bin
DOTFILES_BIN_DIR="$HOME"/git/github/dotfiles_bin

function install_dnf() {
    sudo dnf update
    sudo dnf install git vim curl exa bat oathtool pass ripgrep skim tmux
}

if [ -f /etc/fedora-release ]; then
    echo -n "Wykryłem system Fedora, czy chcesz zainstalować wymagane pakiety? [T/n] "
    read ODP
    case "$ODP" in
        t|T)
            install_dnf
            ;;
        n|N)
            echo -n
            ;;
        *)
            install_dnf
            ;;
    esac
fi

# tworzy potrzebne katalogi
mkdir -p "$BACKUP_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$HOME"/.vim
mkdir -p "$HOME"/.vim/undo
mkdir -p "$HOME"/.vim/view
mkdir -p "$HOME"/.vim/viminfo
mkdir -p "$HOME"/notes
mkdir -p "$HOME"/tmp
mkdir -p "$HOME"/.config/zathura
mkdir -p "$HOME"/.config/alacritty
mkdir -p "$HOME"/.gnupg

cd "$HOME"

# odczytuje plik 'files' sprawdzając czy odczytany plik z pliku 'files' istnieje
# i nie jest linkiem symbolicznym, po czym kopiuje go do katalogu $BACKUP_DIR
# następnie usuwa go i tworzy w jego miejsce link symboliczny do pliku 
# w redpozytorium dotfiles
while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L $LINE ]; then
        if [ -f $LINE ]; then
            cp -R $LINE $BACKUP_DIR/
        fi
        rm -rf $LINE
        ln -s $SCRIPT_DIR/$LINE $LINE
    fi
done < "$SCRIPT_DIR/files"

# przygotowanie edytora Vim
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c ":PlugInstall" -c ":qa"

# stworzenie linków symbolicznych w katalogu $HOME/bin
# cd $BIN_DIR && funkcje -i

function dotfiles_bin() {
    mkdir -p $DOTFILES_BIN_DIR
    git clone https://github.com/sebmd/dotfiles_bin $DOTFILES_BIN_DIR
    for FILE in $(ls $DOTFILES_BIN_DIR); do
        ln -sf $DOTFILES_BIN_DIR/$FILE $BIN_DIR/$FILE
    done
}

echo
echo    " ---------------------------------------------  "
read -p "Pobrać repozytorium z plikami binarnymi? [T/n]: " ODP

case "$ODP" in
    t|T)
        dotfiles_bin
        exit
        ;;
    n|N)
        echo "Zły wybór ;)"
        exit
        ;;
    *)
        dotfiles_bin
        exit
        ;;
esac
