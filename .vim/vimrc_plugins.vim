call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'  " kolor
    Plug 'sainnhe/gruvbox-material'  " kolor
    Plug 'chriskempson/base16-vim'  " kolor
    Plug 'flazz/vim-colorschemes'  " kolor
    " Plug 'Taverius/vim-colorscheme-manager'  " menadżer kolorów
    " Plug 'xolox/vim-misc'  " wymagany dle pluginu vim-colorscheme-switcher
    " Plug 'xolox/vim-colorscheme-switcher'  " przełączanie kolorów
    Plug 'luochen1990/rainbow'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'chengzeyi/fzf-preview.vim'
    " Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    " Plug 'dyng/ctrlsf.vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'  " ekran startowy
    Plug 'preservim/nerdtree'  " menadżer plików
    Plug 'Xuyuanp/nerdtree-git-plugin'  " integracja NERDTree z GIT
    Plug 'ryanoasis/vim-devicons'
    " Plug 'lambdalisue/fern.vim'  " menadżer plików
    Plug 'lambdalisue/nerdfont.vim'
    " Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    " Plug 'lambdalisue/fern-bookmark.vim'
    " Plug 'junegunn/goyo.vim'
    " Plug 'junegunn/limelight.vim'
    " Plug 'junegunn/vim-markdown-toc'
    Plug 'junegunn/vim-peekaboo'  " pokazuje zawartość rejestrów (schowka)
    " Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
    Plug 'vim-scripts/YankRing.vim' " :YRShow pokazuje ostatnio kopiowany tekst
    Plug 'tpope/vim-commentary'  " dodaje znak komentarza dla różnych plików
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-abolish'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'tpope/vim-unimpaired'
    " Plug 'junegunn/gv.vim'
    " Plug 'rhysd/git-messenger.vim'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-eunuch'
    Plug 'tmsvg/pear-tree'  " automatyczne zamykanie "", '', ()
    Plug 'vim-scripts/AutoComplPop'  " automatyczne podpowiedzi
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'ycm-core/YouCompleteMe'  " automatyczne podpowiedzi
    " Plug 'fatih/vim-go'
    " Plug 'dense-analysis/ale'
    Plug 'liuchengxu/vim-which-key'
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lifepillar/vim-cheat40'
    " Plug 'vimwiki/vimwiki'
    " Plug 'glidenote/memolist.vim'
    " Plug 'vuciv/vim-bujo'
    " Plug 'jamessan/vim-gnupg'
call plug#end()
