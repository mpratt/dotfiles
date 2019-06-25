Plug 'mattn/emmet-vim'

let g:user_emmet_mode='a'    "only enable on normal mode
let g:user_emmet_install_global = 0

imap <C-e> <plug>(emmet-expand-abbr)
autocmd FileType html,php,css EmmetInstall
