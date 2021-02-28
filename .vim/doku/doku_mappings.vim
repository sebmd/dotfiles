let mapleader="\<space>"    " ustawiona spacja jako klawisz leader
let localmapleader="\\"     " klawisz \ ustawiony jako local leader

nnoremap th :set hlsearch!<cr>
nnoremap j gj
nnoremap k gk
nnoremap J maJ`a
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap qq :q<cr>
nnoremap qw :update<cr>:q<cr>
" odtwarza nagrane makro a
nnoremap Q @a
vnoremap Q :norm @a<cr>
" inore kj <esc>

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

inoremap <c-s> <esc>:update<cr>a
nnoremap <c-s> :update<cr>

nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>

" wchodzi do trybu COMMAND
nnoremap <leader>; :

" wyrównanie paragrafu '=ip' dodatkowo zawija tekst na długość 80 znaków 'gqap'
nnoremap <leader>a =ip gqap

" zapisanie pliku jeśli zostały wprowadzone zmiany
nnoremap <leader>w :update<cr>

" początek i koniec linii
nnoremap gh 0
nnoremap gl $
nnoremap <leader>h 0
nnoremap <leader>l $

" kasowanie od kursora do początku lub końca linii
nnoremap dh d0
nnoremap dl d$

nnoremap <leader>y :YRShow<cr>

" Przełączanie się pomiędzy buforami
nnoremap <leader>, :bp<cr>
nnoremap <leader>. :bn<cr>
nnoremap <esc>h :bp<cr>
nnoremap <esc>l :bn<cr>

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

nnoremap <leader>gp :!cd $(dirname $(readlink -m %)) && ~/bin/gp<cr>:e<cr>

" otwiera menadżer plików dla lokalizacji otwartego pliku
" nnoremap <leader>f :sv %:p:h<cr>
" nnoremap <leader>f :Fern . -drawer -reveal=% -toggle -width=30<cr>
nnoremap <leader>f :Doku<cr>

nnoremap <leader>u :UndotreeToggle<cr>

nnoremap <leader>t :term<cr>
nnoremap <leader>tv :botright vertical terminal<cr>

nnoremap <leader>z ma3GD<esc>:r!date +"\%F \%T"<cr>I*<esc>A*<esc>kdd`a

" Otwiera i zamyka NERDTreee w bieżącej lokalizacji
" nnoremap <silent> <expr> <leader>N g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

nnoremap <leader>n :NERDTreeToggleVCS<cr>
" nnoremap <leader>N :NnnPicker '%:p:h'<cr>

" kopiuje bieżącą linię i uruchamia jako polecenie systemowe, wynik wkleja do
" bufora
nnoremap <leader>E !!$SHELL<cr>

" kopiuje bieżącą linię i wykonuje w linii komend Vim np. :qa!
nnoremap <leader>ve yy:@"<cr>

" Obsługa pluginu vim-surround
" <leader>sw czeka na wprowadzenie znaku, którym otoczy wyraz
" <leader>sW czeka na wprowadzenie znaku, którym otoczy WYRAZ
" <leader>sp czeka na wprowadzenie znaku, który otoczy paragraf
" <leader>ss czeka na wprowadzenie znaku, którym otoczy linię
" <leader>sd czeka na wprowadzenie znaku, którym zostanie usunięty
noremap <leader>sw :norm ysiw
noremap <leader>sW :norm ysiW
noremap <leader>sp :norm ysip
noremap <leader>ss :norm yss
noremap <leader>sd :norm ds

" map! ustawia skróty dla trybu COMMAND
" ,fp wyśweitla bieżący katalog np. /home/user/git/dot.files/.vim
" ,fn wyświetla nazwę edytowanego pliku np. VIM.md
" ,fnr wyświetla nazwę edytowanego pliku np. VIM bez rozszerzenia
" ,fnn wyświetla katalog oraz nazwę edytowanego pliku np. /home/user/git/dot.files/.vim/vimrc
map! ,fp <c-r>=expand("%:p:h")<cr>
map! ,fn <c-r>=expand("%:t")<cr>
map! ,fnr <c-r>=expand("%:t:r")<cr>
map! ,fnn <c-r>=expand("%:p")<cr>

" \F wyświetla pełną ścieżkę dla pliku wraz z jego nazwą
nnoremap <localleader>F :echo expand("%:p")<cr>

