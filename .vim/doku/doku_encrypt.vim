" Parametry dla plików z rozszerzeniem .gpg
" autocmd BufEnter *.md.gpg set notermguicolors!

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
