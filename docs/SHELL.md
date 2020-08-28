<!-- vim-markdown-toc GFM -->

* [Przydatne narzędzia](#przydatne-narzdzia)
* [Polecenie fd](#polecenie-fd)
* [Zmienne specjalne](#zmienne-specjalne)
* [Sprawdzenie czy skrypt został uruchomiony w trybie graficznym](#sprawdzenie-czy-skrypt-zosta-uruchomiony-w-trybie-graficznym)
* [Przekierowanie wszystki komunikatów do /dev/null](#przekierowanie-wszystki-komunikatów-do-devnull)
* [Wykonanie różnych zadań w zależności od nazwy skryptu](#wykonanie-rónych-zada-w-zalenoci-od-nazwy-skryptu)
* [Różności](#rónoci)
* [Klucze SSH](#klucze-ssh)
    * [Generowanie pary kluczy (ED25519)](#generowanie-pary-kluczy-ed25519)
    * [Informacje o kluczu SSH](#informacje-o-kluczu-ssh)
    * [Pobranie klucza publicznego SSH z github.com](#pobranie-klucza-publicznego-ssh-z-githubcom)
    * [Agent kluczy](#agent-kluczy)
* [TODO](#todo)

<!-- vim-markdown-toc -->

# Przydatne narzędzia

- [fzf](https://github.com/junegunn/fzf)
- [sk -skim](https://github.com/lotabout/skim)
- [rg - ripgrep](https://github.com/BurntSushi/ripgrep)
- [sd](https://github.com/chmln/sd)
- [fd - fd-find](https://github.com/sharkdp/fd)

# Polecenie fd

```
fd . --ignore-file .gitignore --hidden
```

Ignorowanie plików zawierających się w podanym pliku np. `.gitignore`

```
--ignore-file .gitignore
```

Wyszukiwanie ukrytych plików zaczynających się od znaku `.`
```
--hidden
```

# Zmienne specjalne

- `$?` - wyświetla status zakończenia ostatniego programu
- `$!` numer PID ostatniego programu
- `$$` numer PID powłoki shell
- `$0` nazwa uruchomionego skryptu
- `$#` liczba argumentów
- `$*` wszystkie argumenty
- `$@` wszystkie argumenty zaczynając od pierwszego
- `$1` pierwszy argument
- `$_` ostatni argument poprzedniego polecenia

# Sprawdzenie czy skrypt został uruchomiony w trybie graficznym

```
if [[ $DISPLAY ]]; then
    xterm -e htop
else
    htop
fi
```

# Przekierowanie wszystki komunikatów do /dev/null

```
> /dev/null 2>&1
```

# Wykonanie różnych zadań w zależności od nazwy skryptu

```
#!/usr/bin/env bash

if [ ($basename $0) == 'chmod-dir' ];
then
   find *.* -type d -exec chmod +x {} \; > /dev/null
fi

if [ $(basename $0) == 'chmod-file' ];
then
   find *.* .* -type f -exec chmod -x {} \; > /dev/null
   find *.pl *.sh -type f -exec chmod +x {} \; > /dev/null
fi
```

```
$ ln -s chmod.sh chmod-dir
$ ln -s chmod.sh chmod-file
$ chmod +x chmod.sh
```

# Różności

Rozwiązanie pełnej ścieżki linku symbolicznego

```
$ readlink -f plik.txt

$ readlink -f $PWD
```

Data i godzina z myślnikami

```
DATA=$(date +%F-%T|tr : -)
echo $DATA
2020-08-24-18-53-22
```

Data w formacie ISO

```
date -I
2020-08-24
```

Warunkowe założenie katalogu

```
DATA=$(date -I)
KATALOG=/mnt/sda1/backup/$DATA
[ -d $KATALOG ] || mkdir $KATALOG
```

# Klucze SSH

## Generowanie pary kluczy (ED25519)

```
$ ssh-keygen -t ed25519 -f nazwa_pliku -C komentarz
```

## Informacje o kluczu SSH

Uzyskanie sumy kontrolnej SHA256 klucza
```
$ ssh-keygen -l -f github-sebmd-ed25519.pub
256 SHA256:I9W48Mn7W6gxxKzF/kAB5FgNs0cKmoUGHSs8jsbwV/E sebmd@github (ED25519)
```

Uzyskanie sumy kontrolnej MD5 klucza
```
$ ssh-keygen -l -f github-sebmd-ed25519.pub -E md5
256 MD5:00:48:64:34:79:62:7c:24:fb:12:36:cf:22:f0:ac:ab sebmd@github (ED25519)
```

## Pobranie klucza publicznego SSH z github.com

```
curl https://github.com/nazwa_użytkownika.keys -o nazwa_użytkownika.keys
```

## Agent kluczy

```
$ eval $(ssh-agent)
```

Dodanie kucza do agenta

```
ssh-add ~/.ssh/klucz_ssh
```

# TODO

- [fzf](https://github.com/junegunn/fzf)
- [sk -skim](https://github.com/lotabout/skim)
- [rg - ripgrep](https://github.com/BurntSushi/ripgrep)
- [sd](https://github.com/chmln/sd)
- [fd - fd-find](https://github.com/sharkdp/fd)
- test
- if
- case
- bat
- exa
