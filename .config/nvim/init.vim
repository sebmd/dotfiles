set nocompatible

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')

    " Instalacja pluginów
    " call dein#add('')
    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/deoppet.nvim')
    call dein#add('Shougo/defx.nvim')
    call dein#add('kristijanhusak/defx-icons')
    call dein#add('sainnhe/gruvbox-material')
    call dein#add('glidenote/memolist.vim')
    call dein#add('vimwiki/vimwiki')
    call dein#add('junegunn/fzf.vim')

    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

se rnu nu
se et
se sw=4
colo gruvbox-material

nnoremap qq :q<cr>
nnoremap <space>v :e $MYVIMRC<cr>
nnoremap <space>r :source $MYVIMRC<cr>
nnoremap <space>f :Defx .<cr>
nnoremap th :se hlsearch!<cr>

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

" call defx#custom#column('icon', {
"     \ 'directory_icon': '▸',
"     \ 'opened_icon': '▾',
"     \ 'root_icon': ' ',
"     \ })
" 
" call defx#custom#column('filename', {
"     \ 'min_width': 40,
"     \ 'max_width': 40,
"     \ })
" 
" call defx#custom#column('mark', {
"     \ 'readonly_icon': '✗',
"     \ 'selected_icon': '✓',
"     \ })

" nnoremap <silent><buffer><expr> <CR>
"     \ defx#is_directory() ?
"     \ defx#do_action('open_directory') :
"     \ defx#do_action('multi', ['drop', 'quit'])

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

" defx
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
    " \ 'columns': 'icon:indent:icons:filename',
    " \ 'columns': 'indent:icons:filename',
    " \ 'columns': 'mark:indent:icons:filename:type:size:time',

" call defx#custom#column('mark', {
"     \ 'readonly_icon': '✗',
"     \ 'selected_icon': '✓',
"     \ })
" 
" call defx#custom#column('icon', {
"     \ 'directory_icon': '▸',
"     \ 'opened_icon': '▾',
"     \ })

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

" use qfixgrep (default 0)
" let g:memolist_qfixgrep = 1

" use vimfiler (default 0)
" let g:memolist_vimfiler = 1

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

command! PlugInstall :call dein#install()
command! PI :call dein#install()
