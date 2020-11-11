#!/usr/bin/env bash

shopt -s nocasematch

BACKUP_DIR="$HOME/.backup"
SCRIPT_DIR="$PWD"
BIN_DIR="$HOME/bin"
DOTFILES_BIN_DIR="$HOME/git/github/dotfiles_bin"

download_font() {
    URL="https://raw.githubusercontent.com/wsdjeg/DotFiles/master/local/share/fonts/${1// /%20}"
    FONTS_DIR="$HOME/.fonts/$1"
    if [[ -f "$FONTS_DIR" && ! -s "$FONTS_DIR" ]]
    then
        rm "$FONTS_DIR"
    fi
    if [[ -f "$FONTS_DIR" ]]
    then
        echo "Downloaded $1"
    else
        echo "Downloading $1"
        curl -s -o "$FONTS_DIR" "$URL"
        echo "Downloaded $1"
    fi
}

install_fonts() {
    if [[ ! -d "$HOME./fonts" ]]; then
        mkdir -p "$HOME/.fonts"
    fi
    download_font "DejaVu Sans Mono Bold Oblique for Powerline.ttf"
    download_font "DejaVu Sans Mono Bold for Powerline.ttf"
    download_font "DejaVu Sans Mono Oblique for Powerline.ttf"
    download_font "DejaVu Sans Mono for Powerline.ttf"
    download_font "DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf"
    download_font "Ubuntu Mono derivative Powerline Nerd Font Complete.ttf"
    download_font "WEBDINGS.TTF"
    download_font "WINGDNG2.ttf"
    download_font "WINGDNG3.ttf"
    download_font "devicons.ttf"
    download_font "mtextra.ttf"
    download_font "symbol.ttf"
    download_font "wingding.ttf"
    echo "Updating font cache, please wait ..."
    fc-cache -f
    mkfontdir "$HOME/.fonts"
    mkfontscale "$HOME/.fonts"
    echo "font cache done!"
}

function install_dnf() {
    sudo dnf update
    sudo dnf install git vim curl exa bat oathtool pass ripgrep skim fzf tmux
}

function install_xorg() {
    sudo dnf install xorg-x11-server-Xorg xorg-x11-drivers \
        xorg-x11-server-utils xorg-x11-xinit xterm
}

function install_bspwm() {
    sudo dnf update
    install_xorg
    sudo dnf install bspwm sxhkd polybar sakura picom dmenu rofi dunst imwheel \
        xclip xsel network-manager-applet firefox sxiv zathura-pdf-mupdf \
        xdotool pinentry-gnome3 Thunar thunar-archive-plugin thunar-volman \
        thunar-vfs thunar-vcs-plugin gvfs
}

function install_dm() {
    echo "Menadzęr logowania"
    echo
    echo "1) SDDM"
    echo "2) GDM"
    echo "3) LightDM"
    echo
    echo -n "Wybierz menadżer logowania [1]:" 
    read -r
    case $REPLY in
        1)
            sudo dnf install sddm
            ;;
        2)
            sudo dnf install gdm
            ;;
        3)
            sudo dnf install LightDM
            ;;
        *)
            sudo dnf install SDDM
            ;;
    esac
}

install_dm

if [ -f /etc/fedora-release ]; then
    echo -n "Wykryłem system Fedora, czy chcesz zainstalować wymagane pakiety? [T/n] "
    read -r -n 1 ODP
    case "$ODP" in
        t|y)
            echo
            install_dnf
            ;;
        n)
            echo -n
            ;;
        *)
            echo
            install_dnf
            ;;
    esac
    echo
fi

if [ -f /etc/fedora-release ]; then
    echo -n "Pobrac pakiety dla BSPWM? [T/n] "
    read -r -n 1 ODP
    case "$ODP" in
        t|y)
            echo
            install_bspwm
            ;;
        n)
            echo -n
            ;;
        *)
            echo
            install_bspwm
            ;;
    esac
    echo
