" --- Pluginy {{{
call plug#begin('~/.config/nvim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'pearofducks/ansible-vim'
    Plug 'dense-analysis/ale'
    Plug 'sainnhe/gruvbox-material'
    Plug 'chriskempson/base16-vim'
    Plug 'flazz/vim-colorschemes'
    Plug 'Taverius/vim-colorscheme-manager'
    Plug 'xolox/vim-misc'               " wymagany dle pluginu vim-colorscheme-switcher
    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'chengzeyi/fzf-preview.vim'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'dyng/ctrlsf.vim'
    Plug 'mbbill/undotree'
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'  " integracja NERDTree z GIT
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/fern-bookmark.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-markdown-toc'
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/vim-peekaboo'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'junegunn/gv.vim'
    Plug 'rhysd/git-messenger.vim'
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-eunuch'
    Plug 'jiangmiao/auto-pairs'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mcchrish/nnn.vim'
    Plug 'unblevable/quick-scope'
    Plug 'easymotion/vim-easymotion'
    Plug 'Yggdroot/indentLine'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vuciv/vim-bujo'  " Manage ToDo lists
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-icons'
    Plug 'sainnhe/gruvbox-material'
    Plug 'glidenote/memolist.vim'
call plug#end()
" --- Pluginy }}}
" --- Ustawienia {{{
set nocompatible
filetype plugin indent on
syntax enable
se rnu nu
se ts=4 sw=4 sts=4 et sta
se wildmenu
se wildmode=list:longest,full
se foldmethod=marker
se foldcolumn=1
se splitright
se splitbelow
se backspace=indent,eol,start
se clipboard=unnamedplus
se mouse=a
se hidden
se noshowmode
se nowrap
se smartcase
se incsearch
se timeoutlen=500
se undodir=~/.vim/undo
se undofile
se undolevels=10000
se viminfo='100,n$HOME/.vim/viminfo/nviminfo
se viewdir=$HOME/.config/nvim/view
se laststatus=2
se cmdheight=2
se list
se listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
se listchars=nbsp:⦸
se listchars+=tab:▸\ ,
se listchars+=extends:»
se listchars+=precedes:«
se listchars+=trail:•
se listchars+=eol:¬
se fillchars+=vert:\ 
se showbreak=↪
se scrolloff=5
se autochdir
setlocal spelllang=pl
se lazyredraw  " szybciej wykonuje makra
se encoding=utf-8
se textwidth=80
se cursorline
se colorcolumn=+1
se background=dark
se complete+=kspell " Ctrl+p w trybie INSERT podpowiedzi ze słownika wymaga włączenia trybu spell
se completeopt=menuone,longest,noselect
se shortmess+=c  " usuwa informacje o ilości możliwych podpowiedzi
silent! colo gruvbox-material
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" daje możliwość uruchamiania aliasów z poziomu edytora Vim
" wymaga dodania w pliku ~/.aliases: shopt -s expand_aliases
let $BASH_ENV="~/.aliases"

" --- Ustawienia }}}
" --- Mapowanie klawiszy {{{
let mapleader="\<space>"    " ustawiona spacja jako klawisz leader
let localmapleader="\\"     " klawisz \ ustawiony jako local leader

