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

function! FilesWrapper(dir)
  let tf = tempname()
  call writefile(['.'], tf)

  call fzf#vim#files(a:dir, {'source': 'fd', 'options': ['--bind', printf('ctrl-u:reload:base="$(cat %s)"/..; echo "$base" > %s; fd . "$base"', shellescape(tf), shellescape(tf))]})
endfunction


let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width' : 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <C-p> :call FzfOmniFiles()<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-k> :Files<CR>
nnoremap <C-j> :Ag<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-u> :call FilesWrapper(expand('%:p:h'))<CR>
nnoremap <leader>rg :Rg <C-R>=expand("<cword>")<CR><CR>
