# Katalog ~/bin

<!-- vim-markdown-toc GFM -->

* [backup-dir](#backup-dir)
* [batt](#batt)
* [books](#books)
* [cdb](#cdb)
* [cdba](#cdba)
* [cdbd](#cdbd)
* [cdf](#cdf)
* [clear-gpg-passwd](#clear-gpg-passwd)
* [cleartemp](#cleartemp)
* [DecryptGPG](#decryptgpg)
* [DecryptSSL](#decryptssl)
* [detect-os](#detect-os)
* [EncryptGPG](#encryptgpg)
* [EncryptSSL](#encryptssl)
* [fullhd](#fullhd)
* [ga](#ga)
* [gd](#gd)
* [gl](#gl)
* [gp](#gp)
* [gpg-agent-restart](#gpg-agent-restart)
* [gpg-delete-keys](#gpg-delete-keys)
* [gpg-delete-secret-keys](#gpg-delete-secret-keys)
* [gpg-edit-key](#gpg-edit-key)
* [gpg-export](#gpg-export)
* [gpg-export-secret-key](#gpg-export-secret-key)
* [gpg-gen-key](#gpg-gen-key)
* [gpg-list-keys](#gpg-list-keys)
* [gpg-list-keys-short](#gpg-list-keys-short)
* [gpg-list-secret-keys](#gpg-list-secret-keys)
* [gpg-list-secret-keys-short](#gpg-list-secret-keys-short)
* [gps](#gps)
* [gsts](#gsts)
* [last-edit](#last-edit)
* [ll](#ll)
* [menu](#menu)
* [mkcdir](#mkcdir)
* [open-with-fzf](#open-with-fzf)
* [otp](#otp)
* [otp_add](#otp_add)
* [passf](#passf)
* [passr](#passr)
* [preview.sh](#previewsh)
* [preview_dir.sh](#preview_dirsh)
* [psgrep](#psgrep)
* [pu](#pu)
* [push](#push)
* [pwgen](#pwgen)
* [rgvi](#rgvi)
* [se](#se)
* [sedi](#sedi)
* [sefi](#sefi)
* [tree](#tree)
* [vf](#vf)
* [vim-docs](#vim-docs)
* [vim-notes](#vim-notes)
* [vs](#vs)

<!-- vim-markdown-toc -->

# backup-dir

Skrypt wykonuje kopię zapasową bieżącego katalogu daje możliwość zaszyfrowania
pliku hasłem.

```bash
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
    t)
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

# batt

Skrypt batt pokazuje stan baterii

```
    state:               fully-charged
    percentage:          99%
```


```bash
#!/usr/bin/env bash

upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
```

# books

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

# cdb

```bash
#!/usr/bin/env bash

KATALOG="$(cat ~/.config/bmdirs|fzf --prompt "PWD: $PWD> "|sed "s|~|$HOME|")"
[ ! -z $KATALOG ] && cd -P -- "$KATALOG"
```

# cdba

Dodaje bieżący katalog do ~/.config/bmdirs

```bash
#!/usr/bin/env bash

echo $PWD | sed "s|$HOME|~|" >> ~/.config/bmdirs
sort -o ~/.config/bmdirs ~/.config/bmdirs
```

# cdbd

Usuwa bieżący katalog z `~/.config/bmdirs`

```bash
#!/usr/bin/env bash

KATALOG=$(echo $PWD | sed "s|$HOME|~|")
sed -i "s|^$KATALOG$||" ~/.config/bmdirs
sed -i '/^$/d'  ~/.config/bmdirs
```

# cdf

```bash
#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -t d | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
fi
```

# clear-gpg-passwd

```bash
#!/usr/bin/env bash

gpg-connect-agent reloadagent /bye
```

# cleartemp

Usuwa pliki i katalogi starsze niż 7 dni

```bash
find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

# DecryptGPG

```bash
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

# DecryptSSL

```bash
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

# detect-os

Skrypt wykrywa dystrybucję oraz jej wersję

```
$ detect-os ver
32
```

```
$ detect-os sys
Fedora release 32 (Thirty Two)
```


```bash
#!/usr/bin/env bash

# Wykrywanie systemu Fedora
if [ -f /etc/fedora-release ]; then
    read -r fedora < /etc/fedora-release
    fedora_ver=$(echo "$fedora" | tr -cd '[:digit:][:cntrl:]')
    system=$fedora
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
    system=$centos
    system_ver=$centos_ver
fi

# Wykruwanie systemu Ubuntu
if [ -f /etc/lsb-release ]; then
    source /etc/lsb-release
    ubuntu=$DISTRIB_ID
    ubuntu_ver=$DISTRIB_RELEASE
    system=$ubuntu
    system_ver=$ubuntu_ver
fi

case $1 in
    SYS|sys)
        echo $system
        ;;
    VER|ver)
        echo $system_ver
        ;;
    *)
        echo
        echo "################## POMOC #####################"
        echo
        echo Dostępne parametry:
        echo
        echo $(basename $0) SYS - wyświetla nazwę dystrybucji
        echo $(basename $0) VER - wyświetla wersję systemu
        echo
        echo "##############################################"
        echo
esac
```

# EncryptGPG

```bash
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

# EncryptSSL

```bash
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

# fullhd

```bash
#!/usr/bin/env bash


MONITOR=$(xrandr | grep primary | cut -f 1 -d ' ')

xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode $MONITOR 1920x1080
xrandr --output $MONITOR --mode 1920x1080
```

# ga

```bash
git add -A && git commit -m $DATA
```

# gd

```bash
#!/usr/bin/env bash

git diff
```

# gl

Skrypt uruchamia polecenie `git log` z dodatkowymi parametrami.

```bash
#!/usr/bin/env bash

git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all
```

# gp

```bash
DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

# gpg-agent-restart

```bash
#!/usr/bin/env bash

gpg-connect-agent /bye
```

# gpg-delete-keys

```bash
#!/usr/bin/env bash

gpg --delete-keys
```

# gpg-delete-secret-keys

```bash
#!/usr/bin/env bash

gpg --delete-secret-keys
```

# gpg-edit-key

```bash
#!/usr/bin/env bash

gpg --edit-key
```

# gpg-export

```bash
#!/usr/bin/env bash

gpg --armor --export
```

# gpg-export-secret-key

```bash
#!/usr/bin/env bash

gpg --armor --export-secret-keys
```

# gpg-gen-key

```bash
#!/usr/bin/env bash

gpg --default-new-key-algo rsa4096  --gen-key
```

# gpg-list-keys

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format LONG
```

# gpg-list-keys-short

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format SHORT
```

# gpg-list-secret-keys

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format LONG
```

# gpg-list-secret-keys-short

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format SHORT
```

# gps

Skrypt `gps` jest linkiem symbolicznym do skryptu `gp`, uruchamiając go za
pomocą komendy `gps`, git będzie wymagał podpisania commita za pomocą klucza
PGP.

```bash
DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

# gsts

```bash
#!/usr/bin/env bash

git status
```

# last-edit

```bash
find $HOME -type f -mtime -3 -mtime +4
find $HOME -type f -mtime -3
```

# ll

```bash
#!/usr/bin/env bash

exa -al --group-directories-first --git --header
```

# menu

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

# mkcdir

```bash
#!/usr/bin/env bash

KAT="$1"
mkdir -p "$KAT"
cd "$KAT"
```

# open-with-fzf

```bash
fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
```

# otp

Skrypt generuje kod jednorazowy pobierając HASH z magazynu programu `pass`.

```bash
oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
```

# otp_add

```bash
if [ -z $1 ]; then
    echo
    echo Podaj nazwę konta.
    echo
else
    nazwa=$(echo "$@" | tr ' ' '-')
    pass edit otp/$nazwa
fi
```

# passf

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | fzf --print-query --prompt "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

# passr

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | rofi -dmenu -i -p "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

# preview.sh

Skrypt przydatny przy podglądzie plików spod programu `fzf`, źródło:
https://github.com/junegunn/fzf.vim/blob/master/bin/preview.sh

# preview_dir.sh

```bash
#!/usr/bin/env bash

KATALOG=$(readlink -f "$1")
/usr/bin/tree -L 1 $KATALOG
```

# psgrep

```bash
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

# pu

```bash
#!/usr/bin/env bash

git pull
```

# push

```bash
#!/usr/bin/env bash

git push
```

# pwgen

```bash
#!/usr/bin/env bash

pwgen -c -s -n -y -1 32
```

# rgvi

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

# se

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

# sedi

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

# sefi

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

# tree

```bash
#!/usr/bin/env bash

exa -l -a -h -g --git --tree
```

# vf

```bash
#!/usr/bin/env bash

sk | xargs -r -I % $EDITOR %
```


# vim-docs

```bash
#!/usr/bin/env bash

KATALOG=$HOME/docs/

if [ $# -gt 0 ]; then
    cd $KATALOG
    FILE=$(rg "$@" --ignore-file $KATALOG/.ignore | fzf | cut -d : -f 1)
    if [ -n "$FILE" ]; then
        vim "$FILE"
    fi
else
    echo Podaj conajmniej jeden parametr...
fi
```

# vim-notes

```bash
#!/usr/bin/env bash

cd ~/notes
SEARCH=$(sk --ansi -i -c 'rg --color=always --line-number "{}"' \
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

# vs

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
