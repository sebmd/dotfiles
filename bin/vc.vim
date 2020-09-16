" vimrc vclip

set nocp
set nomodified

" au! VimEnter * edit vclip|0r!xclip -o -selection clipboard -rmlastnl
au! VimEnter * edit vclip
au! BufWriteCmd vclip %y+
" au! InsertLeave vclip %y+
nmap q :q!<cr>
