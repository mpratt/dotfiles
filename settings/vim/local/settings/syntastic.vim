" let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_style_warning_symbol = '≈≈'
let g:syntastic_php_checkers=['php', 'phpmd', 'phpcs']
let g:syntastic_php_phpmd_post_args='text codesize,design,unusedcode'
let g:syntastic_html_tidy_ignore_errors=[' proprietary attribute "ng-', 'proprietary attribute', 'trimming empty']
