# Mapowanie klawiszy

*2020-12-12 14:30:27*

## Klawisz LEADER i LOCALLEADER

Jako klawisz **LEADER** jest użyta `spacja`

Jako klawisz **LOCALLEADER** jest użyty klawisz `\`

## Tryb NORMAL

- `j` - zmapowany jako skrót `gj`
- `k` - zmapowany jako skrót `gk`
- `gj` - przechodzi do następnej zmiany w pliku, jeśli ten jest w repozytorium
  Git, jest to funkcjonalność pluginu Signify
- `gk` - przechodzi do poprzedniej zmiany w pliku, jeśli ten jest w repozytorium
  Git, jest to funkcjonalność pluginu Signify
- `gJ` - przechodzi do ostatniej zmiany w pliku, jeśli ten jest w repozytorium
  Git, jest to funkcjonalność pluginu Signify
- `gK` - przechodzi do pierwszej zmiany w pliku, jeśli ten jest w repozytorium
  Git, jest to funkcjonalność pluginu Signify
- `J` - łączy dwie linie nie zmieniając pozycji kursora
- `Y` - kopiuje od kursora do końca linii
- `n` - zmapowany jako `nzz`
- `N` - zmapowany jako `Nzz`
- `Q` - odtwarza zapisane makro `a` czyli zastępuje skrót `@a`
- `Q` - w trybie komend zamyka edytor bez zapisywania `:q!`
- `x` - usuwa pojedynczy znak pod kursorem, ale nie zapisuje go w rejestrze
- `X` - usuwa pojedynczy znak przed kursorem, ale nie zapisuje go w rejestrze
- `,e` - uruchamia polecenie `:e nazwa_pliku`
- `,s` - uruchamia polecenie `:sp nazwa_pliku`
- `,v` - uruchamia polecenie `:vs nazwa pliku`
- `<ctrl-s>` - zapisuje zmiany w pliku `:update`
- `<ctrl-h>` - przechodzi do okna po lewej
- `<ctrl-j>` - przechodzi do okna na dole
- `<ctrl-k>` - przechodzi do okna u góry
- `<ctrl-l>` - przechodzi do okna po prawej
- `th` - wyłącza podświetlanie wyszukiwanego tekstu
- `qq` - wychodzi z edytora zastępuje `:q`
- `qw` - zapisuje zmiany `:update` i wychodzi z edytora `:q`
- `Q` - odtwarza zapisane makro `a` czyli zastępuje skrót `@a`
- `<tab>` - przechodzi pomiędzy dwoma ostatnimi buforami
- `dh` - usuwa od kursora do początku linii - `d0`
- `dl` - usuwa od kursora do końca linii - `d$`
- `gh` - przechodzi na początek linii
- `gl` - przechodzi na koniec linii (nie działa z plikami vimwiki)
- `<ctrl-/>` - wstawia znak komentarza na początku linii, jest to
  funkcjonalność pluginu Commentary
- `<esc>h` - przechodzi do poprzedniego bufora
- `<esc>l` - przechodzi do następnego bufora

**kopiuj / wklej do schowka systemowego**

- `<ctrl-c>` - `"*y :let @+=@*<cr>`
- `<ctrl-c>` - `"*y :let @+=@*<cr>`
- `<ctrl-p>` - `"+P`
- `n` - zastąpiony przez `nzz`
- `N` - zastąpiony przez `Nzz`
- `Y` - zastąpiony przez `y$`

**Skróty w plikach pomocy Vim**

- `<leader>l` - `<c-]>`
- `<leader>h` - `<c-t>`

**Klawisz LEADER**

- `<leader><F1>` - pliki docs/VIM*.md
- `<leader><F2>` - pliki konfiguracyjne edytora Vim
- `<leader>h` - przechodzi na początek linii
- `<leader>l` - przechodzi na koniec linii
- `<leader>;` - wchodzi do trybu komend - `:`
- `<leader>,` - przechodzi do poprzedniego bufora
- `<leader>.` - przechodzi do następnego bufora
- `<leader>o` - ustawia bieżące okno jako główne chowając resztę okien
- `<leader>cd` - przechodzi do katalogu w którym znajduje się edytowany plik
- `<leader>cp` - klonuje bieżący paragraf
- `<leader>pa` - wchodzi / wychodzi w tryb paste
- `<leader>v` - otwiera plik `vimrc`
- `<leader>r` - przeładowuje plik `vimrc`
- `<leader>t` - uruchamia terminal (podział poziomy)
- `<leader>tv` - uruchamia terminal (podział pionowy)
- `<leader>E` - uruchamia bieżącą linię jako polecenie systemowe wynik wkleja do bufora
- `<leader>ve` - uruchamia bieżącą linię jako polecenie edytora Vim
- `<leader>w` - zapisuje plik ` :update`
- `<leader>s` - uruchamia sprawdzanie pisowni
- `<leader>a` - wyrównuje paragraf `=ip` i zawija linie na długość 80 znaków `gqap`
- `<leader>e` - otwiera nowy plik dziennika w katalogu `~/notes`
- `<leader>d` - uruchamia funkcję `DestractionFree`
- `<leader>pr` - uruchamia polecenie `:ProjectFiles` w głównym katalogu repozytorium Git
- `<leader>gp` - uruchamia skrypt `~/bin/gp` dodaje plik do repozytorium Git,
  następnie wykonuje commit i push.
