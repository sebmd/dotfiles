<!-- vim-markdown-toc GFM -->

* [Polecenie fd](#polecenie-fd)
* [Zmienne specjalne](#zmienne-specjalne)
* [Sprawdzenie czy skrypt został uruchomiony w trybie graficznym](#sprawdzenie-czy-skrypt-zosta-uruchomiony-w-trybie-graficznym)
* [Przekierowanie wszystki komunikatów do /dev/null](#przekierowanie-wszystki-komunikatów-do-devnull)
* [Wykonanie różnych zadań w zależności od nazwy skryptu](#wykonanie-rónych-zada-w-zalenoci-od-nazwy-skryptu)
* [Różności](#rónoci)
* [TODO](#todo)

<!-- vim-markdown-toc -->

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

# TODO

- fzf
- zk
- rg
- test
- if
- case
- bat
- exa