" ,e uruchamia polecenie :e nazwa_pliku
" ,s uruchamia polecenie :sp nazwa_pliku
" ,v uruchamia polecenie :vs nazwa pliku
nnoremap ,e :e <c-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap ,s :sp <c-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
nnoremap ,v :vs <c-r>=escape(expand("%:p:h"), ' ') . '/'<cr>

" kopiuj / wklej do schowka systemowego
vnoremap <c-c> "*y :let @+=@*<cr>
nnoremap <c-c> "*y :let @+=@*<cr>
map <c-p> "+P

" <leader>sn kopiuje linię / zaznaczenie do pliku ~/notes/notatki.md
" <leader>sN przenosi linię / zaznaczenie do pliku ~/notes/notatki.md
" <leader>e otwiera plik ~/notes/ + bieżąca data
" <leader>en otwiera plik ~/notes/notatki.md
" <leader>Fn wyszukiwanie plików z podglądem w katalogu ~/notes/
nnoremap <leader>sn :y<cr>:cd ~/notes/<cr>:call writefile(getreg('@', 1, 1), 'notatki.md', 'a')<cr>:cd %:p:h<cr>
nnoremap <leader>sN :d<cr>:cd ~/notes/<cr>:call writefile(getreg('@', 1, 1), 'notatki.md', 'a')<cr>:cd %:p:h<cr>
vmap <leader>sn :y<cr>:cd ~/notes/<cr>:call writefile(getreg('@', 1, 1), 'notatki.md', 'a')<cr>:cd %:p:h<cr>
vmap <leader>sN :d<cr>:cd ~/notes/<cr>:call writefile(getreg('@', 1, 1), 'notatki.md', 'a')<cr>:cd %:p:h<cr>
nnoremap <leader>e :exe "e ~/notes/".strftime("%F").".md"<cr><bar>:InsertDiaryHeader<cr>
nnoremap <leader>en :e ~/notes/notatki.md<cr>
nnoremap <leader>Fn :Notes<cr>

nnoremap <leader><F1> :call Docs()<cr>
nnoremap <leader><F2> :call VimFiles()<cr>
nnoremap <leader><F3> :FZFProj<cr>

cnoremap $c e <c-\>eCurrentFileDir()<cr>

" Silent version of the super user edit, sudo tee trick.
cnoremap W!! execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
" Talkative version of the super user edit, sudo tee trick.
cmap w!! w !sudo /usr/bin/tee >/dev/null "%"

command! Q :q!

autocmd filetype python nnoremap <leader>5 :w <bar> :!python3 % <cr>
autocmd filetype go nnoremap <leader>5 :w <bar> :GoRun<cr>

autocmd Filetype dokuwiki inoremap ,m <esc>:InsertLogEntry<cr>
autocmd Filetype dokuwiki nnoremap ,m :InsertLogEntry<cr>
autocmd Filetype dokuwiki inoremap ,, <esc>/<++><cr>"_c4l
autocmd Filetype dokuwiki inoremap ,b ****<space><++><esc>F*hi
autocmd Filetype dokuwiki inoremap ,s ~~~~<space><++><esc>F~hi
autocmd Filetype dokuwiki inoremap ,e **<++><esc>F*i
autocmd Filetype dokuwiki inoremap ,h ====<space><++><esc>F=hi
autocmd Filetype dokuwiki inoremap ,i ![](<++>)<++><esc>F[a
autocmd Filetype dokuwiki inoremap ,a [](<++>)<++><esc>F[a
autocmd Filetype dokuwiki inoremap ,1 ======<space><space>======<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,2 =====<space><space>=====<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,3 ====<space><space>====<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,4 ===<space><space>===<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,5 ==<space><space>==<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,6 =<space><space>=<cr><cr><++><esc>2kf<space>a
autocmd Filetype dokuwiki inoremap ,l ----<cr>
autocmd Filetype dokuwiki inoremap ,c <sxh><cr></sxh><esc>O
autocmd Filetype dokuwiki inoremap ,t <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr><esc>
autocmd Filetype dokuwiki inoremap ,tt ''''<esc>F'i
autocmd Filetype dokuwiki inoremap ,ta {{tag> All}}<esc>F>a


autocmd Filetype help nnoremap <leader>l <c-]>
autocmd Filetype help nnoremap <leader>h <c-t>

autocmd BufRead,BufNewFile *.txt set filetype=dokuwiki
