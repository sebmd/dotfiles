#!/bin/bash

BACKUP_DIR="$HOME"/.backup
SCRIPT_DIR="$PWD"
BIN_DIR="$HOME"/bin
DOTFILES_BIN_DIR="$HOME"/git/github/dotfiles_bin

download_font () {
    url="https://raw.githubusercontent.com/wsdjeg/DotFiles/master/local/share/fonts/${1// /%20}"
    path="$HOME/.fonts/$1"
    # Clean up after https://github.com/SpaceVim/SpaceVim/issues/2532
    if [[ -f "$path" && ! -s "$path" ]]
    then
        rm "$path"
    fi
    if [[ -f "$path" ]]
    then
        echo "Downloaded $1"
    else
        echo "Downloading $1"
        curl -s -o "$path" "$url"
        echo "Downloaded $1"
    fi
}

install_fonts () {
    if [[ ! -d "$HOME./fonts" ]]; then
		mkdir -p $HOME/.fonts
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
    fc-cache -fv > /dev/null
    mkfontdir "$HOME/.fonts" > /dev/null
    mkfontscale "$HOME/.fonts" > /dev/null
    echo "font cache done!"
}

function install_dnf() {
    sudo dnf update
    sudo dnf install git vim curl exa bat oathtool pass ripgrep skim tmux
}

function install_bspwm() {
    sudo dnf update
    sudo dnf install bspwm sxhkd polybar sakura xorg-x11-server-utils \
    picom dmenu dunst imwheel rofi xterm xclip xsel network-manager-applet
}

if [ -f /etc/fedora-release ]; then
    echo -n "Wykryłem system Fedora, czy chcesz zainstalować wymagane pakiety? [T/n] "
    read -r ODP
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

if [ -f /etc/fedora-release ]; then
    echo -n "Pobrac pakiety dla BSPWM? [T/n] "
    read -r ODP
    case "$ODP" in
        t|T)
            install_bspwm
            ;;
        n|N)
            echo -n
            ;;
        *)
            install_bspwm
            ;;
    esac
fi

echo -n "Pobrac i zainstalować czcionki [T/n] "
read -r ODP
case "$ODP" in
	t|T)
		download_font
		install_fonts
		;;
	n|N)
		;;
	*)
		download_font
		install_fonts
		;;
esac

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
mkdir -p "$HOME/.gnupg"

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
    mkdir -p "$DOTFILES_BIN_DIR"
    git clone https://github.com/sebmd/dotfiles_bin "$DOTFILES_BIN_DIR"
    for FILE in $(ls "$DOTFILES_BIN_DIR"); do
        ln -sf "$DOTFILES_BIN_DIR/$FILE" "$BIN_DIR/$FILE"
    done
}

echo
echo    " ---------------------------------------------  "
read -r -p "Pobrać repozytorium z plikami binarnymi? [T/n]: " ODP

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
