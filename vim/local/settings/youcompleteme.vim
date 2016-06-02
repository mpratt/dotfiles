let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \}
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\']
