# Vim

<!-- vim-markdown-toc GFM -->

* [Konfiguracja](#konfiguracja)
* [Podstawowe tryby pracy w edytorze Vim](#podstawowe-tryby-pracy-w-edytorze-vim)
    * [Przejście do trybu INSERT](#przejcie-do-trybu-insert)
* [Wyjście z edytora](#wyjcie-z-edytora)
* [Tryb NORMAL](#tryb-normal)
    * [Poruszanie się w linii](#poruszanie-si-w-linii)
    * [Poruszanie się po pliku (pomiędzy liniami)](#poruszanie-si-po-pliku-pomidzy-liniami)
    * [Obiekty tekstowe](#obiekty-tekstowe)
    * [Poruszanie się po ekranie](#poruszanie-si-po-ekranie)
    * [Przewijanie pliku](#przewijanie-pliku)
    * [Bufory](#bufory)
* [Tryb COMMAND](#tryb-command)
* [Tryb INSERT](#tryb-insert)
* [Edycja](#edycja)
    * [Kopiuj i wkleja](#kopiuj-i-wkleja)
* [Praca z plikami](#praca-z-plikami)
* [Praca z plikami Markdown i Vimwiki](#praca-z-plikami-markdown-i-vimwiki)
* [Obsługa notatek w katalogu ~/notes/](#obsuga-notatek-w-katalogu-notes)
* [Autouzupełnianie](#autouzupenianie)
* [Mapowanie pluginu NERDTree](#mapowanie-pluginu-nerdtree)
* [Obsługa pluginu vim-surround](#obsuga-pluginu-vim-surround)
* [Mapowanie pluginu Undotree](#mapowanie-pluginu-undotree)
* [Mapowanie pluginu signify](#mapowanie-pluginu-signify)
* [Mapowanie pluginu commentary](#mapowanie-pluginu-commentary)
* [Mapowanie pluginu Fern](#mapowanie-pluginu-fern)
* [Kolory](#kolory)
* [Funkcje niestandardowe](#funkcje-niestandardowe)
* [Komendy pluginu FZF](#komendy-pluginu-fzf)
* [Plugin fzf-preview.vim](#plugin-fzf-previewvim)
* [Zarządzanie sesjami](#zarzdzanie-sesjami)
* [Plugin vim-unimpaired](#plugin-vim-unimpaired)

<!-- vim-markdown-toc -->

# Konfiguracja

Dodatkową konfigurację można wprowadzać w plikach `~/.vimrc.local`
lub `~/.vim/vimrc.local`, dzięki czemu nie trzeba modyfikować oryginalnej
konfiguracji.

**Standardowo klawiszem LEADER jest znak `\` natomiast w tej konfiguracji klawiszem
LEADER jest klawisz `SPACJA`**

**Istnieje jeszcze dodatkowo LOCALLEADER, którym jest znak` \`**

- [Zainstalowane pluginy](Vim_Plugins.md)

# Podstawowe tryby pracy w edytorze Vim

- Tryb **NORMAL** - słuzy do edycji i poruszania się po pliku
- Tryb **VISUAL** - zaznaczanie tekstu i edycja
- Tryb **INSERT** - służy do wprowadzania tekstu
- Tryb **COMMAND** - linia komend

## Przejście do trybu INSERT

Edytor Vim po uruchomieniu znajduje się w trybie **NORMAL** w którym nie można
wprowadzać tekstu. Żeby wejść w tryb **INSERT** należy użyć komendy.

- `i` - zaczyna wprowadzać w miejscu kursora
- `a` - zaczyna wprowadzać za kursorem
- `I` - przechodzi na początek linii i wchodzi w tryb **INSERT**
- `A` - przechodzi na koniec linii i wchodzi w tryb **INSERT**
- `o` - przechodzi do linii niżej wchodząc w tryb **INSERT**
- `O` - przechodzi do linii wyżej wchodząc w tryb **INSERT**
- `cc` - usuwa całą linię i wchodzi w tryb **INSERT**
- `C` - usuwa wszystko na prawo od kursora i wchodzi w tryb **INSERT**

istnieje też możliwość łączenia komendy `c` np.

- `ciw` - usuwa wyraz pod kursorem i wchodzi w tryb **INSERT**
- `cap` - usuwa cały paragraf wraz z dodatkową linią i wchodzi w tryb **INSERT**

Więcej na ten temat można przeczytać w dalszej części.

# Wyjście z edytora

- `:q` - wyjście bez zapisania pliku
- `:q!` - wyjście bez zapsisania pliku nawet jeśli zostały wprowadzone zmiany
- `:x` - zapisanie i wyjście
- `:wq` - zapisanie i wyjście
- `ZZ` - zapisanie i Wyjście
- `ZQ` - wyjście bez zapisania

# Tryb NORMAL

## Poruszanie się w linii

**Poruszanie się pomiędzy wyrazami**

Poruszając się w linii mamy doczynienia z dwoma definicjami: wyraz oraz WYRAZ,
wyraz może oznaczać też pojedyncze znaki natomiast WYRAZ pomija znaki
specjalne i traktuje je jako jedną całość np. 'sss' jest traktowane jak
trzy wyrazy lub jeden WYRAZ.

- `h` - jeden znak w lewo
- `l` - jeden znak w prawo
- `w` - przechodzi do pierwszego znaku kolejnego wyrazu
- `W` - przechodzi do pierwszego znaku kolejnego WYRAZU
- `b` - przechodzi do pierwszego znaku poprzedniego wyrazu
- `B` - przechodzi do pierwszego znaku poprzedniego WYRAZU
- `ge` - przechodzi na koniec poprzedniego wyrazu
- `gE` - przechodzi na koniec poprzedniego WYRAZU

Warto wyuczyć sobie pewnego rodzaju zachowania np. przejście na koniec wyrazu i
wejście w tryb INSERT lub przejście na początek poprzedniego wyrazu i wejście w
tryb INSERT czyli:

- `ea` - przechodzi na koniec wyrazu i wchodzi w tryb INSERT
- `bi` - przechodzi na początek poprzedniego wyrazu i wchodzi w tryb INSERT
- `wi` - przechodzi na początek następnego wyrazu i wchodzi w tryb INSERT
- `gea` - przechodzi na koniec poprzedniego wyrazu i wchodzi w tryb INSERT

**Początek i koniec linii**

- `0` - początek linii
- `^` - początek linii, pomija spację na początku linii
- `^` - początek linii, pomija spacje na początku linii
- `$` - koniec linii
- `g0` - w przypadku zawijanych linii przechodzi na początek danej linii, inaczej
  niż `0`
- `g$` - w przypadku zawijanych linii przechodzi na koniec danej linii, inaczej
  niż `$`
- `g^` - przechodzi do pierwszego znaku w linii pomijając spacje i znak
  tabulatora
- `g_` - przechodzi do ostatniego znaku w linii ignoruje spacje i tabulatory na
  końcu linii

**Wyszukiwanie w linii**

- `f`<znak> - przechodzi do pierwszego wystąpienia znaku
- `F`<znak> - przechodzi do poprzedniego wystąpienia znaku
- `t`<znak> - przechodzi znak wcześniej w prawo
- `T`<znak> - przechodzi znak wcześniej w lewo
- `;` - przechodzi do kolejnego wystąpienia szukanego wcześniej znaku za pomocą
  `t/T/f/F`
- `,` - przechodzi do poprzedniego wystąpienia szukanego wcześniej znaku za
  pomocą `t/T/f/F`

## Poruszanie się po pliku (pomiędzy liniami)

- `j` - linia w dół
- `k` - linia w górę
- `gg` - przechodzi do pierwszej linii
- `G` - przechodzi do ostatniej linii
- `12%` - przechodzi do 12% długości pliku
- `gi` - przechodzi do miejsca ostatniej edycji, jednocześnie wchodząc w tryb
  **INSERT**
- `` `^ `` - przechodzi do miejsca ostatniej edycji

## Obiekty tekstowe

Pomoc: `:help text-objects`

- `w` - wyraz
- `W` - WYRAZ
- `s` - zdanie
- `p` - paragraf
- `()[]{}` - blok
- `%` - poruszanie się pomiędzy otwarciem i zamknięciem nawiasów `{}()[]`
- `(, )` - poruszanie się pomiędzy zdaniami
- `{, }` - poruszanie się pomiędzy paragrafami (pustymi liniami)

## Poruszanie się po ekranie

W przypadku `H` i `L` ma znaczenie parametr `set scrolloff` gdzie ustalamy
offset przy przewijaniu ekranu, czyli ile linii dodatkowo widać podczas
przewijania ekranu.

- `H` - przechodzi na górę ekranu
- `M` - przechodzi na środek ekranu
- `L` - przechodzi na dół ekranu

## Przewijanie pliku

- `Ctrl-e` - przewija o jedną linię w górę
- `Ctrl-y` - przewija o jedną linię w dół
- `Ctrl-d` - przewija o pół ekranu w dół
- `Ctrl-u` - przewija o pół ekranu w górę
- `Ctrl-f` - przewija o cały ekran w dół
- `Ctrl-b` - przewija o cały ekran w górę

Wszystkie te kombinację możemy poprzedzić liczbą powtórzeń danej operacji. Na
przykład przewinięcie o 6 linii w dół:

```
6Ctrl-e
```

## Bufory

- `:bd` - zamknięcie bufora
- `:bn` - następny bufor
- `:bp` - poprzedni bufor
- `:bm` - kolejny bufor, który był modyfikowany
- `:buffers` / `ls` - lista buforów
- `:badd [nazwa bufora]` - otwiera pusty bufor o wybranej nazwie

Bufory i Pluginy

- `:Buffers` - interaktywna lista buforów
- `<leader>b` - uruchamia polecenie `:Buffers`

**Okna**

- `:vs` - otworzenie nowego okna z podziałem pionowym z tym samym plikiem
- `:sp` - otworzenie nowego okna z podziałem poziomym z tym samym plikiem
- `:vnew` - otworzenie nowego okna z podziałem pionowym - pusty bufor
- `:new` - otworzenie nowego okna z podzialem poziomym - pusty bufor
- `<ctrl-h>` - przechodzi do okna po lewej, standardowo `<ctrl-w>h`
- `<ctrl-l>` - przechodzi do okna po prawej, standardowo `<ctrl-w>l`
- `<ctrl-j>` - przechodzi do okna niżej, standardowo `<ctrl-w>j`
- `<ctrl-k>` - przechodzi do okna wyżej, standardowo `<ctrl-w>k`
- `<ctrl-w>r` - zamiana okien miejscami

# Tryb COMMAND

- `<ctrl-h>` - przechodzi o jeden znak w lewo
- `<ctrl-l>` - przechodzi o jeden znak w prawo
- `<ctrl-k>` - poruszanie się po historii komend w górę
- `<ctrl-j>` - poruszanie się po historii komend w dół
- `<leader>;` - wchodzi w tryb komend

# Tryb INSERT

Wejście do trybu **INSERT**

- `i` - wchodzi w tryb **INSERT**, wprowadza tekst przed kursorem
- `a` - wchodzi w tryb **INSERT**, wprowadza tekst za kursorem

**Dodatkowe skróty**

- `<ctrl-h>` - przechodzi o jeden znak w lewo
- `<ctrl-l>` - przechodzi o jeden znak w prawo
- `<ctrl-k>` - przechodzi o jedną linię w górę
- `<ctrl-j>` - przechodzi o jedną linię w dół
- `<ctrl-c>` - zastępuje klawisz ESC
- `<ctrl-s>` - zapisuje zmiany w pliku `:update`

# Edycja

- `diw` - usuwa wyraz pod kursorem bez spacji za nim
- `daw` - usuwa wyraz pod kursorem wraz ze spacją za nim
- `ciw` - usuwa wyraz pod kursorem bez spacji za nim i przechodzi w tryb
  **INSERT**
- `caw` - usuwa wyraz pod kursorem wraz ze spacją za nim i przechodzi w tryb
  **INSERT**
- `dw` - usunięcie od kursora do końca wyrazu
- `dW` - usunięcie od kursora do końca WYRAZU
- `dap` - usunięcie całego paragrafu + dodatkowa linia
- `dip` - usunięcie całego paragrafu

Koniec i początek linii

- `d$` - usunięcie od kursora do końca linii
- `d^` - usunięcie od kursora do początku linii
- `D`  - usunięcie od kursora do końca linii zamiennik `d$`
- `C`  - usunięcie od kursora do końca linii wejście w tryb INSERT

## Kopiuj i wkleja

- `yy` - kopiuje całą linię
- `dd` - usuwa / wycina całą linię
- `cc` - usuwa / wycina całą linię i przechodzi do trybu **INSERT**
- `Y`  - kopiuje od kursora do końca linii

# Praca z plikami

**Tryb NORMAL**

- `:e .` - otwiera standardowy menadżer plików w bieżącej lokalizacji
- `<leader>f` - uruchamia menadżer plików Fern
- `<leader>n` - uruchamia menadżer NERDTree
- `,e` - otwiera bieżącą lokalizację w menadżerze plików
- `,s` - otwiera bieżącą lokalizację w menadżerze plików - podział w poziomie
- `,v` - otwiera bieżącą lokalizację w menadżerze plików - podział w pionie
- `\F` - wyświetla pełną ścieżkę dla pliku wraz z jego nazwą

**Tryb INSERT i COMMAND**

- `,fp` - wstawia ścieżkę bieżącego katalogu `/home/user/git/github/dotfiles/docs`
- `,fn` - wstawia nazwę edytowanego pliku `VIM.md`
- `,fnr` - wstawia nazwę edytowanego pliku bez rozszerzenia `VIM`
- `,fnn` - wstawia pełną ścieżkę wraz z nazwą edytowanego pliku
  `/home/user/git/github/dotfiles/docs/VIM.md`
- `$c` - w trybie COMMAND uruchamia polecenie `:e nazwa_pliku`

# Praca z plikami Markdown i Vimwiki

- `,m` - wstawia nagłówek pierwszego stopnia oraz bieżącą datę i godzinę
- `,,` - wyszukuje znacznia `<++>`
- `,n` - wstawia `----`
- `,b` - wstawia `**** ****` np. ****wyraz****
- `,s` - wstawia `~~ ~~` np. ~~wyraz~~
- `,e` - wstawia `* *` np. *wyraz*
- `,1` - wstawia nagłówek stopnia pierwszego `#`
- `,2` - wstawia nagłówek stopnia drugiego `##`
- `,3` - wstawia nagłówek stopnia trzeciego `###`
- `,4` - wstawia nagłówek stopnia czwartego `####`
- `,c` - wstawia blok kodu ` ``` `
- `,t` - wstawia bieżącą datę i godzinę np. 2020-09-27 22:08:02
- `:GenTocGFM` - generuje spis treści
- `:UpdateToc` - aktualizuje spis treści wygenerowany za pomocą `GenTocGFM`

# Obsługa notatek w katalogu ~/notes/

- `:RgNotes` - przeszukiwanie plików w katalogu `~/notes/`
- `:Notes` - wyszukiwanie plików w katalogu `~/notes/`
- `:Log` - edycja pliku `~/notes/log.md`
- `<leader>sn` - kopiuje linię / zaznaczenie do pliku `~/notes/notatki.md`
- `<leader>sN` - przenosi linię / zaznaczenie do pliku `~/notes/notatki.md`
- `<leader>e` - otwiera plik `~/notes/ + bieżąca data`
- `<leader>en` - otwiera plik `~/notes/notatki.md`
- `<leader>Fn` wyszukiwanie plików z podglądem w katalogu `~/notes/` uruchamia
  polecenie `:Notes`

# Autouzupełnianie

Plugin AutoComplPop pokazuje okno podpowiedzi na podstawie słów z otwartych
buforów. Dodatkowo używając `Ctrl-p` podczas wprowadzania uruchamia podpowiedzi
ze słownika. Wcześniej należy uruchomić funkcję `spell`.

```
Plug 'vim-scripts/AutoComplPop'
```
Ustawienia automatycznego uzupełniania

```
set complete+=kspell " Ctrl+p w trybie INSERT podpowiedzi ze słownika wymaga włączenia trybu spell
set shortmess+=c  " usuwa informacje o ilości możliwych podpowiedzi
set completeopt=menuone,longest
```

Zmapowanie klawisza `<TAB>` w trybie INSERT do zatwierdzenia wyboru słowa.

```
inoremap <expr> <TAB> pumvisible() ? "<C-y>":"<TAB>"
```

Skróty klawiszowe

- `Ctrl-n` przechodzi do słowa niżej
- `Ctrl-p` przechodzi do słowa wyżej
- `Ctrl-y` zatwierdza wybraną podpowiedź
- `Ctrl-e` opuszcza okno podpowiedzi
- `<TAB>` - zatwierdza wybraną podpowiedź

# Mapowanie pluginu NERDTree

- `<leader>n` - uruchamia menadżer plików NERDTree

# Obsługa pluginu vim-surround

- `<leader>sw` - czeka na wprowadzenie znaku, którym otoczy wyraz
- `<leader>sW` - czeka na wprowadzenie znaku, którym otoczy WYRAZ
- `<leader>sp` - czeka na wprowadzenie znaku, który otoczy paragraf
- `<leader>ss` - czeka na wprowadzenie znaku, którym otoczy linię
- `<leader>sd` - czeka na wprowadzenie znaku, którym zostanie usunięty

W trybie **VISUAL** po zaznaczeniu tekstu należy nacisnąć `S` a następnie znak,
którym chcemy otoczyć zaznaczenie po czym naciskamy **ENTER**.

# Mapowanie pluginu Undotree

- `<leader>u` - uruchamia plugin Undotree

# Mapowanie pluginu signify

Plugin signify pokazuje zmiany w pliku jeśli ten jest w repozytorium Git.

- `gj` - przechodzi do kolejnej zmiany w pliku
- `gk` - przechodzi do poprzedniej zmiany w pliku
- `gJ` - przechodzi do ostatniej linii gdzie wystąpiła zmiana w pliku
- `gK` - przechodzi do pierwszej linii gdzie wystąpiła zmiana w pliku

# Mapowanie pluginu commentary

- `<ctrl-/>` - ustawia bieżącą linię lub zaznaczone linie jako komentarz

# Mapowanie pluginu Fern

- `a` - otwiera linię komend `action`
- `!` - pokazuje / chowa ukryte pliki
- `h` - zwija katalog
- `l` - rozwija katalog
- `ENTER` - wchodzi do katalogu
- `BACKSPACE` - przechodzi do katalogu wyżej
- `d` - tworzy nowy katalog
- `f` - tworzy nowy plik
- `n` - tworzy nowy plik / katalog / ścieżkę
- `E` - otwiera plik w nowym oknie
- `D` - usuwa plik
- `s` - otwiera plik w podziale poziomym
- `v` - otwiera plik w podziale pionowym
- `m` - zmienia nazwę lub przenosi plik
- `R` - otwiera okno do zmiany nazwy pliku lub zaznaczonych plików
- `Ctrl-j` - zaznacza / odznacza plik niżej
- `Ctrl-k` - zaznacza / odznacza plik wyżej
- `-` - zaznacza / odznacza plik

# Kolory

- `F8` - przełącza na kolejny schemat kolorów
- `Shift-F8` - przełącza na poprzedni schemat kolorów
- `F9` - banuje schemat kolorów
- `:Colors` - wyszukiwarka schematów kolorów

# Funkcje niestandardowe

- `RgFzf` - przeszukiwanie plików
- `RgNotes` - przeszukiwanie plików w katalogu `~/notes`
- `InsertLogEntry` - wstawia nagłówek MARKDOWN wraz aktualną datą i godziną
- `FileTime` - pokazuje datę modyfikacji pliku
- `CurTime` - pokazuje aktualną datę i godzinę
- `LS` - lista plików w bieżącej lokalizacji
- `Log` - otwiera plik `~/notes/log.md`

# Komendy pluginu FZF

| Command           | List                                                                    |
| ---               | ---                                                                     |
| `:Files [PATH]`   | Files (runs `$FZF_DEFAULT_COMMAND` if defined)                          |
| `:GFiles [OPTS]`  | Git files (`git ls-files`)                                              |
| `:GFiles?`        | Git files (`git status`)                                                |
| `:Buffers`        | Open buffers                                                            |
| `:Colors`         | Color schemes                                                           |
| `:Ag [PATTERN]`   | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `:Rg [PATTERN]`   | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
| `:Lines [QUERY]`  | Lines in loaded buffers                                                 |
| `:BLines [QUERY]` | Lines in the current buffer                                             |
| `:Tags [QUERY]`   | Tags in the project (`ctags -R`)                                        |
| `:BTags [QUERY]`  | Tags in the current buffer                                              |
| `:Marks`          | Marks                                                                   |
| `:Windows`        | Windows                                                                 |
| `:Locate PATTERN` | `locate` command output                                                 |
| `:History`        | `v:oldfiles` and open buffers                                           |
| `:History:`       | Command history                                                         |
| `:History/`       | Search history                                                          |
| `:Snippets`       | Snippets ([UltiSnips][us])                                              |
| `:Commits`        | Git commits (requires [fugitive.vim][f])                                |
| `:BCommits`       | Git commits for the current buffer                                      |
| `:Commands`       | Commands                                                                |
| `:Maps`           | Normal mode mappings                                                    |
| `:Helptags`       | Help tags <sup id="a1">[1](#helptags)</sup>                             |
| `:Filetypes`      | File types                                                              |

# Plugin fzf-preview.vim

Konfiguracja

```
let g:fzf_preview_window = 'right:60%'
```

| Command                 | List                                                                                |
| ---                     | ---                                                                                 |
| FZF/FZFFiles            | Search files with previewing file content.                                          |
| FZFLocate               | Use your system's file database to search files with previewing file content.       |
| FZFGGrep                | Use git grep to search your file content and preview the context of lines.          |
| FZFGrep                 | Use grep to search your file content and preview the context of lines.              |
| FZFAg                   | Use silversearcher-ag to search your file content and preview the context of lines. |
| FZFRg                   | Use ripgrep to search your file content and preview the context of lines.           |
| FZFHistory              | Browse edited files in vim's history list with previewing file content.             |
| FZFBLines               | Search all lines of the current buffer and previewing their context.                |
| FZFTags                 | Search all the tags in vim's tags and previewing their context.                     |
| FZFBTags                | Search all the tags of the current buffer and previewing their context.             |
| FZFMarks                | Search all the positions of vim's marks and preview their context.                  |
| FZFWindows              | Search all the vim's windows and preview their content.                             |
| FZFQuickFix/FZFLocList' | Search VIM's QuickFix/LocList entries with preview!                                 |

# Zarządzanie sesjami

Do zarządzania sesjami służy plugin Startify

- `SSave [nazwa-sesji]` - zapisanie sesji
- `SLoad [nazwa-sesji]` - odtworzenie sesji
- `SClose` - zakończenie sesji
- `SDelete [nazwa-sesji]` - usunięcie sesji

# Plugin vim-unimpaired

- https://github.com/tpope/vim-unimpaired

- `[<space>` - wstawia pustą linię powyżej
- `]<space>` - wstawia pustą linię poniżej
- `yox` - wyróżnia położenie kursora w linii i w kolumnie `:set cursorline!` oraz
  `:set cursorcolumn!`