- `<leader>g` - uruchamia polecenie `:Rg` - przeszukiwanie pliku
- `<leader>gc` - uruchamia polecenie `:GCheckout`
- `<leader>u` - uruchamia plugin Undotree
- `<leader>y` - uruchamia polecenie `:YRShow`
- `<leader>f` - uruchamia menadżer plików Fern
- `<leader>n` - uruchamia menadżer plików NERDTree
- `<leader>sn` kopiuje linię / zaznaczenie do pliku ~/notes/notatki.md
- `<leader>sN` przenosi linię / zaznaczenie do pliku ~/notes/notatki.md
- `<leader>e` otwiera plik ~/notes/ + bieżąca data
- `<leader>en` otwiera plik ~/notes/notatki.md
- `<leader>Fn` wyszukiwanie plików z podglądem w katalogu ~/notes/
- `<leader>5` - uruchamia skrypt języka Python
- `<leader>5` - uruchamia program Go
- `<leader>b` - wyszukiwanie otwartych buforów za pomocą FZF
- `<leader>,` - przechodzi do poprzedniego bufora
- `<leader>.` - przechodzi do następnego bufora
- `<esc>h` - przechodzi do poprzedniego bufora
- `<esc>l` - przechodzi do następnego bufora
- `<localleader>F` - wyświetla pełną ścieżkę dla pliku wraz z jego nazwą

**Obsługa pluginu vim-surround**

- `<leader>sw` czeka na wprowadzenie znaku, którym otoczy wyraz
- `<leader>sW` czeka na wprowadzenie znaku, którym otoczy WYRAZ
- `<leader>sp` czeka na wprowadzenie znaku, który otoczy paragraf
- `<leader>ss` czeka na wprowadzenie znaku, którym otoczy linię
- `<leader>sd` czeka na wprowadzenie znaku, którym zostanie usunięty

## Tryb INSERT

- `<tab>` - zatwierdza popowiedzi autouzupełaniania
- `<ctrl-h>` - jeden znak w lewo
- `<ctrl-j>` - linia w dół
- `<ctrl-k>` - linia w górę
- `<ctrl-l>` - jeden znak w prawo
- `<ctrl-c>` - klawisz ESC
- `<ctrl-s>` - Zapisuje plik `<esc>:update<cr>a`

**Praca z plikami**

- `,fp` - wstawia bieżący katalog
- `,fn` - wstawia nazwę edytowanego pliku
- `,fnr` - wstawia nazwę edytowanego pliku bez rozszerzenia
- `,fnn` - wstawia nazwę edytowanego pliku wraz z pełną ścieżką

**Tryb INSERT w plikach Markdown i Vimwiki**

- `,m` - wstawia nagłówek # oraz aktualną datę i godzinę
- `,,` - przechodzi do znacznika `<++>`
- `,n` - wstawia `----`
- `,b` - wstawia **pogrubienie**
- `,s` - wstawia ~~przekreślenie~~
- `,e` - **<++><esc>F*i
- `,h` - wstawia `== ==`
- `,i` - wstawia obraz (png, jpg)
- `,a` - wstawia link do strony
- `,1` - wstawia nagłówek #
- `,2` - wstawia nagłówek ##
- `,3` - wstawia nagłówek ###
- `,4` - wstawia nagłówek ####
- `,l` - wstawia --------
- `,c` - wstawia znacznik kodu
- `,t` - wstawia datę i godzinę `2020-12-12 14:21:28`

## Tryb COMMAND

- `,fp` - wstawia bieżący katalog
- `,fn` - wstawia nazwę edytowanego pliku
- `,fnr` - wstawia nazwę edytowanego pliku bez rozszerzenia
- `,fnn` - wstawia nazwę edytowanego pliku wraz z pełną ścieżką
- `<ctrl-h>` - jeden znak w lewo
- `<ctrl-j>` - linia w dół
- `<ctrl-k>` - linia w górę
- `<ctrl-l>` - jeden znak w prawo
- `<ctrl-c>` - klawisz ESC
- `$c` - wstawia do linii komend :e oraz_bieżący_katalog
- `Q` - wychodzi z edytora bez zapisania zmian `:q!`
