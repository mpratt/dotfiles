Plug 'lifepillar/vim-mucomplete'
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['ulti', 'user', 'omni', 'c-n', 'keyn', 'uspl']

inoremap <silent> <expr> <cr> mucomplete#ultisnips#expand_snippet("\<cr>")
