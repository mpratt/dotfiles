" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfun

let g:fzf_buffers_jump = 1
nnoremap <C-p> :call FzfOmniFiles()<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-k> :Files<CR>
nnoremap <C-j> :Ag<CR>
nnoremap <C-h> :History<CR>
nnoremap <leader>rg :Rg <C-R>=expand("<cword>")<CR><CR>
