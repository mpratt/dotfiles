Plug 'w0rp/ale'
let g:ale_linters = {
\   'php': ['php', 'phpmd'],
\   'python': ['python'],
\}

let g:ale_php_phpmd_ruleset='codesize,controversial,design,unusedcode,BooleanArgumentFlag'
let g:ale_lint_delay = 1000
