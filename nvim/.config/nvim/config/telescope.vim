lua require('telescope').setup({ defaults =  { path_display={ "smart" }} });

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-j> <cmd>Telescope live_grep<cr>
nnoremap <C-l> <cmd>Telescope git_files<cr>
nnoremap <C-h> <cmd>Telescope oldfiles<cr>
