# dotfiles


<!-- vim-markdown-toc GFM -->

* [Vim](#vim)
    * [Pluginy](#pluginy)
    * [Funkcje](#funkcje)
    * [Komendy pluginu FZF](#komendy-pluginu-fzf)
    * [Plugin vimfiler](#plugin-vimfiler)
    * [Zarządzanie sesjami](#zarzdzanie-sesjami)

<!-- vim-markdown-toc -->

# Vim

## Pluginy

  - [vim-plug]
  - [fzf.vim]
  - [undotree]
  - [vim-startify]
  - [vimfiler]
  - [vim-commentary]
  - [vim-repeat]
  - [vim-surround]
  - [vim-fugitive]
  - [vim-unimpaired]
  - [gv]
  - [git-messenger]
  - [vim-signify]
  - [quick-scope]
  - [vim-airline]

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

