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
" Custom user command
let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ },
	\ 'fallback': 'find %s -H -type f -maxdepth 3 \! -iname "*.png" \! -iname "*.gif" \! -iname "*.jpg"'
	\ }

Bundle 'Valloric/YouCompleteMe'
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \}

Bundle 'Glench/Vim-Jinja2-Syntax'
au BufRead,BufNewFile *.twig set filetype=jinja " Enable jinja Syntax file

Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-e>"
Bundle 'honza/vim-snippets'

Bundle 'goldfeld/vim-seek'
let g:seek_subst_disable = 1 " Vim Seek - Disable substitution

" Bundle 'Lokaltog/powerline' - Removed in favor of vim-airline
Bundle 'bling/vim-airline'
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" Expand Region - Use v to expand a region
Bundle 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" No need to configure this other plugins
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Hackworth/vim-ps1'

" Enhancements to vim
Bundle 'paradigm/TextObjectify'
Bundle 'StanAngeloff/php.vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'nathanaelkane/vim-indent-guides'

" Color Schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'veloce/vim-aldmeris'
Bundle 'altercation/vim-colors-solarized'
