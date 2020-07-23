# dotfiles


<!-- vim-markdown-toc GFM -->

* [Instalacja](#instalacja)
    * [Pobranie repozytorium](#pobranie-repozytorium)
    * [Uruchomienie instalatora](#uruchomienie-instalatora)
* [Vim](#vim)
    * [Konfiguracja](#konfiguracja)
    * [Niestandardowe mapowanie klaiwszy](#niestandardowe-mapowanie-klaiwszy)
        * [Klaiwsz LEADER](#klaiwsz-leader)
        * [Tryb COMMAND](#tryb-command)
        * [Tryb INSERT](#tryb-insert)
        * [Mapowanie pluginu NNN.vim](#mapowanie-pluginu-nnnvim)
        * [Obsługa pluginu vim-surround](#obsuga-pluginu-vim-surround)
        * [Mapowanie pluginu signify](#mapowanie-pluginu-signify)
        * [Mapowanie pluginu commentary](#mapowanie-pluginu-commentary)
    * [Pluginy](#pluginy)
    * [Kolory](#kolory)
    * [Funkcje](#funkcje)
    * [Komendy pluginu FZF](#komendy-pluginu-fzf)
    * [Plugin fzf-preview.vim](#plugin-fzf-previewvim)
    * [Plugin vimfiler](#plugin-vimfiler)
    * [Zarządzanie sesjami](#zarzdzanie-sesjami)
* [Aliasy bash](#aliasy-bash)
* [Tmux skróty klawiszowe](#tmux-skróty-klawiszowe)
    * [Prefix](#prefix)
    * [Wejście do trybu komend](#wejcie-do-trybu-komend)
    * [Odłączenie się od bieżącej sesji](#odczenie-si-od-biecej-sesji)
    * [Dzielenie okna na panele](#dzielenie-okna-na-panele)
    * [Poruszanie się pomiędzy panelami](#poruszanie-si-pomidzy-panelami)
    * [Utworznie nowego okna](#utworznie-nowego-okna)
    * [Zmiana nazwy okna](#zmiana-nazwy-okna)
    * [Przechodzenie pomiędzy oknami](#przechodzenie-pomidzy-oknami)
    * [Zarządzanie oknami](#zarzdzanie-oknami)
    * [Użycie Shift-Strzałki do zmiany sesji](#uycie-shift-strzaki-do-zmiany-sesji)
    * [Przeładowanie konfiguracji tmux](#przeadowanie-konfiguracji-tmux)

<!-- vim-markdown-toc -->

# Instalacja

## Pobranie repozytorium

```
git clone https://github.com/sebmd/dotfiles
```

## Uruchomienie instalatora

Instalator utworzy linki sysmboliczne do repozytorium 'dotfiles'.
Wszystkie pliki, które już istnieją zostaną przeniesione do katalogu
`~/.backup`.

```
cd dotfiles
./install.sh
```

# Vim

## Konfiguracja

Dodatkową konfigurację można wprowadzać w plikach `~/.vimrc.local`
lub `~/.vim/vimrc.local`, dzięki czemu nie trzeba modyfikować orgyginalnej
konfiguracji.

## Niestandardowe mapowanie klaiwszy

 - `th` - wyłącza podświetlanie wyszukiwanego tekstu
 - `gh` - przechodzi na początek linii
 - `gl` - przechodzi na koniec linii
 - `qq` - wychodzi z edytora zastępuje `:q`
 - `qs` - zapisuje zmiany `:update` i wychodzi z edytora `:q`
 - `Q` - wychodzi z edytora bez zapisania zmian `:q!`
 - `<tab>` - przechodzi pomiędzy dwoma ostatnimi buforami
 - `<ctrl-h>` - przechodzi do okna po lewej
 - `<ctrl-l>` - przechodzi do okna po prawej
 - `<ctrl-j>` - przechodzi do okna niżej
 - `<ctrl-k>` - przechodzi do okna wyżej

### Klaiwsz LEADER

Standardowo klawiszem LEADER jest znak `\` natomiast w tej konfiguracji klawiszem
LEADER jest klawisz `SPACJA`

Istnieje jeszcze dodatkowo LOCALLEADER, którym jest znak` \`

 - `<leader>;` - wchodzi do trybu komend - `:`
 - `<leader>,` - przechodzi do poprzedniego bufora
 - `<leader>.` - przechodzi do następnego bufora
 - `<leader>o` - ustawia bieżące okno jako główne chowając resztę okien
 - `<leader>cd` - przechodzi do katalogu w którym znajduje się edytowany plik
 - `<leader>cp` - klonuje bieżący paragraf
 - `<leader>ps` - wchodzi / wychodzi w tryb paste
 - `<leader>v` - otwiera plik `vimrc`
 - `<leader>r` - przeładowuje plik `vimrc`
 - `<leader>t` - uruchamia terminal (podział poziomy)
 - `<leader>tv` - uruchamia terminal (podział pionowy)
 - `<leader>E` - uruchamia bieżącą linię jako polecenie systemowe wynik wkleja do bufora
 - `<leader>ve` - uruchamia bieżącą linię jako polecenie edytora Vim
 - `<leader>e` - otweira nowy plik dziennika w katalogu `~/notes`

### Tryb COMMAND

 - `<ctrl-h>` - przechodzi o jeden znak w lewo
 - `<ctrl-l>` - przechodzi o jeden znak w prawo
 - `<ctrl-k>` - poruszanie się po historii komend w górę
 - `<ctrl-j>` - poruszanie się po historii komend w dół

### Tryb INSERT

 - `<ctrl-h>` - przechodzi o jeden znak w lewo
 - `<ctrl-l>` - przechodzi o jeden znak w prawo
 - `<ctrl-k>` - przechodzi o jedeą linię w górę
 - `<ctrl-j>` - przechodzi o jedeą linię w dół
 
 ### Mapowanie pluginu NERDTree
 
  - `<leader>n` - uruchamia menadżer plików NERDTree

### Mapowanie pluginu NNN.vim

  - `<leader>N` - uruchamia menadżer plików NNN

### Obsługa pluginu vim-surround

  - `<leader>sw` - czeka na wprowadzenie znaku, którym otoczy wyraz
  - `<leader>sW` - czeka na wprowadzenie znaku, którym otoczy WYRAZ
  - `<leader>sp` - czeka na wprowadzenie znaku, który otoczy paragraf
  - `<leader>ss` - czeka na wprowadzenie znaku, którym otoczy linię
  - `<leader>sd` - czeka na wprowadzenie znaku, którym zostanie usunięty
 
 ### Mapowanie pluginu Undotree
 
 - `<leader>u` - uruchamia plugin Undotree

### Mapowanie pluginu signify

Plugin signify pokazuje zmiany w pliku jeśli ten jest w repozytorium Git.

- `gj` - przechodzi do kolejnej zmiany w pliku
- `gk` - przechodzi do poprzedniej zmiany w pliku
- `gJ` - przechodzi do ostatniej linii gdzie wystąpiła zmiana w pliku
- `gK` - przechodzi do pierwszej linii gdzie wystąpiła zmiana w pliku

### Mapowanie pluginu commentary

 - `<ctrl-/>` - ustawia bieżącą linię lub zaznaczone linie jako komentarz

## Pluginy

  - [fzf-preview.vim]
  - [fzf.vim]
  - [git-messenger]
  - [goyo]
  - [gv]
  - [indentLine]
  - [limelight]
  - [NERDTree]
  - [nerdtree-git-plugin]
  - [quick-scope]
  - [undotree]
  - [vim-airline]
  - [vim-colorscheme-manager]
  - [vim-colorscheme-switcher]
  - [vim-commentary]
  - [vim-fugitive]
  - [vim-markdown-toc]
  - [vim-peekaboo]
  - [vim-plug]
  - [vim-repeat]
  - [vim-signify]
  - [vim-startify]
  - [vim-surround]
  - [vim-unimpaired]

[indentLine]: https://github.com/Yggdroot/indentLine
[vim-peekaboo]: https://github.com/junegunn/vim-peekaboo
[vim-markdown-toc]: https://github.com/junegunn/vim-markdown-toc
[limelight]: https://github.com/junegunn/limelight.vim
[goyo]: https://github.com/junegunn/goyo.vim
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

## Kolory

- `F8` - przełącza na kolejny schemat
- `Shift-F8` - przełącza na poprzedni schemat
- `F9` - banuje schemat

Oto kilka fajniejszych schematów:

- ayu
- cosmic_latte
- despacio
- gruvbox
- gruvbox-material
- hydrangea-vim
- iceberg.vim
- molokai
- nord-vim
- snow
- stellarized
- vim-deep-space
- vim-hybrid
- vim-tomorrow-theme

## Funkcje

  - RgFZF
  - RgNotes
  - InsertLogEntry
  - FileTime
  - CurTime
  - LS
  - Log

## Komendy pluginu FZF

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

## Plugin fzf-preview.vim

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

## Plugin vimfiler

Ustawienie vimfiler jako domyślnego menadżera plików

```
:let g:vimfiler_as_default_explorer = 1
```

## Zarządzanie sesjami

Do zarządzania sesjami służy plugin Startify

- `SSave [nazwa-sesji]` - zapisanie sesji
- `SLoad [nazwa-sesji]` - odtworzenie sesji
- `SClose` - zakończenie sesji
- `SDelete [nazwa-sesji]` - usunięcie sesji

# Aliasy bash

| Alias    | Komenda                                       |
| ---      | ---                                           |
| `v`      | `vim`                                         |
| `t`      | `tmux`                                        |
| `ta`     | `tmux atta`                                   |
| `aliases | `vim $HOME/.aliases && source $HOME/.aliases` |
| `vrc`    | `vim $HOME/.vim/vimrc`                        |
| `vimrc`  | `vrc`                                         |
| `q`      | `exit`                                        |
| `more`   | `less`                                        |
| `so`     | `source`                                      |
| `n`      | `vim -c "e $HOME/notes"`                      |
| `pwgen`  | `pwgen -c -s -n -y -1 32`                     |
| `p`      | `pass`                                        |
| `df`     | `df -h`                                       |
| `free`   | `free -m`                                     |

# Tmux skróty klawiszowe

## Prefix

Tmux standardowo jako prefiksu używa skrótu `ctrl-b` natomiast Ci, którzy są
przyzwyczajeni do programu `screen` używają skrótu `ctrl-a`, w tej konfiguracji
jako prefiks jest ustawiony skrót `ctrl-a`.

## Wejście do trybu komend

  * `Prefix-:`

## Odłączenie się od bieżącej sesji

  * `Prefix-d`


## Dzielenie okna na panele

  * `Prefix-\` - dzielenie okna pionowo
  * `Prefix--` - dzielenie okna poziomo

## Poruszanie się pomiędzy panelami

Użycie klawisza `Alt`

  * `Alt-Left`  - przejście do panelu po lewej
  * `Alt-Right` - przejście do panelu po prawej
  * `Alt-Down`  - przejście do panelu na dole
  * `Alt-Up`    - przejście do panelu na górze

Użycie prefiksu + hjkl

  * `Prefix-h` - przechodzi do panelu po lewej
  * `Prefix-j` - przechodzi do panelu na dole
  * `Prefix-k` - przechodzi do panelu na górze - aktualnie nie działa
  * `Prefix-l` - przechodzi do panelu po prawej

## Utworznie nowego okna

  * `Prefix-c` - tworzy nowe okno

## Zmiana nazwy okna

  * `Prefix-:` - zmiana nazwy bieżącego okna

## Przechodzenie pomiędzy oknami

Użycie Ctrl-Strzałki do zmiany okna

  * `Ctrl-Left` - poprzednie okno
  * `Ctrl-Right` - następne okno
  * `Ctrl-Up` - ostatie okno
  * `Ctrl-Down` - lista wyboru okna

## Zarządzanie oknami

  * `Prefix-k` - zamknij okno - wymaga potwierdzenia
  * `Prefix-K` - zamknij okno

## Użycie Shift-Strzałki do zmiany sesji

  * `Shift-Left` - poprzednia sesja
  * `Shift-Right` - następna sesja
  * `Shift-Up` - ostatnia sesja
  * `Shift-Down` - wybór sesji

## Przeładowanie konfiguracji tmux

  * `Prefix-r` przeładowanie konfiguracji tmux