nnoremap j gj
nnoremap k gk
nnoremap J maJ`a
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap qq :q<cr>
nnoremap qs :update<cr>:q<cr>
nnoremap th :set hlsearch!<cr>
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leadeg>f :Defx .<cr>

" usuwanie pojedynczych znaków nie nadpisuje zawartości schowka, rejestr `_` jest
" to rejestr typu blackhole czyli wszystko co tam trafia znika bezpowrotnie
noremap x "_x
noremap X "_X

" mapuje klawisz TAB w trybie insert do zatwierdzenia popowiedzi autouzupełaniania
inoremap <expr> <TAB> pumvisible() ? "<C-y>":"<TAB>"

nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)
nmap gJ 9999gj
nmap gK 9999gk

nnoremap <c-_> :Commentary<cr> " <c-_> mapuje kombinacje klawiszy <c-/>
vnoremap <c-_> :Commentary<cr> " <c-_> mapuje kombinacje klawiszy <c-/>

nnoremap <tab> :e #<cr>

cmap <c-h> <left>
cmap <c-j> <down>
cmap <c-k> <up>
cmap <c-l> <right>

inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

inoremap <c-c> <esc>

nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>

" wchodzi do trybu COMMAND
nnoremap <leader>; :

nnoremap <leader>w :update<cr>

" początek i koniec linii
nnoremap <leader>h 0
nnoremap <leader>l $

" Przełączanie się pomiędzy buforami
nnoremap <leader>, :bp<cr>
nnoremap <leader>. :bn<cr>
" ustawia podzielone okno na główne (full screen)
nnoremap <leader>o :only<cr>

nnoremap <leader>d :DestractionFree<cr>

nnoremap <leader>b :Buffers<cr>

" przechodzi do katalogu w którym znajduje się edytowany plik
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" klonuje paragraf
nnoremap <leader>cp yap<S-}>p

nnoremap <leader>gc :GCheckout<cr>

nnoremap <leader>pa :set invpaste paste?<cr>

nnoremap <leader>pr :ProjectFiles<cr>

nnoremap <leader>v :e $MYVIMRC<cr>
" nnoremap <leader>vv :NERDTreeToggle ~/.vim<cr>

nnoremap <leader>r :source $MYVIMRC<cr>:echom "Konfiguracja została przeładowana ..."<cr>

nnoremap <leader>s :setlocal spell! spell? spelllang=pl<cr>

nnoremap <leader>g :Rg<cr>

" otwiera menadżer plików dla lokalizacji otwartego pliku
" nnoremap <leader>f :sv %:p:h<cr>
nnoremap <leader>f :Fern . -drawer -reveal=% -toggle -width=30<cr>

nnoremap <leader>u :UndotreeToggle<cr>

nnoremap <leader>t :term<cr>
nnoremap <leader>tv :botright vertical terminal<cr>

" Otwiera i zamyka NERDTreee w bieżącej lokalizacji
" nnoremap <silent> <expr> <leader>N g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

nnoremap <leader>n :NERDTreeToggleVCS<cr>
nnoremap <leader>N :NnnPicker '%:p:h'<cr>

" kopiuje bieżącą linię i uruchamia jako polecenie systemowe, wynik wkleja do
" bufora
nnoremap <leader>E !!$SHELL<cr>

" kopiuje bieżącą linię i wykonuje w linii komend Vim np. :qa!
nnoremap <leader>ve yy:@"<cr>

nnoremap <leader>e :exe "e ~/notes/".strftime("%F").".md"<cr>

" Obsługa pluginu vim-surround
" <leader>sw czeka na wprowadzenie znaku, którym otoczy wyraz
noremap <leader>sw :norm ysiw
" <leader>sW czeka na wprowadzenie znaku, którym otoczy WYRAZ
noremap <leader>sW :norm ysiW
" <leader>sp czeka na wprowadzenie znaku, który otoczy paragraf
noremap <leader>sp :norm ysip
" <leader>ss czeka na wprowadzenie znaku, którym otoczy linię
noremap <leader>ss :norm yss
" <leader>sd czeka na wprowadzenie znaku, którym zostanie usunięty
noremap <leader>sd :norm ds

" \fnn wyświetla pełną ścieżkę dla pliku wraz z jego nazwą
nnoremap <localleader>f :echo expand("%:p")<cr>

" kopiuj / wklej do schowka systemowego
vnoremap <c-c> "*y :let @+=@*<cr>
nnoremap <c-c> "*y :let @+=@*<cr>
map <c-p> "+P

command! Q :q!

autocmd Filetype markdown,vimwiki inoremap ,i <esc>:InsertLogEntry<cr>

autocmd Filetype help nnoremap <leader>l <c-]>
autocmd Filetype help nnoremap <leader>h <c-t>

autocmd BufRead,BufNewFile */playbooks/*.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile playbook.yaml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */rules/*/*.yaml set filetype=yaml.ansible
autocmd Filetype yaml.ansible setlocal sts=2 sw=2 ts=2
" --- Mapowanie klawiszy }}}
" --- Ustawienia pluginów {{{
" Startify
let g:startify_session_dir = '~/.vim/startify_session'

let g:startify_custom_header = ''

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

let g:startify_commands = [
    \ { 'c': [ 'Current Directory', 'e .' ]          },
    \ { 'v': [ 'VIMRC'            , 'e $MYVIMRC' ]   },
    \ { 'b': [ 'Bashrc'           , 'e ~/.bashrc' ]  },
    \ { 'a': [ 'Aliases'          , 'e ~/.aliases' ] },
    \ ]

let g:startify_custom_header = [
    \ '   Siema, Ziom :) ',
    \ '--------------------------'
    \ ]

" airline
let g:airline_theme='lucius'
let g:airline#extensions#tabline#enabled = 1

" Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.ext = '.md'
let wiki.syntax = 'markdown'
let wiki.nested_syntax = { 'python': 'python', 'sh': 'sh' }

let g:vimwiki_list = [wiki]
let g:vimwiki_table_mappings = 0
let g:vimwiki_listsyms = '✗○◐●✓'

" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" indentLine
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" nnn
" Disable default mappings
let g:nnn#set_default_mappings = 0

" Fern
let g:fern#renderer = "nerdfont"
let g:fern#disable_default_mappings   = 1
" let g:fern#disable_drawer_auto_quit   = 1
" let g:fern#disable_viewer_hide_cursor = 1

function! FernInit() abort
    " wyłączenie pluginu quick-scope, który okazjonalnie wiesza plugin Fern
    let g:qs_enable=0

    " wyłącza plugin indentLine
    let g:indentLine_enabled = 0

    " mapowanie
    nmap <buffer><nowait> <cr> <plug>(fern-action-open-or-enter)
    nmap <buffer><nowait> <bs> <plug>(fern-action-leave)
    nmap <buffer> ! <plug>(fern-action-hidden-toggle)
    nmap <buffer> v <plug>(fern-action-open:vsplit)
    nmap <buffer> s <plug>(fern-action-open:split)
    nmap <buffer> h <plug>(fern-action-collapse)
    nmap <buffer> l <plug>(fern-action-expand)
    nmap <buffer> f <plug>(fern-action-new-file)
    nmap <buffer> d <plug>(fern-action-new-directory)
    nmap <buffer> n <plug>(fern-action-new-path)
    nmap <buffer> m <Plug>(fern-action-move)
    nmap <buffer> D <Plug>(fern-action-remove)
    nmap <buffer> R <Plug>(fern-action-rename)
    nmap <buffer><nowait> <C-j> <Plug>(fern-action-mark-toggle)j
    nmap <buffer><nowait> <C-k> k<Plug>(fern-action-mark-toggle)
    nmap <buffer><nowait> -     <Plug>(fern-action-mark-toggle)
    vmap <buffer><nowait> -     <Plug>(fern-action-mark-toggle)
endfunction

augroup FernGroup
    autocmd!
    autocmd FileType fern call FernInit()
augroup END

" quick-scope
let g:qs_buftype_blacklist = ['terminal', 'nofile', 'fern']

" NERDTree
"autocmd vimenter * NERDTree  " uruchomienie przy starcie NERDTree

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeBookmarkFile = '$HOME/.vim/NERDTreeBookmarks'
let g:NERDTreeQuitOnOpen = 3
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 33
let g:NERDTreeAutoDeleteBuffer=1

" NERDTree-GIT
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒",
    \ "Unknown"   : "?"
    \ }

" Goyo
function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Defx
let g:defx_icons_enable_syntax_highlight    = 1
let g:defx_icons_column_length              = 1
let g:defx_icons_directory_icon             = ''
let g:defx_icons_mark_icon                  = '*'
let g:defx_icons_copy_icon                  = ''
let g:defx_icons_move_icon                  = ''
let g:defx_icons_parent_icon                = ''
let g:defx_icons_default_icon               = ''
let g:defx_icons_directory_symlink_icon     = ''
let g:defx_icons_root_opened_tree_icon      = ''
let g:defx_icons_nested_opened_tree_icon    = ''
let g:defx_icons_nested_closed_tree_icon    = ''

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
    nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
        \ defx#do_action('preview')
    nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
    nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
endfunction

call defx#custom#option('_', {
    \ 'winwidth': 71,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'buffer_name': 'defx',
    \ 'columns': 'mark:indent:icons:filename:type:size:time',
    \ 'toggle': 1,
    \ 'resume': 1,
    \ })

" Memolist
" suffix type (default markdown)
let g:memolist_memo_suffix = "md"

" date format (default %Y-%m-%d %H:%M)
" let g:memolist_memo_date = "%Y-%m-%d %H:%M"
" let g:memolist_memo_date = "epoch"
" let g:memolist_memo_date = "%D %T"
let g:memolist_memo_date = "%F %T"

" tags prompt (default 0)
let g:memolist_prompt_tags = 0

" categories prompt (default 0)
let g:memolist_prompt_categories = 0

" use fzf (default 0)
let g:memolist_fzf = 1

" remove filename prefix (default 0)
let g:memolist_filename_prefix_none = 0

" use denite (default 0)
" let g:memolist_denite = 1

" use arbitrary denite source (default is 'file_rec')
" let g:memolist_denite_source = "anything"

" use arbitrary denite option (default is empty)
" let g:memolist_denite_option = "anything"

" use various Ex commands (default '')
let g:memolist_ex_cmd = 'Defx'
" let g:memolist_ex_cmd = 'Clap files'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','

" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"

" vim-which-key
silent! call which_key#register('\', "g:which_key_map")
silent! call which_key#register(' ', "g:space_prefix_dict")

nnoremap <silent> \ :<c-u>WhichKey '\'<cr>
vnoremap <silent> \ :<c-u> :silent WhichKeyVisual '\'<cr>

let g:which_key_map = {}

hi default link WhichKey            Operator
hi default link WhichKeySeparator   DiffAdded
hi default link WhichKeyGroup       Identifier
hi default link WhichKeyDesc        Function

" Pierwsze mapowanie dla '\'
let g:which_key_map['/'] = [ 'Commentary'         , 'comment'         ]
let g:which_key_map[';'] = [ ':Commands'          , 'commands'        ]
let g:which_key_map['='] = [ '<C-W>='             , 'balance windows' ]
let g:which_key_map['S'] = [ ':Startify'          , 'start screen'    ]
let g:which_key_map['T'] = [ ':Rg'                , 'search text'     ]
let g:which_key_map['D'] = [ ':Defx .'            , 'Defx'            ]
let g:which_key_map['N'] = [ ':NnnPicker'         , 'nnn n³'          ]
let g:which_key_map['n'] = [ ':NERDTreeToggleVCS' , 'NERDTree'        ]
let g:which_key_map['f'] = [ ':Files'             , 'search files'    ]
let g:which_key_map['h'] = [ '<C-W>s'             , 'split below'     ]
let g:which_key_map['v'] = [ '<C-W>v'             , 'split right'     ]
let g:which_key_map['z'] = [ 'Goyo'               , 'zen'             ]
let g:which_key_map['q'] = [ 'q'                  , 'quit vim'        ]
let g:which_key_map['x'] = [ 'x'                  , 'save & quit vim' ]

" t - toggle
" d - dot.files
" s - search
" g - git
" w - windows
" b - buffers

" d dot.files
let g:which_key_map.d = {
    \ 'name' : '+dot.files',
    \ 'v' : [':e $MYVIMRC'                      , 'vimrc'               ],
    \ 'b' : [':e ~/.bashrc'                     , 'bashrc'              ],
    \ 'z' : [':e ~/.zshrc'                      , 'zshrc'               ],
    \ }

let g:which_key_map.t = {
    \ 'name' : '+toggle',
    \ 'p' : [':set paste!'             , 'toggle paste'             ],
    \ 's' : [':Startify'               , 'Startify'                 ],
    \ 'n' : [':set nonumber!'          , 'line-numbers'             ],
    \ 'r' : [':set norelativenumber!'  , 'relative line nums'       ],
    \ 'P' : [':let @/ = ""'            , 'remove search highlight'  ],
    \ }

let g:which_key_map.s = {
    \ 'name' : '+search',
    \ '/' : [':History/'     , 'history'            ],
    \ ';' : [':Commands'     , 'commands'           ],
    \ 'a' : [':Ag'           , 'text Ag'            ],
    \ 'b' : [':BLines'       , 'current buffer'     ],
    \ 'B' : [':Buffers'      , 'open buffers'       ],
    \ 'c' : [':Commits'      , 'commits'            ],
    \ 'C' : [':BCommits'     , 'buffer commits'     ],
    \ 'f' : [':Files'        , 'files'              ],
    \ 'g' : [':GFiles'       , 'git files'          ],
    \ 'G' : [':GFiles?'      , 'modified git files' ],
    \ 'h' : [':History'      , 'file history'       ],
    \ 'H' : [':History:'     , 'command history'    ],
    \ 'l' : [':Lines'        , 'lines'              ],
    \ 'm' : [':Marks'        , 'marks'              ],
    \ 'M' : [':Maps'         , 'normal maps'        ],
    \ 'p' : [':Helptags'     , 'help tags'          ],
    \ 'P' : [':Tags'         , 'project tags'       ],
    \ 's' : [':Snippets'     , 'snippets'           ],
    \ 'S' : [':Colors'       , 'color schemes'      ],
    \ 't' : [':Rg'           , 'text Rg'            ],
    \ 'T' : [':BTags'        , 'buffer tags'        ],
    \ 'w' : [':Windows'      , 'search windows'     ],
    \ 'y' : [':Filetypes'    , 'file types'         ],
    \ 'z' : [':FZF'          , 'FZF'                ],
    \ }

let g:which_key_map.g = {
    \ 'name' : '+git',
    \ 'a' : [':Git add .'                     , 'add all'               ],
    \ 'A' : [':Git add %'                     , 'add current'           ],
    \ 'b' : [':Git blame'                     , 'blame'                 ],
    \ 'B' : [':GBrowse'                       , 'browse'                ],
    \ 'c' : [':Git commit -m "autocommit"'    , 'commit'                ],
    \ 'd' : [':Git diff'                      , 'diff'                  ],
    \ 'D' : [':Gdiffsplit'                    , 'diff split'            ],
    \ 'g' : [':GGrep'                         , 'git grep'              ],
    \ 'G' : [':Gstatus'                       , 'status'                ],
    \ 'h' : [':GitGutterLineHighlightsToggle' , 'highlight hunks'       ],
    \ 'H' : ['<Plug>(GitGutterPreviewHunk)'   , 'preview hunk'          ],
    \ 'j' : ['<Plug>(GitGutterNextHunk)'      , 'next hunk'             ],
    \ 'k' : ['<Plug>(GitGutterPrevHunk)'      , 'prev hunk'             ],
    \ 'l' : [':Git log'                       , 'log'                   ],
    \ 'p' : [':Git push'                      , 'push'                  ],
    \ 'P' : [':Git pull'                      , 'pull'                  ],
    \ 'r' : [':GRemove'                       , 'remove'                ],
    \ 's' : ['<Plug>(GitGutterStageHunk)'     , 'stage hunk'            ],
    \ 't' : [':GitGutterSignsToggle'          , 'toggle signs'          ],
    \ 'u' : ['<Plug>(GitGutterUndoHunk)'      , 'undo hunk'             ],
    \ 'v' : [':GV'                            , 'view commits'          ],
    \ 'V' : [':GV!'                           , 'view buffer commits'   ],
    \ }

let g:which_key_map['w'] = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window'          ],
    \ 'd' : ['<C-W>c'     , 'delete-window'         ],
    \ '-' : ['<C-W>s'     , 'split-window-below'    ],
    \ '|' : ['<C-W>v'     , 'split-window-right'    ],
    \ '2' : ['<C-W>v'     , 'layout-double-columns' ],
    \ 'h' : ['<C-W>h'     , 'window-left'           ],
    \ 'j' : ['<C-W>j'     , 'window-below'          ],
    \ 'l' : ['<C-W>l'     , 'window-right'          ],
    \ 'k' : ['<C-W>k'     , 'window-up'             ],
    \ 'H' : ['<C-W>5<'    , 'expand-window-left'    ],
    \ 'J' : ['resize +5'  , 'expand-window-below'   ],
    \ 'L' : ['<C-W>5>'    , 'expand-window-right'   ],
    \ 'K' : ['resize -5'  , 'expand-window-up'      ],
    \ '=' : ['<C-W>='     , 'balance-window'        ],
    \ 's' : ['<C-W>s'     , 'split-window-below'    ],
    \ 'v' : ['<C-W>v'     , 'split-window-below'    ],
    \ '?' : ['Windows'    , 'fzf-window'            ],
    \ }

let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '1' : ['b1'        , 'buffer 1'           ],
    \ '2' : ['b2'        , 'buffer 2'           ],
    \ 'd' : ['bd'        , 'delete-buffer'      ],
    \ 'f' : ['bfirst'    , 'first-buffer'       ],
    \ 'h' : ['Startify'  , 'home-buffer'        ],
    \ 'l' : ['blast'     , 'last-buffer'        ],
    \ 'n' : ['bnext'     , 'next-buffer'        ],
    \ 'p' : ['bprevious' , 'previous-buffer'    ],
    \ '?' : ['Buffers'   , 'fzf-buffer'         ],
    \ }
" --- Ustawienia pluginów }}}
" --- Autocmd / Funkcje {{{
au VimLeave ?* mkview
au VimEnter ?* silent! loadview

" przechodzi do katalogu w którym znajduje się otwarty bufor dodatkowo ignoruje
" pliki typu git i GV, którym sprawia to problem
let ftToIgnore = [ 'GV', 'git', 'fern' ]
autocmd BufEnter * if index(ftToIgnore, &ft) < 0 | lcd %:p:h

autocmd FileType git nofoldenable

" przeładowanie .vimrc po zapisaniu pliku
autocmd! BufWritePost $MYVIMRC source % | redraw

" Modyfikacja komendy Rg z pluginem FZF.vim
" Przeszukiwanie zawartości plików
function! RgFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Modyfikacja komendy Rg dla $NOTES_DIR z pluginem FZF.vim
" Przeszukiwanie zawartości plików
function! RgNotes(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s $HOME/notes || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Przeszukiwanie zawartości plików w bieżącej lokalizacji
function! RgCurrDir(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s $PWD || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" ProjectFiles
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

function! DestractionFree()
    set number!
    set relativenumber!
    set list!
    if match(&runtimepath, 'indentLine') != -1  " sprawdza czy plugin indentLine jest zainstalowany
        IndentLinesToggle
    endif
    if &cursorline
        set nocursorline
    else
        set cursorline
    endif
    if &colorcolumn == "+1"
        set colorcolumn=
    else
        set colorcolumn=+1
    endif
endfunction

function InsertLogEntry()
    normal! o# <temat> <data>
    execute ':s/<data>/\=strftime("%Y-%m-%d %H:%M:%S")/'
    normal! 0f<d7l
    execute ':startinsert'
endfunction

function! FileTime()
    let filename=expand('%:p')
    let msg=""
    let msg=msg."Mod: ".strftime("%F %T",getftime(filename))." ".filename
    echom msg
endfunction

function! CurTime()
    let ftime=""
    let ftime=ftime." ".strftime("Teraz jest: %F %T")
    echom ftime
    " return ftime
endfunction

" FZF z podglądem zawartości pliku
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" FZF w $NOTES_DIR z podglądem zawartości pliku
command! -bang -nargs=? -complete=dir Notes
    \ call fzf#vim#files('$HOME/notes', fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '--prompt=Notes> ']}), <bang>0)

command! -bang -nargs=* RgFzf call RgFzf(<q-args>, <bang>0)

command! -bang -nargs=* RgNotes call RgNotes(<q-args>, <bang>0)
command! -bang -nargs=* RgCurrDir call RgCurrDir(<q-args>, <bang>0)

command! ProjectFiles execute 'Files' s:find_git_root()

" FZF bez podglądu zawartości pliku
command! -bang -nargs=* -complete=dir LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))

command! InsertLogEntry call InsertLogEntry()
command! Log :e ~/notes/log.md
command! FileTime call FileTime()
command! CurTime call CurTime()
command! PI PlugInstall
command! DestractionFree call DestractionFree()
" --- Autocmd / Funkcje }}}
" --- Szyfrowanie {{{
" Szyfrowanie OpenSSL
augroup OpenSSL
    autocmd!
    autocmd BufReadPre,FileReadPre *.crypted set viminfo=
    autocmd BufReadPre,FileReadPre *.crypted set noswapfile noundofile nobackup
    autocmd BufReadPost   *.crypted :%!openssl enc -d -aes-256-cbc -a -salt -pbkdf2
    autocmd BufReadPost   *.crypted |redraw!
    autocmd BufWritePre   *.crypted :%!openssl enc -e -aes-256-cbc -a -salt -pbkdf2
    autocmd BufWritePost  *.crypted u
    autocmd VimLeave      *.crypted :!clear
augroup END

" Parametry dla plików z rozszerzeniem .gpg
autocmd BufEnter *.md.gpg set notermguicolors!

" Szyfrowanie GPG
let g:GPGPreferSymmetric = 0
let g:GPGUseAgent = 1
let g:GPGPreferArmor = 1
" let g:GPGPreferSign = 1
let g:GPGDefaultRecipients = ["0xID_KLUCZA"]  " gpg --list-keys --keyid-format LONG
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\)\='
" --- Szyfrowanie }}}
" --- Abbr {{{
abbr abbash #!/usr/bin/env bash<cr><cr>
" --- Abbr}}}
" --- Dodatkowe pliki konfiguracyjne {{{
" jeśli istnieje plik ~/.nvim.local to odczytuje jego zawartość
if filereadable(expand("~/.nvim.local"))
    source ~/.nvim.local
endif

" jeśli istnieje plik ~/.config/nvim/nvim.local to odczytuje jego zawartość
if filereadable(expand("~/.config/nvim/nvim.local"))
    source ~/.config/nvim/nvim.local
endif
" --- Dodatkowe pliki konfiguracyjne }}}
