if !isdirectory(expand('~/.vim/local/tmp/cache/ctrlp'))
    call mkdir(expand('~/.vim/local/tmp/cache/ctrlp'), "p")
endif

let g:ctrlp_cache_dir = '~/.vim/local/tmp/cache/ctrlp'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0                      " Keep caches between sessions - f5 to refresh once CtrlP is open
let g:ctrlp_extensions = ['tag']                         " Search in Tags also
let g:ctrlp_lazy_update = 100
let g:ctrlp_max_height = 30
let g:ctrlp_default_input = 1

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'    " Custom user command
endif

" let g:ctrlp_mruf_relative = 1
