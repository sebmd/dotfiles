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

" Parametry dla plików z rozszerzeniem .vienc przy standardowym szyfrowaniu
augroup VIMCRYPT
    autocmd!
    autocmd BufReadPre,FileReadPre *.vienc set viminfo=
    autocmd BufReadPre,FileReadPre *.vienc set noswapfile noundofile nobackup
augroup END

" Parametry dla plików z rozszerzeniem .gpg
autocmd BufEnter *.md.gpg set notermguicolors!

" Szyfrowanie GPG
let g:GPGPreferSymmetric = 0
let g:GPGUseAgent = 1
let g:GPGPreferArmor = 1
" let g:GPGPreferSign = 1
" zmieną g:GPGDefaultRecipients można ustawić jako [$GPG_ID] wtedy ID klucza
" będzie pobierany ze zmiennej systemowej ustawionej w pliku ~/.bashrc lub mieć
" postać tekstu np. ['0xID_KLUCZ']
let g:GPGDefaultRecipients = [$GPG_ID]  " gpg --list-keys --keyid-format LONG
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.md\|.txt\)\='
