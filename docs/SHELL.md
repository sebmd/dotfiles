# Shell

<!-- vim-markdown-toc GFM -->

* [Przydatne narzędzia](#przydatne-narzdzia)
* [Polecenie fd](#polecenie-fd)
* [Zmienne specjalne](#zmienne-specjalne)
* [Sprawdzenie czy skrypt został uruchomiony w trybie graficznym](#sprawdzenie-czy-skrypt-zosta-uruchomiony-w-trybie-graficznym)
* [Różnica pomiędzy [] a [[]]](#rónica-pomidzy--a-)
* [Przekierowanie wszystki komunikatów do /dev/null](#przekierowanie-wszystki-komunikatów-do-devnull)
* [Wykonanie różnych zadań w zależności od nazwy skryptu](#wykonanie-rónych-zada-w-zalenoci-od-nazwy-skryptu)
* [Usunięcie rozszerzenia pliku](#usunicie-rozszerzenia-pliku)
* [Rozszerzenie i nazwa pliku bez rozszerzenia](#rozszerzenie-i-nazwa-pliku-bez-rozszerzenia)
* [Data i godzina](#data-i-godzina)
* [Różności](#rónoci)
* [Klucze SSH](#klucze-ssh)
	* [Generowanie pary kluczy (ED25519)](#generowanie-pary-kluczy-ed25519)
	* [Informacje o kluczu SSH](#informacje-o-kluczu-ssh)
	* [Pobranie klucza publicznego SSH z github.com](#pobranie-klucza-publicznego-ssh-z-githubcom)
	* [Agent kluczy](#agent-kluczy)
* [Case in](#case-in)
* [for FILE](#for-file)
* [Wyświetlenie wartości zmiennej](#wywietlenie-wartoci-zmiennej)
* [Pobranie daty modyfikacji pliku](#pobranie-daty-modyfikacji-pliku)
* [Porównanie dwóch ciągów znaków](#porównanie-dwóch-cigów-znaków)
* [Generowanie zakresu liczb z poprzedzającym 0](#generowanie-zakresu-liczb-z-poprzedzajcym-0)
* [Sprawdzenie czy komenda istnieje](#sprawdzenie-czy-komenda-istnieje)
* [Wyszukiwanie za pomocą ripgrep (rg)](#wyszukiwanie-za-pomoc-ripgrep-rg)

<!-- vim-markdown-toc -->

# Przydatne narzędzia

- [fzf](https://github.com/junegunn/fzf)
- [sk - skim](https://github.com/lotabout/skim)
- [rg - ripgrep](https://github.com/BurntSushi/ripgrep)
- [sd](https://github.com/chmln/sd)
- [fd - fd-find](https://github.com/sharkdp/fd)

# Polecenie fd

```bash
fd . --ignore-file .gitignore --hidden
```

Ignorowanie plików zawierających się w podanym pliku np. `.gitignore`

```bash
--ignore-file .gitignore
```

Wyszukiwanie ukrytych plików zaczynających się od znaku `.`

```bash
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

```bash
if [[ $DISPLAY ]]; then
    xterm -e htop
else
    htop
fi
```

# Różnica pomiędzy [] a [[]]

- http://mywiki.wooledge.org/BashFAQ/031

# Przekierowanie wszystki komunikatów do /dev/null

```bash
> /dev/null 2>&1
```

# Wykonanie różnych zadań w zależności od nazwy skryptu

```bash
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

```bash
$ ln -s chmod.sh chmod-dir
$ ln -s chmod.sh chmod-file
$ chmod +x chmod.sh
```

Wersja z użyciem funkcji `case`

```bash
case $(basename $0) in
  bc2sd.mount)
    mount_sd
    ;;
  bc2sd.umount)
    umount_sd
    ;;
  bc2sd.include|bc2sd.inc)
    backup_sd include
    ;;
  bc2sd.exclude|bc2sd.exc)
    backup2sd exclude
    ;;
  bc2sd|backup2sd|backup2sd.sh)
    run
    ;;
esac
```

# Usunięcie rozszerzenia pliku

Polecenie `find` wyszukuje wszystkie pliki w katalogu `~/.password-store/otp/`
a następnie wyświetla znalezione pliki usuwając rozszerzenie `.gpg`.
Polecenie wyświetla wyłącznie nazwę pliku.

```bash
find ~/.password-store/otp/ -name ".gpg" -exec basename {} .gpg \;
```

Wersja wyświetlająca pełną ścieżkę pliku

```bash
find ~/.password-store -name "*.gpg" -exec sh -c 'printf "%s\n" "${0%.*}"' {} \;
```

Ten sam efekt uzyskamy za pomocą komendy `sed`

```bash
find ~/.password-store -type f -iname "*.gpg" | sed 's/\.gpg$//1'
```

# Rozszerzenie i nazwa pliku bez rozszerzenia

Nazwa pliku

```bash
file=backup2sd.config
echo ${file%.*}

/home/user/bin/backup2sd
```

Rozszerzenie pliku

```bash
file=backup2sd.config
echo ${file##*.}

config
```

# Data i godzina

Sprawdzenie daty modyfikacji pliku

```bash
$ date -r nazwa_pliku.txt
Fri 19 Apr 2020 07:22:11 AM CEST
```

Zmiana formatu wyświetlenia daty modyfikacji pliku

```bash
$ date -r nazwa_pliku.txt "+%F %s"
2020-05-22 155214214
```

Data i godzina oddzielona myślnikami

```bash
DATA=$(date +%F-%T|tr : -)
echo $DATA
2020-08-24-18-53-22
```

Data w formacie ISO

```bash
date -I
2020-08-24
```

Działania arytmetyczne na datach

```bash
date -d "09/27/2019 08:53:52 AM CEST +2 days +2 hours" "+%F %T"
```

```bash
date -d "Tue 22 Oct 2019 08:53:52 AM CEST +2 days +2 hours" "+%F %T"
```

# Różności

Rozwiązanie pełnej ścieżki linku symbolicznego

```bash
$ readlink -f plik.txt
/home/user/git/dotfiles/docs/SHELL.md
```

```bash
$ readlink -f $PWD
/home/user/git/dotfiles/docs
```

Wyświetlenie katalogu w którym znajduje się skrypt

```bash
dirname $(readlink -f $0)
```

Warunkowe założenie katalogu

```bash
DATA=$(date -I)
KATALOG=/mnt/sda1/backup/$DATA
[ -d $KATALOG ] || mkdir $KATALOG
```

# Klucze SSH

## Generowanie pary kluczy (ED25519)

```bash
$ ssh-keygen -t ed25519 -f nazwa_pliku -C komentarz
```

## Informacje o kluczu SSH

Uzyskanie sumy kontrolnej SHA256 klucza

```bash
$ ssh-keygen -l -f github-sebmd-ed25519.pub
256 SHA256:I9W48Mn7W6gxxKzF/kAB5FgNs0cKmoUGHSs8jsbwV/E sebmd@github (ED25519)
```

Uzyskanie sumy kontrolnej MD5 klucza

```bash
$ ssh-keygen -l -f github-sebmd-ed25519.pub -E md5
256 MD5:00:48:64:34:79:62:7c:24:fb:12:36:cf:22:f0:ac:ab sebmd@github (ED25519)
```

## Pobranie klucza publicznego SSH z github.com

```bash
curl https://github.com/nazwa_użytkownika.keys -o nazwa_użytkownika.keys
```

## Agent kluczy

```bash
$ eval $(ssh-agent)
```

Dodanie kucza do agenta

```bash
ssh-add ~/.ssh/klucz_ssh
```

# Case in

```bash
read ODP
case $ODP in
    t|T)
        echo T
        ;;
    n|N)
        echo N
        ;;
    *)
        echo ERROR
        ;;
esac
```

# for FILE

Funkcja `for FILE in ...` dodatkowo została wyposażona w mechanizm wykluczający
niechciane pliki, jest to `egrep -v 'README.md|install.sh'`

```bash
#!/usr/bin/env bash

DOTFILES_BIN_DIR=$HOME/git/github/dotfiles_bin
BIN_DIR=$HOME/bin

mkdir -p $DOTFILES_BIN_DIR

git clone https://github.com/sebmd/dotfiles_bin $DOTFILES_BIN_DIR

for FILE in $(ls $DOTFILES_BIN_DIR|egrep -v 'README.md|install.sh'); do
    ln -sf $DOTFILES_BIN_DIR/$FILE $BIN_DIR/$FILE
done
```

```bash
for FILE in **/**; do
    echo "$FILE"
done
```

```bash
for FILE in *.md
do
    echo "$FILE"
done
```

# Wyświetlenie wartości zmiennej

```bash
ZMIENNA="wartość zmiennej"

echo "$ZMIENNA"
wartość zmiennej

echo "${ZMIENNA:8}"
zmiennej

echo "${zmienna:8:3}"
zmi
```

# Pobranie daty modyfikacji pliku

```bash
stat -c '%y' ~/temp/tdrop|cut -f 1 -d ' '
2020-09-29
```

# Porównanie dwóch ciągów znaków


Tutaj sprawdzenie czy wynik polecenia `type ls` zawiera słowo `alias`

```bash
if [[ $(type ls) == *"alias"* ]]; then
    echo alias
fi
```

# Generowanie zakresu liczb z poprzedzającym 0

```bash
seq -f "%03g" 1 10

001
...
010
```

# Sprawdzenie czy komenda istnieje

```bash
if [[ ! $(command -v broot) ]]; then
    echo "BŁĄD: Brak programu broot."
    exit
fi
```

# Wyszukiwanie za pomocą ripgrep (rg)

Wyszukiwanie wyrazu we wszystkich plikach bieżącego katalogu

```bash
rg wyraz
```

Wyszukiwanie wyrazu w pliku

```bash
rg wyraz plik.txt
```

Wyszukiwanie wyrazu w katalogu

```bash
rg wyraz katalog/
```

Wyszukiwanie plików w których znajduje się znak `#` a następnie słowo `bash`

```bash
rg "#.*bash*"
```

Wyświetlenie dodatkowych linii przed i po wystąpieniem wyszukiwanego wyrazu

- `-A #` liczba linii wyświetlanych po wystąpieniu szukanego słowa
- `-B #` liczba linii wyświetlanych przed wystąpieniu szukanego słowa
- `-C #` liczba linii wyświetlanych przed i po wystąpieniu szukanego słowa

```bash
rg -A 2 -B 3 słowo
```

Wyszukiwanie w plikach i katalogach ukrytych zaczynających się od `.`

```bash
rg --hidden github
```
