Plug 'mengelbrecht/lightline-bufferline'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'buffers' ],
      \             [ 'readonly', 'modified' ] ]
      \ },
      \ 'component_expand': {
      \   'buffers' : 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline.component = { 'filename': '%t' }
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
