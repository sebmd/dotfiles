# Bin

Opis zawartości katalogu `~/bin`

- `backup_dir`
- `cdb`
- `cd_fzf`
- `cleartemp`
- `create_symlinks`
- `DecryptGPG`
- `DecryptSSL`
- `EncryptGPG`
- `EncryptSSL`
- `funkcje`
- `fzf` - fuzzy finder (plik binarny)
- `ga`
- `gp`
- `last_edit`
- `lf` - menadżer plików (plik binarny)
- `open_with_fzf`
- `otp`
- `otp_add`
- `passf`
- `passr`
- `psgrep`
- `pu`
- `rg` - ripgrep - zastępuje program `grep` (plik binarny)
- `rgvi`
- `se`
- `suspend`
- `vf`
- `vim_docs`
- `vim_notes`
- `vs`

# Funkcja backup_dir

```
function backup_dir() {
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
}
```

# Funkcja cd_fzf

```
function cd_fzf() {
    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" \
        --bind="space:toggle-preview" --preview-window=:hidden)"
}
```

# Funkcja cdb

```
function cdb() {
    KATALOG="$(cat ~/.config/bmdirs|sk|sed "s|~|$HOME|")"
    cd -P -- "$KATALOG"
}
```

# Funkcja cleartemp

```
function cleartemp() {
    find -L ~/tmp -type f -mtime +7 -print -exec rm {} \;
    find -L ~/tmp -type d -mtime +7 -exec rmdir --ignore-fail-on-non-empty {} \;
}
```

# Funkcja DecryptGPG

```
function DecryptGPG() {
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
}
```

# Funkcja DecryptSSL
```
function DecryptSSL () {
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
}
```

# Funkcja EncryptGPG
```
function EncryptGPG () {
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
}
```

# Funkcja EncryptSSL
```
function EncryptSSL () {
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
}
```

# Funkcja ga
```
function ga() {
    git add -A && git commit -m $DATA
}
```

# Funkcja gp
```
function gp() {
    git add -A && git commit -m $DATA && git push
}
```

# Funkcja last_edit
```
function last_edit() {
    find $HOME -type f -mtime -3 -mtime +4
    find $HOME -type f -mtime -3
}
```

# Funkcja open_with_fzf
```
function open_with_fzf() {
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
```

# Funkcja otp
```
function otp() {
    oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
}
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
