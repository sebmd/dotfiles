# Fedora Pakiety

Pliki pakietów oraz skrypt instalacyjny znajduje się w katalogu `~/bin/fedora/`.

## Skrypt instalacyjny

`~/bin/fedora/install`

```bash
#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")

function install-from-file() {
    sudo dnf install $(grep "^[^#]" "$1")
}

function fusion() {
    sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

function shell() {
    install-from-file "$SCRIPT_DIR/shell"
}

function docs() {
    install-from-file "$SCRIPT_DIR/docs"
}

function net() {
    install-from-file "$SCRIPT_DIR/net"
}

function devel-shell() {
    install-from-file "$SCRIPT_DIR/devel-shell"
}

function xwindow-devel() {
    install-from-file "$SCRIPT_DIR/xwindow-devel"
}

function devel-all() {
    devel-shell
    xwindow-devel
}

function clipmenu() {
    mkdir -p "$HOME/git/github"
    git clone https://github.com/cdown/clipmenu "$HOME/git/github/clipmenu"
    for FILE in $(find $HOME/git/github/clipmenu -maxdepth 1 -executable -type f); do
        ln -sf "$FILE" "$HOME/bin"
    done
}

function witaj() {
    echo " -------- "
    echo "| Witaj! |"
    echo " -------- "
}

function lightdm() {
    # multi-user.target / graphical.target
    # sudo systemctl get-default
    sudo systemctl set-default graphical.target
    sudo systemctl enable lightdm
}

function pytanie() {
    # $1 - treść pytania
    # $2 - funkcja którą ma uruchomić
    # $3 - standardowa odpowiedź
    echo -n "$1"
    read -r  ODP
    case $ODP in
        t|T)
            "$2"
            ;;
        n|N)
            echo -n
            ;;
        *)
            if [[ ("$3" == "t") || ("$3" == "T") ]]; then
                "$2"
            fi
            ;;
    esac
}

witaj

pytanie "Czy włączyć repozytorium rpmfusion [T/n] " "fusion" "t"
pytanie "Zainstalować pakiety dla konsoli tekstowe [T/n] " "shell" "t"
pytanie "Zainstalować narzędzia sieciowe [T/n] " "net" "t"
pytanie "Zainstalować pakiety shell-devel [T/n] " "devel-shell" "t"
pytanie "Zainstalować pakiety xwindow-devel [T/n] " "xwindow-devel" "t"
pytanie "Zainstalować pakiety do tworzenia dokumentacji [T/n] " "docs" "t"
pytanie "Uruchomić graficzny menadżer logowania lightdm [T/n] " "lightdm" "t"
pytanie "Pobrać i zainstalować clipmenu [T/n] " "clipmenu" "t"
```

## bspwm

```
bspwm
compton
dmenu
dunst
imwheel
polybar
rofi
sakura
xterm
sxhkd
xclip
xsel
```

## devel-shell

```
@c-development
@development-tools
autoconf
autogen
automake
bison
cargo
ccache
check-devel
clang
cmake
cmake
flex
gcc
gcc-c++
gettext-devel
glibc-static
gnutls-devel
golang
gperf
hunspell-devel
intltool
libassuan-devel
libatasmart-devel
libconfig-devel
libcurl-devel
libksba-devel
libpcap-devel
librsync-devel
libssh-devel
libtool
libusb-devel
libxcrypt-static
libxml2-devel
libxslt-devel
meson
ncurses-devel
ninja-build
nss-devel
openssl-devel
pcre2-devel
python3
python3-devel
python3-distutils-extra
python3-virtualenv
readline-devel
txt2man
xz-devel
```

## docs

```
groff
linuxdoc-tools
pandoc
```

## net

```
arp-scan
bridge-utils
ethtool
iptraf-ng
masscan
mtr
NetworkManager-openvpn
NetworkManager-openvpn-gnome
nmap
nmap-ncat
openvpn
socat
tcpdump
wireshark-cli
```

## shell

```
aspell-pl
bat
exa
exfat-utils
fd-find
fzf
htop
hunspell-pl
inxi
iotop
kpartx
links
lm_sensors
lshw
lsof
lynx
mc
moreutils
neovim
oathtool
partclone
pass
pciutils
rclone
restic
ripgrep
rsync
skim
smartmontools
srm
tlp
tmux
usbutils
vim
w3m
w3m-img
wipe
zbar
```

## xwindow

```
arandr
compton
kitty
liberation-fonts
lightdm-gtk
sakura
xorg-x11-server-Xorg
xorg-x11-xinit
xsel
xterm
```

## xwindow-devel

```
harfbuzz-devel
libX11-devel
libXft-devel
gtk3-devel
gtk+-devel
gtk+extra-devel
```

## xwindow-utils

```
firefox
gparted
keepassxc
kitty
nextcloud-client
pinentry-gnome3
remmina
remmina-plugins-rdp
feh
network-manager-applet
sakura
simplescreenrecorder
slop
sxiv
vlc
wireshark
xclip
xdotool
zathura-pdf-mupdf
```
