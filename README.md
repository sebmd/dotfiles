# dotfiles


<!-- vim-markdown-toc GFM -->

* [Vim](#vim)
    * [Pluginy](#pluginy)
    * [Kolory](#kolory)
    * [Funkcje](#funkcje)
    * [Komendy pluginu FZF](#komendy-pluginu-fzf)
    * [Plugin vimfiler](#plugin-vimfiler)
    * [Zarządzanie sesjami](#zarzdzanie-sesjami)
* [Aliasy bash](#aliasy-bash)

<!-- vim-markdown-toc -->

# Vim

## Pluginy

  - [fzf.vim]
  - [git-messenger]
  - [goyo]
  - [gv]
  - [indentLine]
  - [limelight]
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
  - [vimfiler]

[indentLine]: https://github.com/Yggdroot/indentLine
[vim-peekaboo]: https://github.com/junegunn/vim-peekaboo
[vim-markdown-toc]: https://github.com/junegunn/vim-markdown-toc
[limelight]: https://github.com/junegunn/limelight.vim
[goyo]: https://github.com/junegunn/goyo.vim
[vim-plug]: https://github.com/junegunn/vim-plug/
[fzf.vim]: https://github.com/junegunn/fzf.vim/
[undotree]: https://github.com/mbbill/undotree
[vim-startify]: https://github.com/mhinz/vim-startify
[vimfiler]: https://github.com/Shougo/vimfiler.vim
[vim-commentary]: https://github.com/tpope/vim-commentar://github.com/tpope/vim-commentary
[vim-repeat]: https://github.com/tpope/vim-repeat
[vim-surround]: https://github.com/tpope/vim-surround
[vim-fugitive]: https://github.com/tpope/vim-fugitive
[vim-unimpaired]: https://github.com/tpope/vim-unimpaired
[gv]: https://github.com/junegunn/gv.vim
[git-messenger]: https://github.com/rhysd/git-messenger.vim
[vim-signify]: https://github.com/mhinz/vim-signify
[quick-scope]: https://github.com/unblevable/quick-scope
[vim-airline]: https://github.com/vim-airline/vim-airline
[vim-colorscheme-switcher]: https://github.com/xolox/vim-colorscheme-switcher
[vim-colorscheme-manager]: https://github.com/Taverius/vim-colorscheme-manager

## Kolory

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
| ``:Filetypes``    | File types                                                              |

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
