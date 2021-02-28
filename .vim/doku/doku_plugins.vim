call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'  " kolor
    Plug 'sainnhe/gruvbox-material'  " kolor
    Plug 'luochen1990/rainbow'
    Plug 'kynan/dokuvimki'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'chengzeyi/fzf-preview.vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'  " ekran startowy
    Plug 'preservim/nerdtree'  " menadżer plików
    Plug 'Xuyuanp/nerdtree-git-plugin'  " integracja NERDTree z GIT
    Plug 'ryanoasis/vim-devicons'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-peekaboo'  " pokazuje zawartość rejestrów (schowka)
    Plug 'vim-scripts/YankRing.vim' " :YRShow pokazuje ostatnio kopiowany tekst
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-eunuch'
    Plug 'tmsvg/pear-tree'  " automatyczne zamykanie "", '', ()
    Plug 'vim-scripts/AutoComplPop'  " automatyczne podpowiedzi
    Plug 'liuchengxu/vim-which-key'
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lifepillar/vim-cheat40'
    Plug 'jamessan/vim-gnupg'
call plug#end()
