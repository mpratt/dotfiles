let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_style_warning_symbol = '≈≈'

" PHP settings
let g:syntastic_php_checkers=['php', 'phpmd']
"let g:syntastic_php_checkers=['php', 'phpmd', 'phpcs']
let g:syntastic_php_phpmd_post_args='codesize,controversial,design,unusedcode,BooleanArgumentFlag'
" let g:syntastic_php_phpmd_post_args='cleancode,codesize,controversial,design,unusedcode'
" let g:syntastic_php_phpmd_post_args='text codesize,design,unusedcode'
let g:syntastic_php_phpcs_args='--standard=psr2'

" HTML Settings
let g:syntastic_html_tidy_ignore_errors=[' proprietary attribute "ng-', 'proprietary attribute', 'trimming empty']

" Python settings
let g:syntastic_python_checkers=['python']
" let g:syntastic_python_pylint_args = '--rcfile=~/.vim/local/pylintrc' 

