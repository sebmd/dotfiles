# Aliasy

Aliasy są automatycznie ładowanie podczas uruchamiania powłoki `bash` jak i `zsh`.
Część aliasów to linki do skryptów w katalogu `~/bin`.

Wymagane dodatkowe oprogramowanie:

 - `fzf`
 - `ripgrep`
 - `skim`
 - `pass`
 - `rofi` / `dmenu`
 - `bat` lub `preview.sh` z programu FZF

------

# Spis treści

* [Pliki konfiguracyjne](#pliki-konfiguracyjne)
* [Pakiety](#pakiety)
* [Pliki i katalogi](#pliki-i-katalogi)
* [Kopie zapasowe](#kopie-zapasowe)
* [System plików / pamięć](#system-plików--pami)
* [ROFI / dmenu](#rofi--dmenu)
* [Skróty do programów](#skróty-do-programów)
* [Procesy](#procesy)
* [Inne](#inne)
* [Git](#git-1)
* [Szyfrowanie / hasła](#szyfrowanie--hasa)
* [systemctl, zarządzanie energią](#systemctl-zarzdzanie-energi)
* [Wyszukiwanie i przeszukiwanie](#wyszukiwanie-i-przeszukiwanie)
* [Notatki](#notatki)

------

# Pliki konfiguracyjne

## .a

```bash
alias .a="$EDITOR $HOME/.config/aliases && source $HOME/.config/aliases"
```

Edycja aliasów `$HOME/.config/aliases`

```bash
 vim $HOME/.config/aliases && source $HOME/.config/aliases
```

## .al

```bash
alias .a="$EDITOR $HOME/.config/aliases_local && source $HOME/.config/aliases_local"
```

Edycja aliasów `$HOME/.config/aliases_local`

```bash
 vim $HOME/.config/aliases_local && source $HOME/.config/aliases_local
```

## .ala

```bash
alias .ala="$EDITOR $HOME/.config/alacritty/alacritty.yml"
```

Edycja pliku konfiguracyjnego alacritty `$HOME/.config/alacritty/alacritty.yml`

## .b

```bash
alias .b="$EDITOR $HOME/.bashrc"
```

Edycja pliku `$HOME/.bashrc`

```bash
vim $HOME/.bashrc
```

## .bs

```bash
alias .bs="$EDITOR ~/.config/bspwm/bspwmrc"
```

Edycja pliku BSPWM `$HOME/.config/bspwm/bspwmrc`

```bash
vim $HOME/.config/bspwm/bspwmrc
```

## .df

Wyszukuje pliku konfiguracyjnego z listy zamieszczonej w skrypcie `$HOME/bin/dotfiles`

```bash
alias .df="$HOME/bin/dotfiles"
```

Skrypt `$HOME/bin/dotfiles`

```bash
#!/usr/bin/env bash

ARR=(
    ~/.Xresources
    ~/.bashrc
    ~/.config/alacritty/alacritty.yml
    ~/.config/aliases
    ~/.config/bmdirs
    ~/.config/bspwm/autostart.sh
    ~/.config/bspwm/bspwmrc
    ~/.config/nvim/init.vim
    ~/.config/sxhkd/sxhkdrc
    ~/.config/vars
    ~/.gitconfig
    ~/.ssh/config
    ~/.tmux.conf
    ~/.vim/vimrc
    ~/.zshrc
    )

PLIK=$(printf '%s\n' "${ARR[@]}"|fzf)

if [ "$PLIK" ]; then
   $EDITOR "$PLIK"
fi
```

## .g

```bash
alias .g="$EDITOR $HOME/.gitconfig"
```

Edycja pliku `$HOME/.gitconfig`

## .kh

```bash
alias .kh="$EDITOR $HOME/.ssh/known_hosts"
```

Edycja pliku `$HOME/.ssh/known_hosts`

## .n

```bash
alias .n="nvim $HOME/.config/nvim/init.vim"
```

Edycja pliku konfiguracyjnego edytora Neovim

`$HOME/.config/nvim/init.vim`

## .nv

```bash
alias .nv="nvim -c 'e \$MYVIMRC'"
```

Edycja pliku konfiguracyjnego neovim `$HOME/.config/nvim/init.vim`

## .s

```bash
alias .s="$EDITOR $HOME/.ssh/config"
```

Edycja pliku `$HOME/.ssh/config`

```bash
vim $HOME/.ssh/config
```

## .sx

```bash
alias .sx="$EDITOR $HOME/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd"
```

Edycja oraz restart `sxhkd` odpowiadającego za skróty klawiszowe w BSPWM.


## .t

```bash
alias .t="$EDITOR $HOME/.tmux.conf"
```

Edycja pliku pliku konfiguracyjnego `tmux`

## .v

Edycja plików konfiguracyjnych edytora Vim

Plik `vimrc` jest podzielony na kilka plików, alias `.v` uruchamia Skrypt
`~/bin/vimrc`, który wyświetla pliki konfiguracyjne w FZF.

```bash
alias .v="$HOME/bin/vimrc"
```

```bash
#!/usr/bin/env bash

vim $(ls ~/.vim/vimrc ~/.vim/*.vim|fzf -m --tac --prompt="Wybierz plik do edycji: ")
```

## .va

Otwiera wszystkie pliki konfiguracyjne edytora Vim w osobnych buforach

```bash
alias .va="$HOME/bin/vimrc_all"
```

```bash
#!/usr/bin/env bash

vim $(ls ~/.vim/vimrc ~/.vim/*.vim )
```

## .vars

Edycja pliku `~/.config/vars`

```bash
alias .vars="$EDITOR $HOME/.config/vars && source $HOME/.config/vars"
```

## .varsl

Edycja pliku `~/.config/vars_local`

```bash
alias .vars="$EDITOR $HOME/.config/vars_local && source $HOME/.config/vars_local"
```

## .xr

```bash
alias .xr="$EDITOR ~/.Xresources && xrdb ~/.Xresources"
```

Edycja pliku `$HOME/.Xresource` a następnie przeładowuje plik

## .z

```bash
alias .z="$EDITOR $HOME/.zshrc"
```

Edycja pliku konfiguracyjnego powłoki ZSH


------

# Pakiety

## di

Instalacja pakietu oprogramowania w systemie Fedora

```bash
alias di="sudo dnf install"
```

## dr

Usunięcie pakietu oprogramowania w systemie Fedora

```bash
alias dr="sudo dnf remove"
```

## ds

Wyszukuje za pomocą FZF pakietów a następnie przechodzi do instalacji

```bash
alias ds="$HOME/bin/ds"
```

Skrypt pobiera listę pakietów z pliku `~/temp/dnf-list.txt`, ten natomiast jest
generowany za pomocą zadania cron.

Zadanie crontab `~/bin/cron/dnf-list.sh`


```bash
#!/usr/bin/env bash

PAKIETY_LISTA=~/temp/dnf-list.txt
DATA=$(date +%F)

function pobierz() {
    sudo dnf update --refresh --assumeno
    dnf list -q | cut -f 1 -d' ' > $PAKIETY_LISTA
    sed -i 1d $PAKIETY_LISTA
    sed -i /Available/d $PAKIETY_LISTA
 }

if [ ! -d ~/temp ]; then
    mkdir -p ~/temp
fi

if [ ! -f $PAKIETY_LISTA ]; then
    pobierz
    exit
else
    PAKIETY_DATA=$(stat -c %w $PAKIETY_LISTA|cut -f 1 -d ' ')
fi

if [ "$PAKIETY_DATA" != "$DATA" ]; then
    pobierz
fi
```

Źródło skryptu `~/bin/ds`

```bash
#!/usr/bin/env bash

shopt -s nocasematch

if [ $(which sk) ]; then
    FUZZY="sk"
elif [ $(which fzf) ]; then
    FUZZY="fzf"
fi

# PAKIET=$(dnf search "$1" | "$FUZZY")
PAKIET=$(cat ~/temp/dnf-list.txt | "$FUZZY")
if [ -n "$PAKIET" ]; then
    PAKIET=$(echo "$PAKIET" | cut -f 1 -d : | tr -d '[:space:]')
    echo -n "Zainstalować $PAKIET [T/n]: "
    read -r ODP
    case $ODP in
        t)
            sudo dnf install $PAKIET
            ;;
        n)
            echo "OK, narka ;)"
            ;;
        *)
            sudo dnf install $PAKIET
            ;;
    esac
fi
```

## update

Skrypt aktualizacyjny uruchamiany w sesji Tmux

```bash
alias update="$HOME/bin/update"
```

Źródło skryptu `$HOME/bin/update`

```bash
#!/usr/bin/env bash

SYSTEM=$("$HOME"/bin/detect-os sys)

if [ "$SYSTEM" == "Fedora" ]
then
    UPD_CMD="sudo dnf update"
fi

if [ "$SYSTEM" == "CentOS" ]
then
    UPD_CMD="sudo yum update"
fi

if [ "$SYSTEM" == "Ubuntu" ]
then
    UPD_CMD="sudo apt update"
fi

if [ "$TMUX" ]
then
    $UPD_CMD
else
    tmux -2 new -s SysUpdate "$UPD_CMD ; read -r -p 'Naciśnij coś... '"
fi
```

------

# Pliki i katalogi

## ...

Przechodzi dwa katalogi wyżej

```bash
alias ...="cd ../.."
```

## ..

Przechodzi jeden katalog wyżej

```bash
alias ..="cd .."
```

## .d

Przechodzi do katalogu `$HOME/git/dotfiles`

```bash
alias .d="cd $HOME/git/github/dotfiles"
```

## .git

Przechodzi do katalogu `$HOME/git`

```bash
alias .git="cd $HOME/git"
```

## .h

Przechodzi do katalogu domowego `$HOME`

```bash
alias .h="cd $HOME"
```

## .src

Przechodzi do katalogu `$HOME/src`

```bash
alias .src="cd $HOME/src"
```

## cd

Jest to funkcja znajdująca się w pliku `~/.aliases`, która sprawdza czy w
katalogu do którego przechodzimy znajduje się plik `run_dir.sh`, jeśli taki plik
istnieje to zostaje uruchomiony.

```bash
function cd() {
    builtin cd "$@" && cd_func;
}

function cd_func() {
    [ -e $PWD/run_dir.sh ] && source $PWD/run_dir.sh
}
```

Przykład skryptu `run_dir.sh`

```bash
#!/usr/bin/env bash

shopt -s nocasematch

read -r -n 1 -p "Uruchomić git pull [T/n]: "

case $REPLY in
    t) echo ; git pull ;;
    n) echo ;;
    *) git pull ;;
esac
```

## cdb

Przechodzenie pomiędzy katalogami znajdującymi się w pliku `$HOME/.config/bmdirs`

```bash
alias cdb="source ~/bin/cdb"
```

```bash
#!/usr/bin/env bash

KATALOG="$(cat ~/.config/bmdirs|fzf --prompt "PWD: $PWD> "|sed "s|~|$HOME|")"
[ ! -z $KATALOG ] && cd -P -- "$KATALOG"
```

## cdba

Dodatnie bieżącego katalogu do pliku `$HOME/.config/bmdirs`

```bash
alias cdba="source ~/bin/cdba"
```

```bash
#!/usr/bin/env bash

echo $PWD | sed "s|$HOME|~|" >> ~/.config/bmdirs
sort -o ~/.config/bmdirs ~/.config/bmdirs
```

## cdbd

Usunięcie bieżącego katalogu z pliku `$HOME/.config/bmdirs`

```bash
alias cdbd="source ~/bin/cdbd"
```

```bash
#!/usr/bin/env bash

KATALOG=$(echo $PWD | sed "s|$HOME|~|")
sed -i "s|^$KATALOG$||" ~/.config/bmdirs
sed -i '/^$/d'  ~/.config/bmdirs
```

## cdbe

Edycja pliku `$HOME/.config/bmdirs`

```bash
alias cdbe="$EDITOR ~/.config/bmdirs"
```

## cdf

Poruszanie się pomiędzy katalogami za pomocą FZF

```bash
alias cdf="source $HOME/bin/cdf"
```

```bash
#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -t d | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
fi
```

## cdw

Zmienia katalog na `~/workspace`

```bash
alias cdw="cd $HOME/workspace"
```

## dchmod

Nadaje odpowiednie uprawnienia dla katalogów `755`

```bash
alias dchmod="$HOME/bin/dchmod"
```

```bash
#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t d -x chmod 755
else
    find . -type d -exec chmod 755 {} \;
fi
```

## fchmod

Nadaje odpowiednie uprawnienia dla katalogów `644`

```bash
alias fchmod="$HOME/bin/fchmod"
```

```bash
#!/usr/bin/env bash

FD=$(which fd)

if [ ! -z $FD ]; then
    fd -H -I -t f -x chmod 644
else
    find . -type f -exec chmod 644 {} \;
fi
```

## ll

Uruchamia polecenie `exa` z dodatkowymi parametrami

```bash
alias ll="$HOME/bin/ll"
```

```bash
exa -al --group-directories-first --git --header
```

## l

Jest to alias do `ll`

```bash
alias l="ll"
```

## f

Wyświetla liczbę katalogów w bieżącej lokalizacji

```bash
alias f="ls -A|wc -l"
```

## md

Alias dla `mkcdir`

```bash
alias md="mkcdir"
```

## mkcdir

Tworzy katalog a następnie przechodzi do niego

```bash
alias mkcdir="source $HOME/bin/mkcdir $1"
```

```bash
#!/usr/bin/env bash

KAT="$1"
mkdir -p "$KAT"
cd "$KAT"
```

## mkdir

```bash
alias mkdir="mkdir -p"
```

## lsx

Pokazuje pliki wykonywalne w bieżącej lokalizacji

```bash
alias lsx="ls -F | grep '*$'"
```

## exa-tree

Zastępuje polecenie `tree` polecenie `exa`

```bash
alias exa-tree="$HOME/bin/exa-tree"
```

```bash
exa -l -a -h -g --git --tree"
```

## cleartemp

Czyści pliki / katalogi tymczasowe

```bash
alias cleartemp="$HOME/bin/cleartemp"
```

```bash
#!/usr/bin/env bash

find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

------

# Kopie zapasowe

## backup-dir

Link do skryptu `$HOME/bin/backup-dir`

```bash
alias backup-dir="$HOME/bin/backup-dir"
```

Skrypt wykonuje kopię zapasową bieżącego katalogu wraz z możliwością szyfrowania
za pomocą PGP


```bash
#!/usr/bin/env bash

XZ_OPT=-8
SHRED=$(which shred)
DATA=$(date +%y%m%d-%H%M)
cd $(readlink -f "$PWD")
DIR=$(basename "$PWD")
cd ..
tar -cJf "$DIR"-"$DATA".txz -C . "$DIR"
echo "Zapisano $DIR-$DATA.txz w katalogu: $PWD"

echo -n "Zaszyfrować plik? (t/N): "
read szyfrowanie

case $szyfrowanie in
    t|T)
        gpg -c "$DIR"-"$DATA".txz
        echo "Zapisano "$DIR"-"$DATA".txz.gpg w katalogu "$PWD""
        if [ $SHRED ]; then
            shred "$DIR"-"$DATA".txz
        else
            rm "$DIR"-"$DATA".txz
        fi
        ;;
     *)
        ;;
esac
```
------

# System plików / pamięć

## df

Wyświetla wolną przestrzeń na dyskach w bardziej ludzki sposób

```bash
alias df="df -h"
```

## dfr

```bash
alias dfr="df -h /"
```

## free

Wyświetla informacje dotyczące pamięci operacyjnej RAM i pliku wymiany w bardziej ludzki sposób

```bash
alias free="free -m"
```

## cryptsetup

```bash
alias cryptsetup="sudo cryptsetup"
```

------

# ROFI / dmenu

## books

Menu rofi z listą książek z katalog `$HOME/Books`

```bash
alias books="$HOME/bin/books"
```

```bash
#!/usr/bin/env bash

APP=zathura
BOOKS_DIR=~/Books

BOOK="$( cd $BOOKS_DIR; find * -name \*.pdf -print | rofi -dmenu \
        -i -l 20 -matching glob -p "Books ($APP)" )"

if [ -n "$BOOK" ]; then
    $APP $BOOKS_DIR/"$BOOK"
fi
```

## menu

Skrypt wyświetlający podręczne menu rofi

```bash
alias menu="$HOME/bin/menu"
```

```bash
#!/bin/sh

menu=$(echo -e "Suspend\nReboot
Monitor Off
Pulseaudio restart
bspwm reload
sxhkd restart
Polybar restart
Books
Wyczyść hasło do agenta GPG
Pass ROFI\nWyczyść historię schowka
Edit Menu" | rofi -lines 28 -dmenu -i -p "Wybierz coś")

[ "$menu" == "Suspend" ] && sudo /usr/bin/systemctl suspend

[ "$menu" == "Reboot" ] && sudo reboot

if [ "$menu" == "Monitor Off" ]; then
    notify-send "Za kilka chwil wyłączę monitor..."
    sleep 1
    xset dpms force off
fi

if [ "$menu" == "Pulseaudio restart" ]; then
    pacmd exit
    sleep 1
    pulseaudio --start
fi

if [ "$menu" == "bspwm reload" ]; then
    ~/.config/bspwm/bspwmrc
    if [ $? == 0 ]; then
        rofi -e "Przeładowałem bspwm"
    fi
fi

if [ "$menu" == "sxhkd restart" ]; then
    pkill -USR1 -x sxhkd
    if [ $? == 0 ]; then
        rofi -e "Ustawienia sxhkd zostały przeładowane"
    fi
fi

[ "$menu" == "Wyczyść hasło do agenta GPG" ] && gpg-connect-agent reloadagent /bye

[ "$menu" == "Wyczyść historię schowka" ] && $HOME/bin/clipdel -d ".*"

[ "$menu" == "Pass ROFI" ] && $HOME/bin/passr

[ "$menu" == "Books" ] && $HOME/bin/books

if [ "$menu" == "Polybar restart" ]; then
    pkill polybar
    sleep 3
    polybar example
fi

if [ "$menu" == "Edit Menu" ]; then
    st -e vim ~/bin/menu
fi
```

------

# Skróty do programów

## c

Czyści ekran

```bash
alias c="clear"
```

## ff

Uruchamia Firefoxa

```bash
alias ff="firefox"
```

## h

Uruchamia polecenie `history`

```bash
alias h="history"
```

## man

Uruchamia stronę podręcznika man przez edytor Vim

```bash
alias man="$HOME/bin/man-vim.sh"
```

```bash
#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    /usr/bin/man
else
    if man -w $* >/dev/null 2>/dev/null; then
        /usr/bin/man $* |col -b|vim -u $HOME/.vim/man.vim -
    else
        echo "Brak strony: $*"
    fi
fi
```

Konfiguracja dla Vim w pliku `~/.vim/man.vim`

```vim
source $VIMRUNTIME/defaults.vim
syntax on
set ft=man
colo industry
set background=dark
set buftype=nofile

" mapowanie klawiszy
nmap q :q<cr>
nmap Q :q<cr>
map n nzz
map N Nzz
map d <c-d>
map u <c-u>
```

## more

Zastępuje program `more` programem `less`

```bash
alias more="less"
```

## n

Uruchamia edytor neovim

```bash
alias n="nvim"
```

## q

Uruchamia polecenie `exit`

```bash
alias q=exit
```

## so

Uruchamia polecenie `source`

```bash
alias so=source
```

## svim

```bash
alias svim="sudo vim"
```

## t

Uruchamia polecenie `tmux`

```bash
alias t=tmux
```

## ta

Uruchamia polecenie `tmux atta`

```bash
alias ta="tmux atta"
```

## v

Uruchamia program `vim`

```bash
alias v=vim
```

## vim

Alias do `vim`

```bash
alias vim="vim"
```

------

# Procesy

## k

Alias dla polecenia `kill`

```bash
alias k="kill"
```

## pg

Wyszukuje procesów uruchamiając skrypt `$HOME/bin/psgrep`

```bash
alias pg="$HOME/bin/psgrep"
```

Źródło:

```bash
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

Przykład:

```bash
$ pg vim
```

## psgrep

Skrypt `$HOME/bin/psgrep`

```bash
alias psgrep="$HOME/bin/psgrep"
```

```bash
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

------

# Inne

## detect-os

Wyświetla nazwę i wersję dystrybucji - `$HOME/bin/detect-os`

```bash
alias detect-os="$HOME/bin/detect-os"
```


```bash
#!/usr/bin/env bash

shopt -s nocasematch

# Wykrywanie systemu Fedora
if [ -f /etc/fedora-release ]; then
    read -r fedora < /etc/fedora-release
    fedora_ver=$(echo "$fedora" | tr -cd '[:digit:][:cntrl:]')
    system="Fedora"
    system_full=$fedora
    system_ver=$fedora_ver
fi

# Wykrywanie systemu CentOS
if [ -f /etc/centos-release ]; then
    read -r centos < /etc/centos-release
    grep . /etc/centos-release > /dev/null
    if [ $? -eq 0 ]; then
        centos_ver=$(echo "$centos" | cut -d. -f1 | tr -cd '[:digit:][:cntrl:]')
    else
        centos_ver=$(echo "$centos" | tr -cd '[:digit:][:cntrl:]')
    fi
    system="CentOS"
    system_full=$centos
    system_ver=$centos_ver
fi

# Wykruwanie systemu Ubuntu
if [ -f /etc/lsb-release ]; then
    source /etc/lsb-release
    ubuntu=$DISTRIB_ID
    ubuntu_ver=$DISTRIB_RELEASE
    system="Ubuntu"
    system_full=$ubuntu
    system_ver=$ubuntu_ver
fi

case $1 in
    sys)
        echo $system
        ;;
    sys-full)
        echo $system_full
        ;;
    ver)
        echo $system_ver
        ;;
    *)
        echo
        echo "############################## POMOC #################################"
        echo
        echo Dostępne parametry:
        echo
        echo "$(basename $0) sys      - wyświetla nazwę dystrybucji"
        echo "$(basename $0) sys-full - wyśweitla nazwę dystrybucji i wersję systemu"
        echo "$(basename $0) ver      - wyświetla wersję systemu"
        echo
        echo
        "###########################################################################"
        echo
esac
```

## fullhd

Ustawia rozdzielczość Full HD

```bash
alias fullhd="$HOME/bin/fullhd"
```

```bash
#!/usr/bin/env bash


MONITOR=$(xrandr | grep primary | cut -f 1 -d ' ')

xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode $MONITOR 1920x1080
xrandr --output $MONITOR --mode 1920x1080
# xrandr --output $MONITOR --mode $(xrandr|grep -P '^ '|cut -f 4 -d ' '|dmenu)
```

------

# Git

## g

Uruchamia polecenie `git`

```bash
alias g="git"
```

## ga

Uruchamia skrypt `$HOME/bin/ga`

```bash
alias ga="$HOME/bin/ga"
```

Źródło:

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

git add -A && git commit -m $DATA
```

## gd

Uruchamia polecenie `git diff`

```bash
alias gd="$HOME/bin/gd"
```

```bash
#!/usr/bin/env bash

git diff
```

## gdiff

Uruchamia polecenie `git diff`

```bash
alias gd="$HOME/bin/gd"
```

```bash
#!/usr/bin/env bash

git diff
```

## gl

Uruchamia skrypt `$HOME/bin/gl` - wyświetlający zmiany w repozytorium Git

```bash
alias gl="$HOME/bin/gl"
```

Źródło:

```bash
git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
```

## gp

Uruchamia skrypt `$HOME/bin/gp`

```bash
alias gp="$HOME/bin/gp"
```

Skrypt w zależności od nazwy z jaką go wywołujemy uruchamia polecenia:

- `git add -A`
- `git commit`
- `git push`

W wersji `gps` jest podpisywany commit za pomocą klucza GPG

Źródło:

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

## gps

Uruchamia skrypt `$HOME/bin/gps` który jest linkiem symbolicznym do pliku `$HOME/bin/gp`

```bash
alias gps="$HOME/bin/gps"
```

Skrypt w zależności od nazwy z jaką go wywołujemy uruchamia polecenia:

- `git add -A`
- `git commit`
- `git push`

W wersji `gps` jest podpisywany commit za pomocą klucza GPG

Źródło

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

## gsts

Uruchamia skrypt `$HOME/bin/gsts`

```bash
alias gsts="$HOME/bin/gsts"
```

```bash
#!/usr/bin/env bash

git status
```

## pu

Uruchamia polecenie `git pull`

```bash
alias pu="$HOME/bin/pu"
```

```bash
#!/usr/bin/env bash

git pull
```

## push

Uruchamia polecenie `git push`

```bash
alias push="$HOME/bin/push"
```

```bash
#!/usr/bin/env bash

git push
```

------

# Szyfrowanie / hasła

## otp-add

Dodaje skrót HASH do bazy `pass`

```bash
alias otp-add="$HOME/bin/otp-add"
```

```bash
#!/usr/bin/env bash

if [ -z $1 ]; then
    echo
    echo Podaj nazwę konta.
    echo
else
    NAZWA=$(echo "$@" | tr ' ' '-')
    pass edit otp/$NAZWA
fi
```

## otp

Wyświetla kod jednorazowy, którego HASH jest przechowywany w bazie `pass`

```bash
alias otp="$HOME/bin/otp"
```

```bash
#!/usr/bin/env bash

oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
```

## p

Uruchamia program `gopass` bez zapisywania polecenia w historii

```bash
alias p=" gopass"
```

## pass

Uruchamia program `gopass` bez zapisywania polecenia w historii, służy do tego
znak spacji przed poleceniem.

```bash
alias pass=" gopass"
```

## passf

Uruchamia skrypt `$HOME/bin/passf`

```bash
alias passf="$HOME/bin/passf"
```

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | fzf --print-query --prompt "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

## passr

Uruchamia skrypt `$HOME/bin/passr`

```bash
alias passr="$HOME/bin/passr"
```

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | rofi -dmenu -i -p "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

## pwgen

Generuje hasła od długości 32 znaków

```bash
alias pwgen="$HOME/bin/pwgen.sh"
```

```bash
pwgen -c -s -n -y -1 32"
```

## dec

Deszyfruje plik za pomocą GPG

```bash
alias dec="$HOME/bin/DecryptGPG"
```

## enc

Szyfruje plik za pomocą GPG

```bash
alias enc="$HOME/bin/EncryptGPG"
```

## DecryptGPG

Skrypt deszyfrujący pliki PGP

```bash
alias DecryptGPG="$HOME/bin/DecryptGPG"
```

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do odszyfrowania.
    echo $ enc plik.txt
    return 1
fi
if [ ! -e "$1" ]; then
    echo Podany plik nie istnieje
else
    nazwa_pliku=$(basename "$1" .gpg)
    gpg2 -o "$nazwa_pliku" -d "$1"
fi
```

## DecryptSSL

Skrypt deszyfrujący pliki za pomocą OpenSSL

```bash
alias DecryptSSL="$HOME/bin/DecryptSSL"
```

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do odszyfrowania.
    echo $ dec plik.txt.enc
    return 1
fi
if [ ! -e $1 ]; then
    echo "Podany plik ($1) nie istnieje."
    return 1
else
    openssl aes-256-cbc -d -a -in "$1" -out $(basename $1 .enc);
fi
```

## EncryptGPG

Skrypt szyfrujący za pomocą PGP

```bash
alias EncryptGPG="$HOME/bin/EncryptGPG"
```

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do zaszyfrowania.
    echo $ enc plik.txt
    return 1
fi
if [ ! -e "$1" ]; then
    echo Podany plik nie istnieje
else
    gpg2 -c "$1"
fi

echo -n "Usunąć plik źródłowy? (t/N): "
read USUNAC

case $USUNAC in
    t)
        rm "$1"
        ;;
    *)
        ;;
esac
```

## EncryptSSL

Skrypt szyfrujący za pomocą SSL

```bash
alias EncryptSSL="$HOME/bin/EncryptSSL"
```

```bash
#!/usr/bin/env bash

if [[ $# < 1 ]]; then
    echo Podaj nazwę pliku do zaszyfrowania.
    echo $ enc plik.txt
    return 1
else
    if [ ! -e $1 ]; then
        echo Podany plik nie istnieje
    else
        openssl aes-256-cbc -a -salt -in "$1" -out "$1.enc";
    fi
fi
```

## vhdmk

Tworzy kontener

```bash
#!/usr/bin/env bash

# https://leewc.com/articles/how-to-set-up-virtual-disk-encryption-linux/

# sprawdź czy istnieje polecenie pv (pokazuje postęp tworzenia pliku obrazu)
# evhd - kontener szyfrowany
# vhd  - kontener bez szyfrowania

hash pv 2> /dev/null
if [ $? == 0 ]; then
    PV=yes
else
    PV=no
fi

read -r -p "Podaj wielkość kontenera w MB minimalna wartość to 20: "
WIELKOSC=$REPLY

read -r -p "Podaj nazwę kontenera: "
NAZWA_KONTENERA=$REPLY

read -r -p "Czy konterner ma być zaszyfrowany? [T/n]: "
SZYFROWANIE=$REPLY

case $SZYFROWANIE in
    t|T) SZYFROWANIE=yes ;;
    n|N) SZYFROWANIE=no  ;;
    *)   SZYFROWANIE=yes ;;
esac

function szyfrowanie() {
    if [ $PV == yes ]; then
        dd if=/dev/urandom iflag=fullblock | pv | dd of=$NAZWA_KONTENERA.evhd bs=1M count=$WIELKOSC iflag=fullblock
    else
        dd if=/dev/urandom of=$NAZWA_KONTENERA.evhd bs=1M count=$WIELKOSC
    fi
    sudo cryptsetup -y luksFormat $NAZWA_KONTENERA.evhd
    sudo cryptsetup luksOpen $NAZWA_KONTENERA.evhd $NAZWA_KONTENERA
    # ls -l /dev/mapper/your_mapping_name
    # sudo cryptsetup -v status $NAZWA_KONTENERA
    sudo mkfs.ext4 /dev/mapper/$NAZWA_KONTENERA
    mkdir $NAZWA_KONTENERA
    sudo mount /dev/mapper/$NAZWA_KONTENERA $NAZWA_KONTENERA
    # df -h
    # sudo chown myUserName /mnt/encryptedVolume
}

function bez_szyfrowania() {
    echo BEZ SZYFROWANIA
    dd if=/dev/zero of=$NAZWA_KONTENERA.vhd bs=1M count=$WIELKOSC
    mkfs.ext4 $NAZWA_KONTENERA.vhd
    mkdir -p $NAZWA_KONTENERA
    sudo mount -t auto -o loop $NAZWA_KONTENERA.vhd $NAZWA_KONTENERA
}

if [ $SZYFROWANIE == yes ]; then
    szyfrowanie
else
    bez_szyfrowania
fi
```

## vhdmount

```bash
#!/usr/bin/env bash

OBRAZ=$(fzf -q .vhd)

if [ -z $OBRAZ ]; then
    echo "Nie wybrałeś kontenera."
    exit
fi

NAZWA_KONTENERA=${OBRAZ%.*}

sudo cryptsetup luksOpen $OBRAZ $NAZWA_KONTENERA
ls -l /dev/mapper/$NAZWA_KONTENERA
sudo cryptsetup -v status $NAZWA_KONTENERA
mkdir -p $NAZWA_KONTENERA
sudo mount /dev/mapper/$NAZWA_KONTENERA $NAZWA_KONTENERA
# sudo chown myUserName /mnt/encryptedVolume
```

## vhdumount

```bash
#!/usr/bin/env bash

NAZWA_KONTENERA=$(find /dev/mapper/* | grep -v control | fzf)

if [ -z $NAZWA_KONTENERA ]; then
    echo "Nie wybrano kontenera."
    exit
fi

sudo cryptsetup -v status $NAZWA_KONTENERA
sudo umount $NAZWA_KONTENERA
sudo cryptsetup luksClose $NAZWA_KONTENERA
```

## clear-gpg-passwd

Czyści zapamiętane hasło przez agenta GPG

```bash
alias clear-gpg-passwd="$HOME/bin/clear-gpg-passwd"
```

```bash
gpg-connect-agent reloadagent /bye"
```

## gpg-agent-restart

Restartuje agenta GPG

```bash
alias gpg-agent-restart="$HOME/bin/gpg-agent-restart"
```

```bash
#!/usr/bin/env bash

gpg-connect-agent /bye
```

## gpg-delete-keys

Usuwa klucz z magazynu kluczy

```bash
alias gpg-delete-keys="$HOME/bin/gpg-delete-keys"
```

```bash
#!/usr/bin/env bash

gpg --delete-keys
```

## gpg-delete-secret-keys

Usuwa klucze prywatne z magazynu kluczy

```bash
alias gpg-delete-secret-keys="$HOME/bin/gpg-delete-secret-keys"
```

```bash
#!/usr/bin/env bash

gpg --delete-secret-keys
```

## gpg-edit-key

Edytuje wybrany klucz

```bash
alias gpg-edit-key="$HOME/bin/gpg-edit-key"
```

```bash
#!/usr/bin/env bash

gpg --edit-key
```

## gpg-export-secret-key

Eksportuje klucz prywatny

```bash
alias gpg-export-secret-key="$HOME/bin/gpg-export-secret-key"
```

```bash
#!/usr/bin/env bash

gpg --armor --export-secret-keys
```

## gpg-export

Eksportuj klucz publiczny

```bash
alias gpg-export="$HOME/bin/gpg-export"
```

```bash
#!/usr/bin/env bash

gpg --armor --export
```

## gpg-gen-key

Generuje parę kluczy PGP

```bash
alias gpg-gen-key="$HOME/bin/gpg-gen-key"
```

```bash
#!/usr/bin/env bash

gpg --default-new-key-algo rsa4096 --gen-key
```

## gpg-list-keys-short

Wyświetla listę kluczy w formacie SHORT

```bash
alias gpg-list-keys-short="$HOME/bin/gpg-list-keys-short"
```

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format SHORT
```

## gpg-list-keys

Wyświetla listę kluczy w formacie LONG

```bash
alias gpg-list-keys="$HOME/bin/gpg-list-keys"
```

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format LONG
```

## gpg-list-secret-keys-short

Wyświetla listę kluczy prywatnych w formacie SHORT

```bash
alias gpg-list-secret-keys-short="$HOME/bin/gpg-list-secret-keys-short"
```

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format SHORT
```

## gpg-list-secret-keys

Wyświetla listę kluczy prywatnych w formacie LONG

```bash
alias gpg-list-secret-keys="$HOME/bin/gpg-list-secret-keys"
```

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format LONG
```

------

# systemctl, zarządzanie energią

## suspend

Usypia komputer

```bash
alias suspend="sudo systemctl suspend"
```

## sysdis

Deaktywuje usługę

```bash
alias sysdis="sudo systemctl disable"
```

## sysena

Aktywuje usługę

```bash
alias sysena="sudo systemctl enable"
```

## sysstart

Uruchamia usługę

```bash
alias sysstart="sudo systemctl start"
```

## sysstop

Zatrzymuje usługę

```bash
alias sysstop="sudo systemctl stop"
```

## reboot

```bash
alias reboot="sudo reboot"
```

## batt

Wyświetlenie stanu baterii laptopa

```bash
alias batt="$HOME/bin/batt"
```

```bash
#!/usr/bin/env bash

upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
```

------

# Wyszukiwanie i przeszukiwanie

## rgvi

Uruchamia skrypt `$HOME/bin/rgvi`

```bash
alias rgvi="$HOME/bin/rgvi"
```

```bash
#!/usr/bin/env bash

SEARCH=$(sk --ansi -i -c 'rg --color=always --hidden --line-number "{}"' \
    --bind "ctrl-p:toggle-preview" --preview "preview.sh {}" \
    --preview-window=down:50%:hidden)
readarray -td: array <<<"$SEARCH"
FILE=${array[0]}
LINE=${array[1]}
ARRAY_NOE=${#array[@]}
if [ $ARRAY_NOE -gt 1 ]; then
    vim $FILE +$LINE
fi
```

## se

Skrypt `se` przeszukuje bieżący katalog pod kątem plików i katalogów,
wyświetlając na podglądzie zawartość plików, w przypadku katalogów nie pokazuje
ich zawartości.

Skrypt `se` po wyborze pliku / katalogu otwiera jego zawartość w edytorze Vim.

```bash
alias se="$HOME/bin/se"
```

```bash
#!/usr/bin/env bash

BAT=$(which bat)
PREVIEW_SH=$(which preview.sh)
if [ ! -z $BAT ]; then
    PREVIEW="bat --style=numbers --color=always {}"
elif [ ! -z $PREVIEW_SH ]; then
    PREVIEW="preview.sh {}"
else
    echo "Brak programu 'bat' i skryptu 'preview.sh', należy doinstalować jeden z nich"
    exit
fi
 SEARCH=$(fd . --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=down:50%)
[[ $SEARCH ]] && vim $SEARCH
```

## sedi

Skrypt `sedi` przeszukuje bieżący katalog pod kątem katalogów, wyświetlając na
podglądzie drzewo podkatalogów.

Skrypt `sedi` po wyborze katalogu otwiera jego zawartość w edytorze Vim.

```bash
alias sedi="$HOME/bin/sedi"
```

```bash
#!/usr/bin/env bash

PREVIEW=$(which preview_dir.sh)

if [ ! -z $PREVIEW ]; then
    PREVIEW="preview_dir.sh {}"
else
    echo "Brak skryptu 'preview_dir.sh', należy doinstalować jeden z nich"
    exit
fi

SEARCH=$(fd . -t d --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=down:50%)

[[ $SEARCH ]] && vim $SEARCH
```

## sefi

Skrypt `sefi` przeszukuje bieżący katalog pod kątem plików, wyświetlając na
podglądzie ich zawartość.

Skrypt `sefi` po wyborze pliku otwiera jego zawartość w edytorze Vim.

```bash
alias sefi="$HOME/bin/sefi"
```

```bash
#!/usr/bin/env bash

BAT=$(which bat)
PREVIEW_SH=$(which preview.sh)
if [ ! -z $BAT ]; then
    PREVIEW="bat --style=numbers --color=always {}"
 elif [ ! -z $PREVIEW_SH ]; then
    PREVIEW="preview.sh {}"
else
    echo "Brak programu 'bat' i skryptu 'preview.sh', należy doinstalować jeden z nich"
    exit
fi
SEARCH=$(fd . -t f --ignore-file .gitignore | sk --exact --tac --prompt="Wyszukaj: " \
    --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
    --preview-window=down:50%)
[[ $SEARCH ]] && vim $SEARCH
```

## vf

Skrypt `$HOME/bin/vf`

```bash
alias vf="$HOME/bin/vf"
```

```bash
#!/usr/bin/env bash

sk | xargs -r -I % $EDITOR %
```

## vs

Skrypt `vs` uruchamia w bieżącej lokalizacji polecenie `fzf` z podglądem plików,
po wybraniu pliku automatycznie jest uruchamiany edytor Vim.

```bash
alias vs="$HOME/bin/vs"
```

```bash
#!/usr/bin/env bash

# export FZF_DEFAULT_COMMAND='rg --files --ignore --hidden'
# vim $(rg --files --hidden --follow --glob '!venv'|fzf)
if [[ $# == 0 ]]; then

    if [ -f $(which bat) ]; then
        vim "$(fzf -e --preview 'bat --style=numbers --color=always {} | head -500')"
    else
        # vim $(fzf)
        # vim "$(find * | fzf +s --tac)"
        vim "$(fzf -e --preview 'cat {}')"
    fi
else
    vim "$@"
fi
```

## last-edit

Pokazuje ostatnio edytowane pliki

```bash
alias last-edit="$HOME/bin/last-edit"
```

```bash
#!/usr/bin/env bash

find $HOME -type f -mtime -3 -mtime +4
find $HOME -type f -mtime -3
```

## open-with-fzf

Uruchamia skrypt `/home/t3/bin/open-with-fzf`

```bash
alias open-with-fzf="$HOME/bin/open-with-fzf"
```

```bash
#!/usr/bin/env bash

fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
```

## fdh

Uruchamia polecenie `fd` z parametrem `--hidden`

```bash
alias fdh="fd --hidden"
```

## rgh

Uruchamia program `rg` z parametrem `--hidden`

```bash
alias rgh="rg --hidden"
```

------

# Notatki

## wiki

Przeszukuje katalog `$VIMWIKI` po wybraniu otwiera w edytorze Vim

```bash
alias wiki="$HOME/bin/wiki"
```

```bash
#!/usr/bin/env bash

VIMWIKI=$HOME/vimwiki

BAT=$(which bat)
PREVIEW_SH=$(which preview.sh)

if [ ! -z $BAT ]; then
    PREVIEW="bat --style=numbers --color=always {}"
elif [ ! -z $PREVIEW_SH ]; then
    PREVIEW="preview.sh {}"
else
    echo "Brak programu 'bat' i skryptu 'preview'"
    exit
fi


function wiki_find() {
    cd $VIMWIKI
    SEARCH=$(fd --type f | sk --exact --tac --prompt="Wyszukaj pliku: " \
        --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
        --preview-window=down:50%)
    [[ $SEARCH ]] && vim $SEARCH
}

function wiki_grep() {
    cd $VIMWIKI
    SEARCH=$(sk --ansi -i -c 'rg --color=always --line-number "{}"' \
        --bind "ctrl-p:toggle-preview" --preview "preview.sh {}" \
        --preview-window=down:50%)
    readarray -td: array <<<"$SEARCH"
    FILE=${array[0]}
    LINE=${array[1]}
    ARRAY_NOE=${#array[@]}
    if [ $ARRAY_NOE -gt 1 ]; then
        vim $FILE +$LINE
    fi
}

function help() {
    echo
    echo "$(basename $0) - bez parametru włącza Index Vimwiki"
    echo "$(basename $0) g / grep - przeszukuje pliki"
    echo "$(basename $0) f / find - szuka plików"
    echo
}

if [ $# -eq 0 ]; then
    vim -c :VimwikiIndex
elif [[ ($1 == "-g") || ($1 == "g") || ($1 == "grep") ]]; then
    wiki_grep
elif [[ ($1 == "-f") || ($1 == "f") || ($1 == "find") ]]; then
    wiki_find
elif [[ ($1 == "-h") || ($1 == "--help") || ($1 == "h" ) ]]; then
    help
fi
```

## diary

Uruchamia dziennik na bieżący dzień

```bash
alias diary="$EDITOR -c :VimwikiMakeDiaryNote"
```

```
:VimwikiMakeDiaryNote
```

## diary-before

Uruchamia dziennik na poprzedni dzień

```bash
alias diary-before="$EDITOR -c :VimwikiMakeYesterdayDiaryNote"
```

## diary-next

Uruchamia dziennik na następny dzień


```bash
alias diary-next="$EDITOR -c :VimwikiMakeTomorrowDiaryNote"
```

## diary-index

Uruchamia listę dzienników

```bash
alias diary-index="$EDITOR -c :VimwikiDiaryIndex"
```

## no

Otwiera edytor Vim w lokalizacji `$HOME/notes`

```bash
alias no='$EDITOR -c "e $HOME/notes"'
```

## td

Otwiera plik zawarty w zmiennej `$TODO` znajdującej się w pliku `.vars`

```bash
alias td="$EDITOR $TODO"
```
