# BIN

Opis zawartości katalogu `~/bin`

- `backup-dir` - skrypt wykonuje kopię zapasową bieżącego katalogu
- `batt` - pokazuje stan baterii laptopa
- `cdb` - wyświetla listę katalogów znajdujących się w pliku `~/.config/bmdirs`, po wybraniu katalogu przechodzi do niego
- `cdba` - dodaje bieżący katalog do `~/.config/bmdirs`
- `cdbd` - usuwa bieżący katalog z pliku `~/.config/bmdirs`
- `cdbe` - włącza edycję pliku `~/.config/bmdirs`
- `cdf`
- `clear-gpg-passwd`
- `cleartemp`
- `create_symlinks`
- `DecryptGPG`
- `DecryptSSL`
- `EncryptGPG`
- `EncryptSSL`
- `fullhd` - ustawia rozdzielczość ekranu na Full HD
- `funkcje` - przestarzały skrypt tworzący linki symboliczne dla dostępnych funkcji
- `ga` - skrót dla `git add ; git commit`
- `gd` - git diff
- `gl` - git log
- `gp` - skrót dla `git add ; git commit ; git push`
- `gpg-agent-restart`
- `gpg-delete-keys`
- `gpg-delete-secret-keys`
- `gpg-edit-key`
- `gpg-export`
- `gpg-export-secret-key`
- `gpg-gen-key`
- `gpg-list-keys`
- `gpg-list-keys-short`
- `gpg-list-secret-keys`
- `gpg-list-secret-keys-short`
- `gps`
- `gsts`
- `last-edit`
- `ll`
- `mkcdir`
- `open-with-fzf`
- `otp`
- `otp-add`
- `passf`
- `passr`
- `preview.sh` - przydatny przy podglądzie plików
- `prv_dir.sh`
- `psgrep`
- `pu` - skrót dla `git pull`
- `push` - skrót dla `git push`
- `pwgen` - generator haseł z odpowiednimi parametrami
- `rgvi`
- `se`
- `sedi`
- `sefi`
- `suspend`
- `tree`
- `vf`
- `vim_docs`
- `vim_notes`
- `vs`

# Skrypt backup-dir

Skrypt wykonuje kopię zapasową bieżącego katalogu daje możliwość zaszyfrowania
pliku hasłem.

```
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

# Skrypt batt

Skrypt batt pokazuje stan baterii

 ```
    state:               fully-charged
    percentage:          99%
```


```
#!/usr/bin/env bash

upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"
```

# Skrypt cdf

```
#!/usr/bin/env bash

cd $HOME
KATALOG="$(fd -t d | fzf --preview="fd --full-path {}")"

if [ ! -z $KATALOG ]; then
    cd "$KATALOG"
fi
```

# Funkcja cdb

```
function cdb() {
    KATALOG="$(cat ~/.config/bmdirs|sk|sed "s|~|$HOME|")"
    cd -P -- "$KATALOG"
}
```

# Funkcja cdba

Dodaje bieżący katalog do ~/.config/bmdirs

```
function cdba() {
    echo $PWD | sed "s|$HOME|~|" >> ~/.config/bmdirs
    sort -o ~/.config/bmdirs ~/.config/bmdirs
}
```

# Skrypt cdbd

Usuwa bieżący katalog z `~/.config/bmdirs`

```
function cdbd() {
    KATALOG=$(echo $PWD | sed "s|$HOME|~|")
    sed -i "s|^$KATALOG$||" ~/.config/bmdirs
    sed -i '/^$/d'  ~/.config/bmdirs
}
```

# Skrypt cleartemp

Usuwa pliki i katalogi starsze niż 7 dni

```
find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
```

# Skrypt DecryptGPG

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

# Skrypt DecryptSSL

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

# Skrypt EncryptGPG

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

# Skrypt EncryptSSL

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

# Skrypt ga

```
git add -A && git commit -m $DATA
```

# Skrypt gp

```bash
DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

# Skrypt gps

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

# Skrypt last-edit

```bash
find $HOME -type f -mtime -3 -mtime +4
find $HOME -type f -mtime -3
```

# Skrypt open-with-fzf

```
fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
```

# Skrypt otp

Skrypt generuje kod jednorazowy pobierając HASH z magazynu programu `pass`.

```
oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
```

# Funkcja otp_add
```
function otp_add() {
    if [ -z $1 ]; then
        echo
        echo Podaj nazwę konta.
        echo
    else
        nazwa=$(echo "$@" | tr ' ' '-')
        pass edit otp/$nazwa
    fi
}
```

# Funkcja passf
```
function passf() {
    pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | fzf --print-query --prompt "Szukaj w bazie PASS") | tr -d '\n' | xclip
}
```

# Funkcja passr
```
function passr() {
    pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | rofi -dmenu -i -p "Szukaj w bazie PASS") | tr -d '\n' | xclip
}
```

# Funkcja psgrep
```
function psgrep() {
    ps ax | grep -i "$1" | grep -v grep
}
```

# Funkcja pu
```
function pu() {
    git pull
}
```

# Funkcja rgvi
```
function rgvi() {
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
}
```

# Funkcja se
```
function se() {
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
    SEARCH=$(fd . ~/bin/ | sk --exact --tac --prompt="Wyszukaj: " \
        --ansi --bind "ctrl-p:toggle-preview" --preview "$PREVIEW" \
        --preview-window=down:50%)
    [[ $SEARCH ]] && vim $SEARCH
    # vim "$(fd ~/bin/* | sk)"
    # vim "$(find ~/bin/* | fzf-tmux +s --tac)"
}
```

# Funkcja suspend
```
function suspend() {
    sudo systemctl suspend
}
```

# Funkcja vf
```
function vf() {
    sk | xargs -r -I % $EDITOR %
}
```

# Funkcja vim_docs
```
function vim_docs() {
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
}
```

# Funkcja vim_notes
```
function vim_notes() {
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
}
```

# Funkcja vs
```
function vs() {
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
}
```
