let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0 " Keep caches between sessions - f5 to refresh once CtrlP is open
let g:ctrlp_extensions = ['tag'] " Search in Tags also
let g:ctrlp_follow_symlinks = 1

" Open files in tabs
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Custom user command
let g:ctrlp_user_command = {
    \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
        \ },
        \ 'fallback': 'find %s -H -type f -maxdepth 3 \! -iname "*.png" \! -iname "*.gif" \! -iname "*.jpg"'
    \ }
