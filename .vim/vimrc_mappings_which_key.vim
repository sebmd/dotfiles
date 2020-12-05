" Pierwsze mapowanie dla '\'
let g:which_key_map['/'] = [ 'Commentary'         , 'comment'         ]
let g:which_key_map[';'] = [ ':Commands'          , 'commands'        ]
let g:which_key_map['='] = [ '<C-W>='             , 'balance windows' ]
let g:which_key_map['S'] = [ ':Startify'          , 'start screen'    ]
let g:which_key_map['T'] = [ ':Rg'                , 'search text'     ]
let g:which_key_map['n'] = [ ':NERDTreeToggleVCS' , 'NERDTree'        ]
let g:which_key_map['h'] = [ '<C-W>s'             , 'split below'     ]
let g:which_key_map['v'] = [ '<C-W>v'             , 'split right'     ]
let g:which_key_map['z'] = [ 'Goyo'               , 'zen'             ]
let g:which_key_map['q'] = [ 'q'                  , 'quit vim'        ]
let g:which_key_map['x'] = [ 'x'                  , 'save & quit vim' ]

" b - buffers
" c - colors
" d - dot.files
" f - files
" g - git
" s - search
" t - toggle
" w - windows

" b buffers
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

" c colors
let g:which_key_map.c = {
    \ 'name' : '+colors',
    \ 'l'  : [':Colors'                 , 'Lista FZF'           ],
    \ 'a'  : [':colo ayu'               , 'ayu'                 ],
    \ 'dt' : [':colo base16-darktooth'  , 'darktooth'           ],
    \ 'g'  : [':colo gruvbox'           , 'gruvbox'             ],
    \ 'gm' : [':colo gruvbox-material'  , 'gruvbox-material'    ],
    \ }

" d dot.files
let g:which_key_map.d = {
    \ 'name' : '+dot.files',
    \ 'v' : [':e $MYVIMRC'  , 'vimrc'  ],
    \ 'b' : [':e ~/.bashrc' , 'bashrc' ],
    \ 'z' : [':e ~/.zshrc'  , 'zshrc'  ],
    \ }

" f files
let g:which_key_map.f = {
    \ 'name' : '+files',
    \ 's'  : [':w' , 'save'             ],
    \ 'x'  : [':x' , 'save & quit Vim'  ],
    \ }

" t toggle
let g:which_key_map.t = {
    \ 'name' : '+toggle',
    \ 'p' : [':set paste!'             , 'toggle paste'             ],
    \ 's' : [':Startify'               , 'Startify'                 ],
    \ 'n' : [':set nonumber!'          , 'line-numbers'             ],
    \ 'r' : [':set norelativenumber!'  , 'relative line nums'       ],
    \ 'P' : [':let @/ = ""'            , 'remove search highlight'  ],
    \ }

" s search
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
