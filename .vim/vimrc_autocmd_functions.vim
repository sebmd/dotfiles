autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview

autocmd FileType git nofoldenable

autocmd FileType text set filetype=markdown

" przechodzi do katalogu w którym znajduje się otwarty bufor dodatkowo ignoruje
" pliki typu git i GV, którym sprawia to problem
let ftToIgnore = [ 'GV', 'git', 'fern' ]
autocmd BufEnter * if index(ftToIgnore, &ft) < 0 | lcd %:p:h

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

" Pliki markdown docs/VIM*
function! Docs()
    call fzf#run(fzf#wrap({'source': 'ls $DOTFILES_DIR/docs/VIM*.md'}))
endfunction

" Pliki konfiguracyjne
function! VimFiles()
    call fzf#run(fzf#wrap({'source': 'ls $DOTFILES_DIR/.vim/vimrc*'}))
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

function InsertDiaryHeader()
    normal! o# <temat> <data>
    execute ':s/<data>/\=strftime("%Y-%m-%d %H:%M:%S")/'
    normal! 0f<d7l
    normal! kdd
    normal! 02l
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

function! CurrentFileDir()
    return "e " . expand("%:p:h") . "/"
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

" Usuwa pliki .swp
function! DeleteSwapFile()
    write
    let l:output = ''
    redir => l:output
    silent exec ':sw'
    redir END
    let l:current_swap_file = substitute(l:output, '\n', '', '')
    let l:base = substitute(l:current_swap_file, '\v\.\w+$', '', '')
    let l:swap_files = split(glob(l:base.'\.s*'))
    " delete all except the current swap file
    for l:swap_file in l:swap_files
        if !empty(glob(l:swap_file)) && l:swap_file != l:current_swap_file
            call delete(l:swap_file)
            echo "swap file removed: ".l:swap_file
        endif
    endfor
    " Reset swap file extension to `.swp`.
    set swf! | set swf!
    echo "Reset swap file extension for file: ".expand('%')
endfunction

" Katalogi
let g:bmdirs = readfile(expand('$HOME/.config/bmdirs'))
command! FZFProj call fzf#run({
    \  'source':  g:bmdirs,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '20%'})

" Katalogi
function! FZFProj5()
    let bmdirs = readfile(expand('$HOME/.config/bmdirs'))
    call fzf#run(fzf#wrap({'source': bmdirs,
                \ 'sink' : 'e',
                \ 'options' : '-m -x +s'}))
endfunction

command! FZFProj call FZFProj()
command! DeleteSwapFile call DeleteSwapFile()
command! InsertLogEntry call InsertLogEntry()
command! InsertDiaryHeader call InsertDiaryHeader()
command! Log :e ~/notes/log.md
command! FileTime call FileTime()
command! CurTime call CurTime()
command! PI :PlugInstall
command! DestractionFree call DestractionFree()
command! CreateGist :!gh gist create %
command! CreateGistPublic !gh gist create % -p
