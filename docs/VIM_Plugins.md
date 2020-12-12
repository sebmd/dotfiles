# Pluginy

<!-- vim-markdown-toc GFM -->

* [Schematy kolorów](#schematy-kolorów)
    * [gruvbox](#gruvbox)
    * [gruvbox-material](#gruvbox-material)
    * [base16-vim](#base16-vim)
    * [vim-colorschemes](#vim-colorschemes)
    * [vim-colorscheme-manager](#vim-colorscheme-manager)
    * [vim-colorscheme-switcher](#vim-colorscheme-switcher)
* [Autouzupełnianie](#autouzupenianie)
    * [AutoComplPop](#autocomplpop)
    * [coc.nvim](#cocnvim)
    * [YouCompleteMe](#youcompleteme)
* [Menadżery plików](#menadery-plików)
    * [nerdtree-git-plugin](#nerdtree-git-plugin)
    * [fern-bookmark.vim](#fern-bookmarkvim)
    * [fern-renderer-nerdfont.vim](#fern-renderer-nerdfontvim)
    * [fern.vim](#fernvim)
    * [nerdfont.vim](#nerdfontvim)
    * [nnn.vim](#nnnvim)
    * [NERDTree](#nerdtree)
* [Notatki](#notatki)
    * [memolist.vim](#memolistvim)
    * [vimwiki](#vimwiki)
    * [vim-bujo](#vim-bujo)
    * [vim-markdown-toc](#vim-markdown-toc)
* [Git](#git)
    * [gv.vim](#gvvim)
    * [vim-signify](#vim-signify)
    * [vim-fugitive](#vim-fugitive)
    * [git-messenger.vim](#git-messengervim)
    * [fzf-checkout.vim](#fzf-checkoutvim)
* [Inne](#inne)
    * [fzf](#fzf)
    * [fzf.vim](#fzfvim)
    * [fzf-preview.vim](#fzf-previewvim)
    * [indentLine](#indentline)
    * [ale](#ale)
    * [ctrlsf.vim](#ctrlsfvim)
    * [vim-easymotion](#vim-easymotion)
    * [goyo.vim](#goyovim)
    * [limelight.vim](#limelightvim)
    * [vim-peekaboo](#vim-peekaboo)
    * [vim-cheat40](#vim-cheat40)
    * [vim-clap](#vim-clap)
    * [vim-which-key](#vim-which-key)
    * [undotree](#undotree)
    * [vim-startify](#vim-startify)
    * [pear-tree](#pear-tree)
    * [vim-abolish](#vim-abolish)
    * [vim-commentary](#vim-commentary)
    * [vim-eunuch](#vim-eunuch)
    * [vim-repeat](#vim-repeat)
    * [ReplaceWithRegister](#replacewithregister)
    * [vim-surround](#vim-surround)
    * [vim-unimpaired](#vim-unimpaired)
    * [quick-scope](#quick-scope)
    * [vim-airline](#vim-airline)
    * [vim-airline-themes](#vim-airline-themes)
    * [vim-go](#vim-go)
    * [vim-gnupg](#vim-gnupg)

<!-- vim-markdown-toc -->

# Schematy kolorów

## gruvbox

Instalacja

```vim
Plug 'gruvbox-community/gruvbox'
```

## gruvbox-material

Instalacja

```vim
Plug 'sainnhe/gruvbox-material'
```

## base16-vim

Instalacja

```vim
Plug 'chriskempson/base16-vim'
```

## vim-colorschemes

Instalacja

```vim
Plug 'flazz/vim-colorschemes'
```

## vim-colorscheme-manager
 
 Instalacja

```vim
Plug 'Taverius/vim-colorscheme-manager'
```

## vim-colorscheme-switcher

Przełączanie kolorów

Do pracy plugin wymaga pluginu `xolox/vim-misc`

Instalacja

```vim
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
```

# Autouzupełnianie

## AutoComplPop

Instalacja

```vim
Plug 'vim-scripts/AutoComplPop'
```

## coc.nvim

Do pracy pluginu jest wymagany `nodejs`

- https://github.com/neoclide/coc.nvim

Instalacja

```vim
Plug 'neoclide/coc.nvim'
```

## YouCompleteMe

Plugin wymagan Pythona > 3.5 oraz dodatkowych pakietów do kompilacji
oprogramowania.

Instalacja

```vim
Plug 'ycm-core/YouCompleteMe'
```

# Menadżery plików

## nerdtree-git-plugin

Integracja NERDTree z repozytoriami Git

Instalacja

```vim
Plug 'Xuyuanp/nerdtree-git-plugin'
```

## fern-bookmark.vim

Instalacja

```vim
Plug 'lambdalisue/fern-bookmark.vim'
```

## fern-renderer-nerdfont.vim

Instalacja

```vim
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
```

## fern.vim

Menadżer plików Fern

Instalacja

```vim
Plug 'lambdalisue/fern.vim'
```

## nerdfont.vim

Instalacja

```vim
Plug 'lambdalisue/nerdfont.vim'
```

## nnn.vim

Instalacja

```vim
Plug 'mcchrish/nnn.vim'
```

## NERDTree

Instalacja

```vim
Plug 'preservim/nerdtree'
```

# Notatki

## memolist.vim

Instalacja

```vim
Plug 'glidenote/memolist.vim'
```

## vimwiki

Instalacja

```vim
Plug 'vimwiki/vimwiki'
```

## vim-bujo

Instalacja

```vim
Plug 'vuciv/vim-bujo'
```

## vim-markdown-toc

Generowanie i automatyczna aktualizacja spisu treści w plikach Markdown

Instalacja

```vim
Plug 'junegunn/vim-markdown-toc'
```

Generowanie spisu treści

```vim
:GenTocGFM
```

# Git

## gv.vim

Instalacja

```vim
Plug 'junegunn/gv.vim'
```

## vim-signify

Instalacja

```vim
Plug 'mhinz/vim-signify'
```

## vim-fugitive

Instalacja

```vim
Plug 'tpope/vim-fugitive'
```

## git-messenger.vim

Instalacja

```vim
Plug 'rhysd/git-messenger.vim'
```

## fzf-checkout.vim

Instalacja

```vim
Plug 'stsewd/fzf-checkout.vim'
```

# Inne

## fzf

Instalacja

```vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
```

## fzf.vim

Instalacja

```vim
Plug 'junegunn/fzf.vim'
```

## fzf-preview.vim

Instalacja

```vim
Plug 'chengzeyi/fzf-preview.vim'
```

## indentLine

Instalacja

```vim
Plug 'Yggdroot/indentLine'
```

## ale

Instalacja

```vim
Plug 'dense-analysis/ale'
```

## ctrlsf.vim

Instalacja

```vim
Plug 'dyng/ctrlsf.vim'
```

## vim-easymotion

Instalacja

```vim
Plug 'easymotion/vim-easymotion'
```

## goyo.vim

Instalacja

```vim
Plug 'junegunn/goyo.vim'
```

## limelight.vim

Instalacja

```vim
Plug 'junegunn/limelight.vim'
```

## vim-peekaboo

Instalacja

```vim
Plug 'junegunn/vim-peekaboo'
```

## vim-cheat40

Instalacja

```vim
Plug 'lifepillar/vim-cheat40'
```

## vim-clap

Instalacja

```vim
Plug 'liuchengxu/vim-clap'
```

## vim-which-key

Instalacja

```vim
Plug 'liuchengxu/vim-which-key'
```

## undotree

Instalacja

```vim
Plug 'mbbill/undotree'
```

## vim-startify

Instalacja

```vim
Plug 'mhinz/vim-startify'
```

## pear-tree

Instalacja

```vim
Plug 'tmsvg/pear-tree'
```

URL: https://github.com/tmsvg/pear-tree

Konfiguracja

```vim
let g:pear_tree_pairs = {
    \ '('  : {'closer': ')'},
    \ '['  : {'closer': ']'},
    \ '{'  : {'closer': '}'},
    \ "'"  : {'closer': "'"},
    \ '"'  : {'closer': '"'},
    \ '`'  : {'closer': '`'},
    \ '```': {'closer': '```'}
    \ }
```

## vim-abolish

Instalacja

```vim
Plug 'tpope/vim-abolish'
```

## vim-commentary

Instalacja

```vim
Plug 'tpope/vim-commentary'
```

## vim-eunuch

Instalacja

```vim
Plug 'tpope/vim-eunuch'
```

## vim-repeat

Instalacja

```vim
Plug 'tpope/vim-repeat'
```

## ReplaceWithRegister

Instalacja

```vim
Plug 'vim-scripts/ReplaceWithRegister'
```

## vim-surround

Instalacja

```vim
Plug 'tpope/vim-surround'
```

## vim-unimpaired

Instalacja

```vim
Plug 'tpope/vim-unimpaired'
```

## quick-scope

Instalacja

```vim
Plug 'unblevable/quick-scope'
```

## vim-airline

Linia statusu

Instalacja

```vim
Plug 'vim-airline/vim-airline'
```

## vim-airline-themes

Tematy dla linii statusu

Instalacja

```vim
Plug 'vim-airline/vim-airline-themes'
```

## vim-go

```vim
Plug 'fatih/vim-go'
```

##  vim-gnupg

```vim
Plug 'jamessan/vim-gnupg'
```
