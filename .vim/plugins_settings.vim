" YankRing
" let g:yankring_clipboard_monitor=0
let g:yankring_history_dir = '$HOME/.vim/'

" Rainbow
let g:rainbow_active = 1

" Pear tree
let g:pear_tree_pairs = {
    \ '('  : {'closer': ')'},
    \ '['  : {'closer': ']'},
    \ '{'  : {'closer': '}'},
    \ "'"  : {'closer': "'"},
    \ '"'  : {'closer': '"'},
    \ '`'  : {'closer': '`'},
    \ '```': {'closer': '```'}
    \ }

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

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

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
let g:memolist_ex_cmd = 'Clap files'

" use delimiter of array in yaml front matter (default is ' ')
let g:memolist_delimiter_yaml_array = ','

" use when get items from yaml front matter
" first line string pattern of yaml front matter (default "==========")
let g:memolist_delimiter_yaml_start = "---"

" last line string pattern of yaml front matter (default "- - -")
let g:memolist_delimiter_yaml_end  = "---"

" indentLine
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = [ "vimwiki", "help", "undotree", "diff", "nerdtree" ]
let g:indentLine_bufTypeExclude = [ "help", "terminal" ]

" Fern
let g:fern#renderer = "nerdfont"
let g:fern#disable_default_mappings   = 1
let g:fern#default_hidden = 1
" let g:fern#disable_drawer_auto_quit   = 1
" let g:fern#disable_viewer_hide_cursor = 1

autocmd Filetype fern set nornu
autocmd Filetype fern set nonu
" wyłączenie pluginu quick-scope, który okazjonalnie wiesza plugin Fern
autocmd Filetype fern let g:qs_enable=0
" wyłącza plugin indentLine
autocmd Filetype fern let g:indentLine_enabled = 0

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

" Vimwiki
let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.ext = '.md'
let wiki.syntax = 'markdown'
let wiki.nested_syntax = { 'python': 'python', 'sh': 'sh' }

let g:vimwiki_list = [wiki]
let g:vimwiki_table_mappings = 0
let g:vimwiki_listsyms = '✗○◐●✓'

" airline
let g:airline_theme='base16_tomorrow'

" airline górna belka
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" default jsformatter unique_tail unique_tail_improved
let g:airline#extensions#tabline#formatter = 'default'

" netrw
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

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
