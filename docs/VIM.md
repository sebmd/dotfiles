# Vim

<!-- vim-markdown-toc GFM -->

* [Konfiguracja](#konfiguracja)
* [Niestandardowe mapowanie klawiszy](#niestandardowe-mapowanie-klawiszy)
    * [Tryb NORMAL](#tryb-normal)
    * [Tryb COMMAND](#tryb-command)
    * [Tryb INSERT](#tryb-insert)
    * [Praca z plikami Markdown i Vimwiki](#praca-z-plikami-markdown-i-vimwiki)
    * [Obsługa notatek w katalogu ~/notes/](#obsuga-notatek-w-katalogu-notes)
    * [Autouzupełnianie](#autouzupenianie)
    * [Mapowanie pluginu NERDTree](#mapowanie-pluginu-nerdtree)
    * [Mapowanie pluginu NNN.vim](#mapowanie-pluginu-nnnvim)
    * [Obsługa pluginu vim-surround](#obsuga-pluginu-vim-surround)
    * [Mapowanie pluginu Undotree](#mapowanie-pluginu-undotree)
    * [Mapowanie pluginu signify](#mapowanie-pluginu-signify)
    * [Mapowanie pluginu commentary](#mapowanie-pluginu-commentary)
    * [Mapowanie pluginu Fern](#mapowanie-pluginu-fern)
* [Pluginy](#pluginy)
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

# Niestandardowe mapowanie klawiszy

## Tryb NORMAL

Standardowo klawiszem LEADER jest znak `\` natomiast w tej konfiguracji klawiszem
LEADER jest klawisz `SPACJA`

Istnieje jeszcze dodatkowo LOCALLEADER, którym jest znak` \`

**Zmiany zachowania standardowych skrótów**

 - `j` - zmapowany jako skrót `gj`
 - `k` - zmapowany jako skrót `gk`
 - `gj` - przechodzi do następnej zmiany w pliku, jeśli ten jest w repozytorium
 Git, jest to funkcjonalność pluginu Signify
 - `gj` - przechodzi do poprzedniej zmiany w pliku, jeśli ten jest w repozytorium
 Git, jest to funkcjonalność pluginu Signify
 - `J` - łączy dwie linie nie zmieniając pozycji kursora
 - `Y` - kopiuje od kursora do końca linii
 - `n` - zmapowany jako `nzz`
 - `N` - zmapowany jako `Nzz`
 - `Q` - odtwarza zapisane makro `a` czyli zastępuje skrót `@a`
 - `x` - usuwa pojedynczy znak pod kursorem, ale nie zapisuje go w rejestrze
 - `X` - usuwa pojedynczy znak przed kursorem, ale nie zapisuje go w rejestrze

**Podstawowe skróty**

 - `th` - wyłącza podświetlanie wyszukiwanego tekstu
 - `qq` - wychodzi z edytora zastępuje `:q`
 - `qs` - zapisuje zmiany `:update` i wychodzi z edytora `:q`
 - `Q` - odtwarza zapisane makro `a` czyli zastępuje skrót `@a`
 - `<tab>` - przechodzi pomiędzy dwoma ostatnimi buforami
 - `dh` - usuwa od kursora do początku linii - `d0`
 - `dl` - usuwa od kursora do końca linii - `d$`
 - `gh` - przechodzi na początek linii
 - `gl` - przechodzi na koniec linii (nie działa z plikami vimwiki)

**Poruszanie się pomiędzy oknami**

 - `<ctrl-h>` - przechodzi do okna po lewej
 - `<ctrl-l>` - przechodzi do okna po prawej
 - `<ctrl-j>` - przechodzi do okna niżej
 - `<ctrl-k>` - przechodzi do okna wyżej

**Klawisz LEADER**

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
 - `<leader>e` - otwiera nowy plik dziennika w katalogu `~/notes`
 - `<leader>w` - zapisuje plik ` :update`
 - `<leader>b` - uruchamia polecenie `:Buffers` jest to funkcja pluginu `fzf.vim`
 - `<leader>s` - uruchamia sprawdzanie pisowni
 - `<leader>g` - uruchamia polecenie `:Rg` - przeszukiwanie pliku
 - `<leader>pr` - uruchamia polecenie `:ProjectFiles` w głównym katalogu repozytorium Git

## Tryb COMMAND

 - `<ctrl-h>` - przechodzi o jeden znak w lewo
 - `<ctrl-l>` - przechodzi o jeden znak w prawo
 - `<ctrl-k>` - poruszanie się po historii komend w górę
 - `<ctrl-j>` - poruszanie się po historii komend w dół

## Tryb INSERT

 - `<ctrl-h>` - przechodzi o jeden znak w lewo
 - `<ctrl-l>` - przechodzi o jeden znak w prawo
 - `<ctrl-k>` - przechodzi o jedną linię w górę
 - `<ctrl-j>` - przechodzi o jedną linię w dół
 
## Praca z plikami Markdown i Vimwiki

- `,m` - wstawia nagłówek pierwszego stopnia oraz bieżącą datę i godzinę
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

## Obsługa notatek w katalogu ~/notes/

- `:RgNotes` - przeszukiwanie plików w katalogu `~/notes/`
- `:Notes` - wyszukiwanie plików w katalogu `~/notes/`
- `:Log` - edycja pliku `~/notes/log.md`
- `<leader>sn` - kopiuje linię / zaznaczenie do pliku `~/notes/notatki.md`
- `<leader>sN` - przenosi linię / zaznaczenie do pliku `~/notes/notatki.md`
- `<leader>e` - otwiera plik `~/notes/ + bieżąca data`
- `<leader>en` - otwiera plik `~/notes/notatki.md`
- `<leader>Fn` wyszukiwanie plików z podglądem w katalogu `~/notes/` uruchamia
  polecenie `:Notes`

## Autouzupełnianie

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

## Mapowanie pluginu NERDTree

 - `<leader>n` - uruchamia menadżer plików NERDTree

## Mapowanie pluginu NNN.vim

 - `<leader>N` - uruchamia menadżer plików NNN

## Obsługa pluginu vim-surround

 - `<leader>sw` - czeka na wprowadzenie znaku, którym otoczy wyraz
 - `<leader>sW` - czeka na wprowadzenie znaku, którym otoczy WYRAZ
 - `<leader>sp` - czeka na wprowadzenie znaku, który otoczy paragraf
 - `<leader>ss` - czeka na wprowadzenie znaku, którym otoczy linię
 - `<leader>sd` - czeka na wprowadzenie znaku, którym zostanie usunięty

W trybie **VISUAL** po zaznaczeniu tekstu należy nacisnąć `S` a następnie znak,
którym chcemy otoczyć zaznaczenie po czym naciskamy **ENTER**.

## Mapowanie pluginu Undotree

 - `<leader>u` - uruchamia plugin Undotree

## Mapowanie pluginu signify

Plugin signify pokazuje zmiany w pliku jeśli ten jest w repozytorium Git.

 - `gj` - przechodzi do kolejnej zmiany w pliku
 - `gk` - przechodzi do poprzedniej zmiany w pliku
 - `gJ` - przechodzi do ostatniej linii gdzie wystąpiła zmiana w pliku
 - `gK` - przechodzi do pierwszej linii gdzie wystąpiła zmiana w pliku

## Mapowanie pluginu commentary

 - `<ctrl-/>` - ustawia bieżącą linię lub zaznaczone linie jako komentarz

## Mapowanie pluginu Fern

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

# Pluginy

 - [fern.vim]
 - [fzf-preview.vim]
 - [fzf.vim]
 - [CtrlSF]
 - [git-messenger]
 - [goyo]
 - [gv]
 - [indentLine]
 - [limelight]
 - [nerdtree-git-plugin] - rozszerzenie dla NERDTree
 - [NERDTree] - menadżer plików
 - [quick-scope]
 - [undotree] - drzewo zmian
 - [vim-abolish]
 - [vim-airline] - linia statusu
 - [vim-colorscheme-manager] - schmaty kolorów
 - [vim-colorscheme-switcher] - przełączanie schematów kolorów
 - [vim-commentary]
 - [vim-eunuch] - dodaje polecenia systemu Linux np: `Mkdir` czy `Chmod`
 - [vim-fugitive]
 - [vim-markdown-toc] - automatycznie tworzy i aktualizuje spis treści dla plików Markdown
 - [vim-peekaboo]
 - [vim-plug] - zarządzanie pluginami
 - [vim-repeat] - dodatkowe obiekty tekstowe na których można używać powtórzeń `.`
 - [vim-signify] - pokazuje zmiany w pliku względem popzedniej wersji w repozytorium Git
 - [vim-startify] - ekran startowy
 - [vim-surround]
 - [vim-unimpaired]

[vim-abolish]: https://github.com/tpope/vim-abolish
[vim-eunuch]: https://github.com/tpope/vim-eunuch
[indentLine]: https://github.com/Yggdroot/indentLine
[vim-peekaboo]: https://github.com/junegunn/vim-peekaboo
[vim-markdown-toc]: https://github.com/junegunn/vim-markdown-toc
[limelight]: https://github.com/junegunn/limelight.vim
[goyo]: https://github.com/junegunn/goyo.vim
[fern.vim]: https://github.com/lambdalisue/fern.vim
[vim-plug]: https://github.com/junegunn/vim-plug/
[fzf.vim]: https://github.com/junegunn/fzf.vim/
[undotree]: https://github.com/mbbill/undotree
[vim-startify]: https://github.com/mhinz/vim-startify
[vim-commentary]: https://github.com/tpope/vim-commentary
[vim-repeat]: https://github.com/tpope/vim-repeat
[vim-surround]: https://github.com/tpope/vim-surround
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-unimpaired]: https://github.com/tpope/vim-unimpaired
[NERDTree]: https://github.com/preservim/nerdtree
[nerdtree-git-plugin]: https://github.com/Xuyuanp/nerdtree-git-plugin
[gv]: https://github.com/junegunn/gv.vim
[git-messenger]: https://github.com/rhysd/git-messenger.vim
[vim-signify]: https://github.com/mhinz/vim-signify
[quick-scope]: https://github.com/unblevable/quick-scope
[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-colorscheme-switcher]: https://github.com/xolox/vim-colorscheme-switcher
[vim-colorscheme-manager]: https://github.com/Taverius/vim-colorscheme-manager
[fzf-preview.vim]:https://github.com/chengzeyi/fzf-preview.vim
[CtrlSF]:https://github.com/dyng/ctrlsf.vim

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
