"
" https://github.com/sebmd/dotfiles
" WYłącza wsteczną kompatybilność z edytorem Vi
set nocompatible

source $VIMRUNTIME/defaults.vim

" Jako klawisz Leader ustawia <spację>
let mapleader = "\<space>"

let skip_defaults_vim = 1

let files =  []
let files += [ '~/.vim/doku/doku_plugins.vim' ]
let files += [ '~/.vim/doku/doku_plugins_setting.vim' ]
let files += [ '~/.vim/doku/doku_settings.vim' ]
let files += [ '~/.vim/doku/doku_mappings.vim' ]
let files += [ '~/.vim/doku/doku_mappings_which_key.vim' ]
let files += [ '~/.vim/doku/doku_autocmd_functions.vim' ]
let files += [ '~/.vim/doku/doku_abbr.vim' ]
let files += [ '~/.vim/doku/doku_encrypt.vim' ]

for config_file in files
    if filereadable(expand(config_file))
        execute 'source ' . expand(config_file)
    else
        echo "Brak pliku " . config_file
    endif
endfor
