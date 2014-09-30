" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom#source('outline,line,grep,session', 'filters', ['matcher_fuzzy'])

" Open in bottom right
let g:unite_split_rule = "botright"
let g:unite_prompt = '» '

" Shorten the default update date of 500ms
let g:unite_update_time = 200
let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_cursor_line_highlight = "UniteSelectedLine"
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''
let g:unite_source_rec_max_cache_files = 99999
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:unite_source_buffer_time_format = "%Y-%m-%d  %H:%M:%S  "
let g:unite_source_file_mru_time_format = "%Y-%m-%d  %H:%M:%S  "

" Change the the 'grep' command
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  " Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif

" Open Files just like CtrlP
nmap <c-p> :Unite -no-split -start-insert file_rec/async<cr>

" Ctrl-l: Search MRU
nmap <c-l> :Unite -no-split file_mru<cr>

" Content searching 
nmap <leader>/ :Unite grep:.<cr>

" Yank Searching
nmap <leader>ys :Unite history/yank<cr>

" Buffer Searching
nmap <leader>bs :Unite -quick-match buffer<cr>

" Search Everything
nmap <leader>es :Unite -no-split buffer tab file_mru directory_mru<cr>
