# Aliasy

Aliasy są automatycznie ładowanie podczas uruchamiania powłoki `bash` jak i `zsh`.
Część aliasów to linki do skryptów w katalogu `~/bin`.

Wymagane dodatkowe oprogramowanie:

 - `fzf`
 - `ripgrep`
 - `skim`
 - `pass`
 - `rofi` / `dmenu`

<!-- vim-markdown-toc GFM -->

* [...](#)
* [..](#-1)
* [.a](#a)
* [.b](#b)
* [.bs](#bs)
* [.d](#d)
* [.g](#g)
* [.h](#h)
* [.nv](#nv)
* [.s](#s)
* [.sx](#sx)
* [.t](#t)
* [.v](#v)
* [.z](#z)
* [.xr](#xr)
* [backup-dir](#backup-dir)
* [batt](#batt)
* [cdb](#cdb)
* [cdba](#cdba)
* [cdbd](#cdbd)
* [cdbe](#cdbe)
* [cdf](#cdf)
* [clear-gpg-passwd](#clear-gpg-passwd)
* [cleartemp](#cleartemp)
* [dec](#dec)
* [DecryptGPG](#decryptgpg)
* [DecryptSSL](#decryptssl)
* [detect-os](#detect-os)
* [df](#df)
* [enc](#enc)
* [EncryptGPG](#encryptgpg)
* [EncryptSSL](#encryptssl)
* [f](#f)
* [ff](#ff)
* [free](#free)
* [fullhd](#fullhd)
* [g](#g-1)
* [ga](#ga)
* [gd](#gd)
* [gl](#gl)
* [gp](#gp)
* [gpg-agent-restart](#gpg-agent-restart)
* [gpg-delete-keys](#gpg-delete-keys)
* [gpg-delete-secret-keys](#gpg-delete-secret-keys)
* [gpg-edit-key](#gpg-edit-key)
* [gpg-export-secret-key](#gpg-export-secret-key)
* [gpg-export-key](#gpg-export-key)
* [gpg-list-keys-short](#gpg-list-keys-short)
* [gpg-list-keys](#gpg-list-keys)
* [gpg-list-secret-keys-short](#gpg-list-secret-keys-short)
* [gpg-list-secret-keys](#gpg-list-secret-keys)
* [gps](#gps)
* [h](#h-1)
* [l / ll](#l--ll)
* [last-edit](#last-edit)
* [lsx](#lsx)
* [menu](#menu)
* [mkcdir](#mkcdir)
* [more](#more)
* [n](#n)
* [no](#no)
* [nv](#nv-1)
* [open-with-fzf](#open-with-fzf)
* [otp-add](#otp-add)
* [otp](#otp)
* [p / pass](#p--pass)
* [passf](#passf)
* [passr](#passr)
* [pg](#pg)
* [psgrep](#psgrep)
* [pu](#pu)
* [push](#push)
* [pwgen](#pwgen)
* [q](#q)
* [rgvi](#rgvi)
* [se](#se)
* [sedi](#sedi)
* [sefi](#sefi)
* [so](#so)
* [suspend](#suspend)
* [sysdis](#sysdis)
* [sysena](#sysena)
* [sysstart](#sysstart)
* [sysstop](#sysstop)
* [t](#t-1)
* [ta](#ta)
* [tree](#tree)
* [v](#v-1)
* [vf](#vf)
* [vim-docs](#vim-docs)
* [vim-notes](#vim-notes)
* [vimrc / vrc](#vimrc--vrc)
* [vs](#vs)

<!-- vim-markdown-toc -->

# ...

Przechodzi dwa katalogi wyżej

```
cd ../..
```

# ..

Przechodzi jeden katalog wyżej

```
cd ..
```

# .a

Edycja aliasów `$HOME/.aliases`
 
 ```
 vim $HOME/.aliases && source $HOME/.aliases
 ```

# .b

Edycja pliku `$HOME/.bashrc`

```
vim $HOME/.bashrc
```

# .bs

Edycja pliku BSPWM `$HOME/.config/bspwm/bspwmrc`

```
vim $HOME/.config/bspwm/bspwmrc
```

# .d

Przechodzi do katalogu `$HOME/git/dotfiles`

```
cd $HOME/git/dotfiles
```

# .g

Edycja pliku `$HOME/.gitconfig`

# .h

Przechodzi do katalogu domowego `$HOME`

# .nv

Edycja pliku konfiguracyjnego neovim `$HOME/.config/nvim/init.vim`

# .s

Edycja pliku `$HOME/.ssh/config`

```
vim $HOME/.ssh/config
```

# .sx


```
vim $HOME/.config/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd
```

# .t

Edycja pliku `$HOME/.tmux.comf`

```
vim $HOME/.tmux.conf
```

# .v

Edycja pliku edytora Vim

```
vim -c 'e \$MYVIMRC'
```

# .z

Edycja pliku `$HOME/.zshrc`

```
vim $HOME/.zshrc
```

# .xr

Edycja pliku `$HOME/.Xresource` a następnie przeładowuje plik

# backup-dir

Link do skryptu `$HOME/bin/backup-dir`

Skrypt wykonuje kopię zapasową bieżącego katalogu wraz z możliwością szyfrowania
za pomocą PGP

#  batt

Wyświetlenie stanu baterii laptopa

```
$HOME/bin/batt
```

 # books

 Menu rofi z listą książek z katalog `$HOME/Books`

# cdb

Przechodzenie pomiędzy katalogami znajdującymi się w pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdb && cdb"
```

# cdba

Dodatnie bieżącego katalogu do pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdba && cdba"
```

# cdbd

Usunięcie bieżącego katalogu z pliku `$HOME/.config/bmdirs`

```
source ~/bin/cdbd && cdbd
```

# cdbe

Edycja pliku `$HOME/.config/bmdirs`

```
vim ~/.config/bmdirs
```

# cdf

Poruszanie się pomiędzy katalogami za pomocą FZF

```
source $HOME/bin/cdf
```

# clear-gpg-passwd

Czyści zapamiętane hasło przez agenta GPG

```
gpg-connect-agent reloadagent /bye"
```

# cleartemp

Link do skryptu `$HOME/bin/cleartemp`

Czyści pliki tymczasowe

# dec

Deszyfruje plik za pomocą GPG

```
$HOME/bin/DecryptGPG
```

# DecryptGPG

Skrypt deszyfrujący pliki PGP

# DecryptSSL

Skrypt deszyfrujący pliki za pomocą OpenSSL

# detect-os

Wyświetla nazwę i wersję dystrybucji - `$HOME/bin/detect-os`

# df

Wyświetla wolną przestrzeń na dyskach w bardziej ludzki sposób

```
df -h
```

# enc

Szyfruje plik za pomocą GPG

```
$HOME/bin/EncryptGPG
```

# EncryptGPG

Skrypt szyfrujący za pomocą PGP

# EncryptSSL

Skrypt szyfrujący za pomocą SSL

# f

Wyświetla liczbę katalogów w bieżącej lokalizacji

```
ls -A|wc -l
```

# ff

Uruchamia Firefoxa

```
firefox
```

# free

Wyświetla informacje dotyczące pamięci operacyjnej RAM i pliku wymiany w bardziej ludzki sposób

```
free -m
```

# fullhd

Ustawia rozdzielczość Full HD

# g

Uruchamia polecenie `git`

```
git
```

# ga

Uruchamia skrypt `$HOME/bin/ga`

```
~/bin/ga
```

Źródło:

```bash
#!/usr/bin/env bash

DATA=$(date +%F-%T)

git add -A && git commit -m $DATA
```

# gd

Uruchamia polecenie `git diff`

# gl

Uruchamia skrypt `$HOME/bin/gl` - wyświetlający zmiany w repozytorium Git

Źródło:

```
git log --graph --abbrev --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''        %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
```

# gp

Uruchamia skrypt `$HOME/bin/gp`

Skrypt w zależności od nazwy z jaką go wywołujemy uruchamia polecenia:
- `git add -A`
- `git commit`
- `git push`

W wersji `gps` jest podpisywany commit za pomocą klucza GPG

Źródło:

```
#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

# gpg-agent-restart

Restartuje agenta GPG

# gpg-delete-keys

Usuwa klucz z magazynu kluczy

# gpg-delete-secret-keys

Usuwa klucze prywatne z magazynu kluczy

# gpg-edit-key

Edytuje wybrany klucz

# gpg-export-secret-key

Eksportuje klucz prywatny

# gpg-export-key

Eksportuj klucz publiczny

# gpg-list-keys-short

Wyświetla listę kluczy w formacie SHORT

# gpg-list-keys

Wyświetla listę kluczy w formacie LONG

# gpg-list-secret-keys-short

Wyświetla listę kluczy prywatnych w formacie SHORT

# gpg-list-secret-keys

Wyświetla listę kluczy prywatnych w formacie LONG

# gps

Uruchamia skrypt `$HOME/bin/gps` który jest linkiem symbolicznym do pliku `$HOME/bin/gp`

Skrypt w zależności od nazwy z jaką go wywołujemy uruchamia polecenia:
- `git add -A`
- `git commit`
- `git push`

W wersji `gps` jest podpisywany commit za pomocą klucza GPG

Źródło

```
#!/usr/bin/env bash

DATA=$(date +%F-%T)

if [ "$(basename $0)" == "gps" ]; then
    git add -A && git commit -S -m $DATA && git push
else
    git add -A && git commit -m $DATA && git push
fi
```

# h

Uruchamia polecenie `history`

```
history
```

# l / ll

Uruchamia polecenie `exa` z dodatkowymi parametrami

```
exa -al --group-directories-first --git --header
```

# last-edit

Pokazuje ostatnio edytowane pliki

# lsx

 Pokazuje pliki wykonywalne w bieżącej lokalizacji
 
```
ls -F | grep '*$'
```

# menu

Skrypt wyświetlający podręczne menu rofi

# mkcdir

Tworzy katalog a następnie przechodzi do niego

# more

Zastępuje program `more` programem `less`

# n

Uruchamia edytor neovim

# no

Otwiera edytor Vim w lokalizacji `$HOME/notes`

```
vim -c "e $HOME/notes"
```

# nv

Uruchamia edytor Neovim

# open-with-fzf

Uruchamia skrypt `/home/t3/bin/open-with-fzf`

# otp-add

Dodaje skrót HASH do bazy `pass`

# otp

Wyświetla kod jednorazowy, którego HASH jest przechowywany w bazie `pass`

# p / pass

Uruchamia program `pass` bez zapisywania polecenia w historii

# passf

Uruchamia skrypt `$HOME/bin/passf`

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | fzf --print-query --prompt "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

# passr

Uruchamia skrypt `$HOME/bin/passr`

```bash
#!/usr/bin/env bash

pass $(find -L ~/.password-store -path '*.git' -prune -o -iname '*.gpg' -printf '%P\n' \
    | sed -e 's/.gpg$//' | sort | grep -v otp \
    | rofi -dmenu -i -p "Szukaj w bazie PASS") | tr -d '\n' | xclip
```

# pg

Wyszukuje procesów uruchamiając skrypt `$HOME/bin/psgrep`

Źródło:

```bash
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

Przykład:

```
$ pg vim
```

# psgrep

Skrypt `$HOME/bin/psgrep`

```bash
#!/usr/bin/env bash

ps ax | grep -i "$1" | grep -v grep
```

# pu

Uruchamia polecenie `git pull`

# push

Uruchamia polecenie `git push`

# pwgen

Generuje hasła od długości 32 znaków


```bash
pwgen -c -s -n -y -1 32"
```

# q

Uruchamia polecenie `exit`

# rgvi

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

# se

Skrypt `se`

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

Skrypt `sedi`

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

# so

Uruchamia polecenie `source`

# suspend

Usypia komputer

```
sudo systemctl suspend
```

#  sysdis

Deaktywuje usługę

```
sudo systemctl disable
```

# sysena

Aktywuje usługę

```
sudo systemctl enable
```

# sysstart

Uruchamia usługę

```
sudo systemctl start"
```

# sysstop

Zatrzymuje usługę

```
sudo systemctl stop"
```

# t

Uruchamia polecenie `tmux`

# ta

Uruchamia polecenie `tmux atta`

# tree

Zastępuje polecenie `tree` polecenie `exa`

```bash
exa -l -a -h -g --git --tree"
```

# v

Uruchamia program `vim`

# vf

Skrytp `$HOME/bin/vf`

```bash
#!/usr/bin/env bash

sk | xargs -r -I % $EDITOR %
```

# vim-docs

Skrypt `vim-docs`

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

Skrypt `vim-notes`

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

# vimrc / vrc

Alias do `.v` - edycja pliku konfiguracyjnego edytora Vim `~/.vim/vimrc`

# vs

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
