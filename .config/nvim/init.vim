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
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/deoppet.nvim'
    Plug 'Shougo/defx.nvim'
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
se viewdir=$HOME/.vim/view/nvim
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

nnoremap qq :q<cr>
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leadeg>f :Defx .<cr>
nnoremap th :se hlsearch!<cr>
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
" --- Komendy {{{
command! PI PlugInstall<cr>
" --- Komendy }}}
