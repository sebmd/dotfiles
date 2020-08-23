<!-- vim-markdown-toc GFM -->

* [Polecenie fd](#polecenie-fd)
* [Zmienne specjalne](#zmienne-specjalne)
* [Sprawdzenie czy skrypt został uruchomiony w trybie graficznym](#sprawdzenie-czy-skrypt-zosta-uruchomiony-w-trybie-graficznym)
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

# TODO

- fzf
- zk
- rg
- test
- if
- case
- bat
- exa
