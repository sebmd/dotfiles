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

Edycja aliasów `$HOME/.aliases`

```bash
 vim $HOME/.aliases && source $HOME/.aliases
```

## .ala

Edycja pliku konfiguracyjnego alacritty `$HOME/.config/alacritty/alacritty.yml`

## .b

Edycja pliku `$HOME/.bashrc`

```bash
vim $HOME/.bashrc
```

## .bs

Edycja pliku BSPWM `$HOME/.config/bspwm/bspwmrc`

```bash
vim $HOME/.config/bspwm/bspwmrc
```

## .df

Wyszukuje pliku konfiguracyjnego z listy zamieszczonej w skrypcie `$HOME/bin/dotfiles`

## .g

Edycja pliku `$HOME/.gitconfig`

## .kh

Edycja pliku `$HOME/.ssh/known_hosts`

## .n

Edycja pliku konfiguracyjnego edytora Neovim

`$HOME/.config/nvim/init.vim`

## .nv

Edycja pliku konfiguracyjnego neovim `$HOME/.config/nvim/init.vim`

## .s

Edycja pliku `$HOME/.ssh/config`

```bash
vim $HOME/.ssh/config
```

## .sx

```bash
vim $HOME/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd
```

## .t

Edycja pliku `$HOME/.tmux.comf`

```bash
vim $HOME/.tmux.conf
```

## .v

Edycja pliku edytora Vim

```bash
vim -c 'e \$MYVIMRC'
```

## .xr

Edycja pliku `$HOME/.Xresource` a następnie przeładowuje plik

## .z

Edycja pliku `$HOME/.zshrc`

```bash
vim $HOME/.zshrc
```

------

# Pakiety

## di

```bash
sudo dnf install
```

## dr

```bash
sudo dnf remove
```

## ds

Wyszukuje za pomocą FZF pakietów a następnie przechodzi do instalacji

```bash
$HOME/bin/ds
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
$HOME/bin/update
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
cd ../..
```

## ..

Przechodzi jeden katalog wyżej

```bash
cd ..
```

## .d

Przechodzi do katalogu `$HOME/git/dotfiles`

```bash
cd $HOME/git/dotfiles
```

## .git

Przechodzi do katalogu `$HOME/git`

## .h

Przechodzi do katalogu domowego `$HOME`

## .src

Przechodzi do katalogu `$HOME/src`

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
source ~/bin/cdb && cdb"
```

```bash
#!/usr/bin/env bash

KATALOG="$(cat ~/.config/bmdirs|fzf --prompt "PWD: $PWD> "|sed "s|~|$HOME|")"
[ ! -z $KATALOG ] && cd -P -- "$KATALOG"
```

## cdba

Dodatnie bieżącego katalogu do pliku `$HOME/.config/bmdirs`

```bash
source ~/bin/cdba && cdba"
```

```bash
#!/usr/bin/env bash

echo $PWD | sed "s|$HOME|~|" >> ~/.config/bmdirs
sort -o ~/.config/bmdirs ~/.config/bmdirs
```

## cdbd

Usunięcie bieżącego katalogu z pliku `$HOME/.config/bmdirs`

```bash
source ~/bin/cdbd && cdbd
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
vim ~/.config/bmdirs
```

## cdf

Poruszanie się pomiędzy katalogami za pomocą FZF

```bash
source $HOME/bin/cdf
```

```bash
#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -t d | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
fi
```

## dchmod

Nadaje odpowiednie uprawnienia dla katalogów `755`

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
exa -al --group-directories-first --git --header
```

## l

Jest to alias do `ll`

## f

Wyświetla liczbę katalogów w bieżącej lokalizacji

```bash
ls -A|wc -l
```

## md

Alias dla `mkcdir`

## mkcdir

Tworzy katalog a następnie przechodzi do niego

```bash
#!/usr/bin/env bash

KAT="$1"
mkdir -p "$KAT"
cd "$KAT"
```

## mkdir

```bash
mkdir -p
```

## lsx

Pokazuje pliki wykonywalne w bieżącej lokalizacji

```bash
ls -F | grep '*$'
```

## exa-tree

Zastępuje polecenie `tree` polecenie `exa`

```bash
exa -l -a -h -g --git --tree"
```

## cleartemp

Link do skryptu `$HOME/bin/cleartemp`

Czyści pliki tymczasowe

```bash
#!/usr/bin/env bash

find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

------

# Kopie zapasowe

## backup-dir

Link do skryptu `$HOME/bin/backup-dir`

Skrypt wykonuje kopię zapasową bieżącego katalogu wraz z możliwością szyfrowania
za pomocą PGP

------

# System plików / pamięć

## df

Wyświetla wolną przestrzeń na dyskach w bardziej ludzki sposób

```bash
df -h
```

## dfr

```bash
df -h /
```

## free

Wyświetla informacje dotyczące pamięci operacyjnej RAM i pliku wymiany w bardziej ludzki sposób

```bash
free -m
```

## cryptsetup

```bash
sudo cryptsetup
```

------

# ROFI / dmenu

## books

 Menu rofi z listą książek z katalog `$HOME/Books`

## menu

Skrypt wyświetlający podręczne menu rofi

------

# Skróty do programów

## c

Czyści ekran

```bash
clear
```

## ff

Uruchamia Firefoxa

```
firefox
```

## h

Uruchamia polecenie `history`

```bash
history
```

## more

Zastępuje program `more` programem `less`

## n

Uruchamia edytor neovim

## q

Uruchamia polecenie `exit`

## so

Uruchamia polecenie `source`

## svim

```bash
sudo vim
```

## t

Uruchamia polecenie `tmux`

## ta

Uruchamia polecenie `tmux atta`

## v

Uruchamia program `vim`

## vim

Alias do `vim`

------

# Procesy

## k

Alias dla polecenia `kill`

```bash
kill
```

## pg

Wyszukuje procesów uruchamiając skrypt `$HOME/bin/psgrep`

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
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

------

# Inne

## detect-os

Wyświetla nazwę i wersję dystrybucji - `$HOME/bin/detect-os`


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

------

# Git

## g

Uruchamia polecenie `git`

```bash
git
```

## ga

Uruchamia skrypt `$HOME/bin/ga`

```bash
~/bin/ga
```

Źródło:

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

git add -A && git commit -m $DATA
```

