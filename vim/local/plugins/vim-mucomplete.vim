Plug 'lifepillar/vim-mucomplete'
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['ulti', 'path', 'omni', 'keyn', 'dict', 'uspl']
inoremap <silent> <expr> <cr> mucomplete#ultisnips#expand_snippet("\<cr>")