fi

echo -n "Pobrac i zainstalować czcionki [T/n] "
read -r -n 1 ODP
case "$ODP" in
    t|y)
        echo
        install_fonts
        ;;
    n)
        ;;
    *)
        echo
        install_fonts
        ;;
esac
echo

# tworzy potrzebne katalogi
mkdir -p "$BACKUP_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$HOME/.vim"
mkdir -p "$HOME/.vim/undo"
mkdir -p "$HOME/.vim/view"
mkdir -p "$HOME/.vim/viminfo"
mkdir -p "$HOME/notes"
mkdir -p "$HOME/tmp"
mkdir -p "$HOME/.config/zathura"
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.gnupg"

cd "$HOME"

# odczytuje plik 'files' sprawdzając czy odczytany plik z pliku 'files' istnieje
# i nie jest linkiem symbolicznym, po czym kopiuje go do katalogu $BACKUP_DIR
# następnie usuwa go i tworzy w jego miejsce link symboliczny do pliku 
# w redpozytorium dotfiles
while IFS='' read -r LINE || [[ -n "$LINE" ]]; do
    if [ ! -L "$LINE" ]; then
        if [ -f "$LINE" ]; then
            cp -R "$LINE" "$BACKUP_DIR/"
        fi
        rm -rf "$LINE"
        ln -sf "$SCRIPT_DIR/$LINE" "$LINE"
    fi
done < "$SCRIPT_DIR/files"

# Instalacja clipmenu i clipnotify
function clipboard() {
    # pobranie repozytorium clipmenu
    curl -fLo "$HOME/git/src/clipmenu.tar.gz" --create-dirs \
        https://github.com/cdown/clipmenu/archive/6.2.0.tar.gz
    cd $HOME/git/src
    mkdir clipmenu
    tar zxvf clipmenu.tar.gz -C clipmenu --strip-components=1
    cd clipmenu
    ln -s $PWD/clipctl $HOME/bin/
    ln -s $PWD/clipdel $HOME/bin/
    ln -s $PWD/clipfsck $HOME/bin/
    ln -s $PWD/clipmenu $HOME/bin/
    ln -s $PWD/clipmenud $HOME/bin/

    rm ../clipmenu.tar.gz

    echo "Do działania clipmenud wymagany jest program clipnotify, możesz go"
    echo "zainstalować pobierając pakiety binarne z repozytorium"
    echo "https://github.com/sebmd/dotfiles_bin lub skompilować ze źródeł"
    echo "pobierając je ze strony https://github.com/cdown/clipnotify"
    echo "Więcej na temat kompilacji w docs/Kompilacja.md"
    echo
    echo "Naciśnij ANY Key."
    read
}

clipboard

# przygotowanie edytora Vim
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.config/nvim/autoload"
cp "$HOME/.vim/autoload/plug.vim" "$HOME/.config/nvim/autoload"

vim -c ":PlugInstall" -c ":qa"

# stworzenie linków symbolicznych w katalogu $HOME/bin
# cd $BIN_DIR && funkcje -i

function dotfiles_bin() {
    mkdir -p "$DOTFILES_BIN_DIR"
    git clone https://github.com/sebmd/dotfiles_bin "$DOTFILES_BIN_DIR"
    for FILE in $(ls "$DOTFILES_BIN_DIR"); do
        ln -sf "$DOTFILES_BIN_DIR/$FILE" "$BIN_DIR/$FILE"
    done
}

echo
echo    " ---------------------------------------------  "
read -r -n 1 -p "Pobrać repozytorium z plikami binarnymi? [T/n]: " ODP

case "$ODP" in
    t|y)
        echo
        dotfiles_bin
        exit
        ;;
    n)
        echo
        echo "Zły wybór ;)"
        exit
        ;;
    *)
        echo
        dotfiles_bin
        exit
        ;;
esac
