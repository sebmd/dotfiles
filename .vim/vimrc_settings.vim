set nocompatible                " wyłączenie wstecznej kompatybilności z edytorem vi
syntax on                       " podkreślanie składni
set nu rnu                      " number, relativenumber
set ts=4 sw=4 sts=4 et sta      " tabstop, shiftwidth, softtabstop, expandtab, smarttab
set path-=/usr/include
set path+=**
set wildmenu
set wildmode=list:longest,full
set foldmethod=marker
set foldcolumn=1
set splitright
set splitbelow
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a
set hidden
set noshowmode
set nowrap
set smartcase
set incsearch
set undodir=~/.vim/undo
set undofile
set undolevels=10000
if has("nvim")
    set viminfo='100,n$HOME/.config/nvim/viminfo/viminfo
    set viewdir=$HOME/.config/nvim/view
else
    set viminfo+=n$HOME/.vim/viminfo/viminfo
    set viewdir=$HOME/.vim/view
    set cm=blowfish2
    "set key=dupa123
endif
set laststatus=2
set cmdheight=2
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=nbsp:⦸
set listchars+=tab:▸\ ,
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=trail:•
set listchars+=eol:¬
set fillchars+=vert:\ 
set showbreak=↪
set scrolloff=5
set autochdir
setlocal spelllang=pl
set lazyredraw  " szybciej wykonuje makra
set encoding=utf-8
set textwidth=80
set cursorline
set colorcolumn=+1
set background=dark
set complete+=kspell " Ctrl+p w trybie INSERT podpowiedzi ze słownika wymaga włączenia trybu spell
set completeopt=menuone,longest,noselect
set shortmess+=c  " usuwa informacje o ilości możliwych podpowiedzi
silent! colorscheme gruvbox-material
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

" Gruvbox mod
" hi PreProc guifg=#e78a4e
" hi PreCondit guifg=#e78a4e
" hi Number guifg=#e78a4e
" hi Float guifg=#e78a4e
" hi Boolean guifg=#e78a4e
" hi Include guifg=#e78a4e
" hi Define guifg=#e78a4e
" hi QuickFix guifg=#e78a4e
" hi QuickFixLine guifg=#e78a4e
" hi Purple guifg=#e78a4e
" hi PurpleBold guifg=#e78a4e
" hi PurpleItalic guifg=#e78a4e
" hi SpellRare term=reverse cterm=underline ctermfg=175 gui=underline guifg=#e78a4e guisp=#d3869b
" hi WildMenu ctermfg=109 ctermbg=236 guifg=#7daea3 guibg=#32302f

set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" daje możliwość uruchamiania aliasów z poziomu edytora Vim
" wymaga dodania w pliku ~/.aliases: shopt -s expand_aliases
let $BASH_ENV="~/.aliases"
