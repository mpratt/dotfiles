" ~/.vim/plugins.vim
" Michael Pratt
" pratt@hablarmierda.net 
" http://www.michael-pratt.com
 
" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers=['php', 'phpmd', 'phpcs']
let g:syntastic_php_phpmd_post_args='text codesize,design,unusedcode'
let g:syntastic_php_phpcs_post_args='--encoding=utf-8 --standard=/home/pratt/.vim/local/PHPCodingStandards'
let g:syntastic_html_tidy_ignore_errors=[' proprietary attribute "ng-', 'proprietary attribute', 'trimming empty']

" Color hex/rgb/rga values on css files
Bundle 'skammer/vim-css-color'
let g:cssColorVimDoNotMessMyUpdatetime = 1

Bundle 'kien/ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0 " Keep caches between sessions - f5 to refresh once CtrlP is open
let g:ctrlp_extensions = ['tag'] " Search in Tags also
let g:ctrlp_follow_symlinks = 1
" Open files in tabs
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
	\ 'fallback': 'find %s -type f -maxdepth 3 \! -iname "*.png" \! -iname "*.gif" \! -iname "*.jpg"'
	\ }

Bundle 'Valloric/YouCompleteMe' 
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \}

Bundle 'Glench/Vim-Jinja2-Syntax'
au BufRead,BufNewFile *.twig set filetype=jinja " Enable jinja Syntax file

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-e>"

Bundle 'goldfeld/vim-seek'
let g:seek_subst_disable = 1 " Vim Seek - Disable substitution

Bundle 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1 " let a few general purpose mappings available globally

" No need to configure this other plugins
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'Lokaltog/powerline'
Bundle 'tpope/vim-surround'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'terryma/vim-expand-region'
Bundle 'paradigm/TextObjectify'

" Color Schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'veloce/vim-aldmeris'
Bundle 'altercation/vim-colors-solarized'