## gd

Uruchamia polecenie `git diff`

## gdiff

Uruchamia polecenie `git diff`

## gl

Uruchamia skrypt `$HOME/bin/gl` - wyświetlający zmiany w repozytorium Git

Źródło:

```bash
git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
```

## gp

Uruchamia skrypt `$HOME/bin/gp`

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
git status
```

## pu

Uruchamia polecenie `git pull`

## push

Uruchamia polecenie `git push`

------

# Szyfrowanie / hasła

## otp-add

Dodaje skrót HASH do bazy `pass`

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
#!/usr/bin/env bash

oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
```

## p

Uruchamia program `gopass` bez zapisywania polecenia w historii

## pass

Uruchamia program `gopass` bez zapisywania polecenia w historii

## passf

Uruchamia skrypt `$HOME/bin/passf`

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | fzf --print-query --prompt "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

## passr

Uruchamia skrypt `$HOME/bin/passr`

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | rofi -dmenu -i -p "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

## pwgen

Generuje hasła od długości 32 znaków


```bash
pwgen -c -s -n -y -1 32"
```

## dec

Deszyfruje plik za pomocą GPG

```bash
$HOME/bin/DecryptGPG
```

## enc

Szyfruje plik za pomocą GPG

```bash
$HOME/bin/EncryptGPG
```

## DecryptGPG

Skrypt deszyfrujący pliki PGP

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

## clear-gpg-passwd

Czyści zapamiętane hasło przez agenta GPG

```bash
gpg-connect-agent reloadagent /bye"
```

## gpg-agent-restart

Restartuje agenta GPG

```bash
#!/usr/bin/env bash

gpg-connect-agent /bye
```

## gpg-delete-keys

Usuwa klucz z magazynu kluczy

```bash
#!/usr/bin/env bash

gpg --delete-keys
```

## gpg-delete-secret-keys

Usuwa klucze prywatne z magazynu kluczy

```bash
#!/usr/bin/env bash

gpg --delete-secret-keys
```

## gpg-edit-key

Edytuje wybrany klucz

```bash
#!/usr/bin/env bash

gpg --edit-key
```

## gpg-export-secret-key

Eksportuje klucz prywatny

```bash
#!/usr/bin/env bash

gpg --armor --export-secret-keys
```

## gpg-export

Eksportuj klucz publiczny

```bash
#!/usr/bin/env bash

gpg --armor --export
```

## gpg-gen-key

Generuje parę kluczy PGP

```bash
#!/usr/bin/env bash

gpg --default-new-key-algo rsa4096 --gen-key
```

## gpg-list-keys-short

Wyświetla listę kluczy w formacie SHORT

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format SHORT
```

## gpg-list-keys

Wyświetla listę kluczy w formacie LONG

```bash
#!/usr/bin/env bash

gpg --list-keys --keyid-format LONG
```

## gpg-list-secret-keys-short

Wyświetla listę kluczy prywatnych w formacie SHORT

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format SHORT
```

## gpg-list-secret-keys

Wyświetla listę kluczy prywatnych w formacie LONG

```bash
#!/usr/bin/env bash

gpg --list-secret-keys --keyid-format LONG
```

------

# systemctl, zarządzanie energią

## suspend

Usypia komputer

```bash
sudo systemctl suspend
```

## sysdis

Deaktywuje usługę

```bash
sudo systemctl disable
```

## sysena

Aktywuje usługę

```bash
sudo systemctl enable
```

## sysstart

Uruchamia usługę

```bash
sudo systemctl start"
```

## sysstop

Zatrzymuje usługę

```bash
sudo systemctl stop"
```

## reboot

```bash
sudo reboot
```

## batt

Wyświetlenie stanu baterii laptopa

```bash
$HOME/bin/batt
```

------

# Wyszukiwanie i przeszukiwanie

## rgvi

Uruchamia skrypt `$HOME/bin/rgvi`

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

Skrytp `$HOME/bin/vf`

```bash
#!/usr/bin/env bash

sk | xargs -r -I % $EDITOR %
```

## vs

Skrypt `vs` uruchamia w bieżącej lokalizacji polecenie `fzf` z podglądem plików,
po wybraniu pliku automatycznie jest uruchamiany edytor Vim.

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

## open-with-fzf

Uruchamia skrypt `/home/t3/bin/open-with-fzf`

## fdh

Uruchamia polecenie `fd` z parametrem `--hidden`

------

# Notatki

## wiki

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

```
:VimwikiMakeDiaryNote
```

## diary-before

Uruchamia dziennik na poprzedni dzień

```
diary-before="$EDITOR -c :VimwikiMakeYesterdayDiaryNote"
```

## diary-next

Uruchamia dziennik na następny dzień

```
alias diary-next="$EDITOR -c :VimwikiMakeTomorrowDiaryNote"
```

## diary-index

Uruchamia listę dzienników

```
alias diary-index="$EDITOR -c :VimwikiDiaryIndex"
```

## no

Otwiera edytor Vim w lokalizacji `$HOME/notes`

```bash
vim -c "e $HOME/notes"
```

## td

```
alias td="$EDITOR $TODO"
```
