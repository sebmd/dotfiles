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
    * [vim-surround](#vim-surround)
    * [vim-unimpaired](#vim-unimpaired)
    * [quick-scope](#quick-scope)
    * [vim-airline](#vim-airline)
    * [vim-airline-themes](#vim-airline-themes)
    * [vim-go](#vim-go)

<!-- vim-markdown-toc -->

# Schematy kolorów

## gruvbox

Instalacja
```
Plug 'gruvbox-community/gruvbox'
```

## gruvbox-material

Instalacja
```
Plug 'sainnhe/gruvbox-material'
```

## base16-vim

Instalacja
```
Plug 'chriskempson/base16-vim'
```

## vim-colorschemes

Instalacja
```
Plug 'flazz/vim-colorschemes'
```

## vim-colorscheme-manager
 
 Instalacja
 ```
 Plug 'Taverius/vim-colorscheme-manager'
 ```

## vim-colorscheme-switcher

Przełączanie kolorów

Do pracy plugin wymaga pluginu `xolox/vim-misc`

Instalacja
```
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
```

# Autouzupełnianie

## AutoComplPop

Instalacja
```
Plug 'vim-scripts/AutoComplPop'
```

## coc.nvim

Do pracy pluginu jest wymagany `nodejs`

- https://github.com/neoclide/coc.nvim

Instalacja
```
Plug 'neoclide/coc.nvim'
```

## YouCompleteMe

Plugin wymagan Pythona > 3.5 oraz dodatkowych pakietów do kompilacji
oprogramowania.

Instalacja
```
Plug 'ycm-core/YouCompleteMe'
```

# Menadżery plików

## nerdtree-git-plugin

Integracja NERDTree z repozytoriami Git

Instalacja
```
Plug 'Xuyuanp/nerdtree-git-plugin'
```

## fern-bookmark.vim

Instalacja
```
Plug 'lambdalisue/fern-bookmark.vim'
```

## fern-renderer-nerdfont.vim

Instalacja
```
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
```

## fern.vim

Menadżer plików Fern

Instalacja
```
Plug 'lambdalisue/fern.vim'
```

## nerdfont.vim

Instalacja
```
Plug 'lambdalisue/nerdfont.vim'
```

## nnn.vim

Instalacja
```
Plug 'mcchrish/nnn.vim'
```

## NERDTree

Instalacja
```
Plug 'preservim/nerdtree'
```

# Notatki

## memolist.vim

Instalacja
```
Plug 'glidenote/memolist.vim'
```

## vimwiki

Instalacja
```
Plug 'vimwiki/vimwiki'
```

## vim-bujo

Instalacja
```
Plug 'vuciv/vim-bujo'
```

## vim-markdown-toc

Generowanie i automatyczna aktualizacja spisu treści w plikach Markdown

Instalacja
```
Plug 'junegunn/vim-markdown-toc'
```

Generowanie spisu treści
```
:GenTocGFM
```

# Git

## gv.vim

Instalacja
```
Plug 'junegunn/gv.vim'
```

## vim-signify

Instalacja
```
Plug 'mhinz/vim-signify'
```

## vim-fugitive

Instalacja
```
Plug 'tpope/vim-fugitive'
```

## git-messenger.vim

Instalacja
```
Plug 'rhysd/git-messenger.vim'
```

## fzf-checkout.vim

Instalacja
```
Plug 'stsewd/fzf-checkout.vim'
```

# Inne

## fzf

Instalacja
```
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
```

## fzf.vim

Instalacja
```
Plug 'junegunn/fzf.vim'
```

## fzf-preview.vim

Instalacja
```
Plug 'chengzeyi/fzf-preview.vim'
```

## indentLine

Instalacja
```
Plug 'Yggdroot/indentLine'
```

## ale

Instalacja
```
Plug 'dense-analysis/ale'
```

## ctrlsf.vim

Instalacja
```
Plug 'dyng/ctrlsf.vim'
```

## vim-easymotion

Instalacja
```
Plug 'easymotion/vim-easymotion'
```

## goyo.vim

Instalacja
```
Plug 'junegunn/goyo.vim'
```

## limelight.vim

Instalacja
```
Plug 'junegunn/limelight.vim'
```

## vim-peekaboo

Instalacja
```
Plug 'junegunn/vim-peekaboo'
```

## vim-cheat40

Instalacja
```
Plug 'lifepillar/vim-cheat40'
```

## vim-clap

Instalacja
```
Plug 'liuchengxu/vim-clap'
```

## vim-which-key

Instalacja
```
Plug 'liuchengxu/vim-which-key'
```

## undotree

Instalacja
```
Plug 'mbbill/undotree'
```

## vim-startify

Instalacja
```
Plug 'mhinz/vim-startify'
```

## pear-tree

Instalacja
```
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
```
Plug 'tpope/vim-abolish'
```

## vim-commentary

Instalacja
```
Plug 'tpope/vim-commentary'
```

## vim-eunuch

Instalacja
```
Plug 'tpope/vim-eunuch'
```

## vim-repeat

Instalacja
```
Plug 'tpope/vim-repeat'
```

## vim-surround

Instalacja
```
Plug 'tpope/vim-surround'
```

## vim-unimpaired

Instalacja
```
Plug 'tpope/vim-unimpaired'
```

## quick-scope

Instalacja
```
Plug 'unblevable/quick-scope'
```

## vim-airline

Linia statusu

Instalacja
```
Plug 'vim-airline/vim-airline'
```

## vim-airline-themes

Tematy dla linii statusu

Instalacja
```
Plug 'vim-airline/vim-airline-themes'
```

## vim-go

```
Plug 'fatih/vim-go'
```
