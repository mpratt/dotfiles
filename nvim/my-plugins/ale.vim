Plug 'dense-analysis/ale'
let g:ale_linters = {
\   'php': [ 'php', 'phpmd'],
\   'python': ['python'],
\}

let g:ale_sign_error = '●●'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_php_phpmd_ruleset='codesize,controversial,design,unusedcode,BooleanArgumentFlag'
let g:ale_lint_delay = 1000
let g:ale_change_sign_column_color = 1

let g:ale_html_tidy_executable = 'tidy5'
let g:ale_html_tidy_options = '-q -e -language en --drop-empty-elements no'
