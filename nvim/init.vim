" .vimrc
" Michael Pratt
" http://www.michael-pratt.com
"
filetype off

" Load custom settings/plugins
call plug#begin(stdpath('data') . '/plugged')
for fpath in split(globpath('~/.config/nvim/my-plugins', '*.vim'), '\n')
    exe 'source' fpath
endfor
call plug#end()
filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Terminal Stuff
set termguicolors

" How my editor looks like
set linespace=3                            " Prefer a slightly higher line height
set guifont=Source\ Code\ Pro\ Medium:h10  " Font and Size
set noerrorbells                           " disable sound on errors
set novisualbell                           " disable sound on errors
set nowrap                                 " Don't wrap lines
set title                                  " Show Title

" General Settings
set ffs=unix,dos,mac
set nofoldenable        " Disable Folding when opening files, use zi to enable manually
set hidden              " Switch between buffers without saving (needed by coc)
set number              " Show lines numbers
set showmatch           " Cursor shows matching ) and }
set cursorline          " Show Cursor line
set clipboard=unnamed   " yank to the system register (*) by default
set confirm             " Y-N-C prompt if closing with unsaved changes.
set synmaxcol=500       " long lines syntax coloring/highlighting
set gdefault            " Add the g flag to search/replace by default
set scrolloff=10        " Setting 'scrolloff' to a large value causes the cursor to stay in the middle line when possible
set updatetime=300      " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set cmdheight=2         " Better display for messages
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Tab and Indenting Stuff
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set shiftwidth=4        " number of spaces to use for auto indent
set softtabstop=4
set smartindent

" Search Settings
set ignorecase         " case insensitive search
set smartcase          " unless uppercase letters are used in the regex.
set fileignorecase     " Ignore case while searching for a file.

" Backup and Undo Settings
set undofile
set nobackup
set nowritebackup
set noswapfile         " it's 2015+, Vim.
set undolevels=1000    " use many levels of undo

" Open splits on the right
set splitright

" Autocomplete stuff
set omnifunc=syntaxcomplete#Complete

" Better Completion
set completeopt=longest,menuone,noinsert
set complete=.,b,u,t,w " Scan the current buffer, buffers from other windows, buffers from the buffer list, Scan buffers that have been unloaded from the buffer list, Tag completion and the current and included files
set shortmess+=c   " don't give |ins-completion-menu| messages.

" Show end of command visually when editing text
set cpoptions+=$

" Spell checking stuff
try
    lang en_us
catch
endtry

if exists("g:gnvim") || exists("gui_running")
    " Display tabs and trailing spaces visually
    set list 
    set listchars=nbsp:¬,eol:↳,tab:└─,extends:»,precedes:«
endif

" Open diffs in vertical splits
" Use 'xdiff' library options: patience algorithm with indent-heuristics (same to Git options)
" NOTE: vim uses the external diff utility which doesn't do word diffs nor can it find moved-and-modified lines.
" See: https://stackoverflow.com/questions/36519864/the-way-to-improve-vimdiff-similarity-searching-mechanism
set diffopt=internal,filler,vertical,context:5,foldcolumn:1,indent-heuristic,algorithm:patience

" Always show signcolumns
set signcolumn=yes
" Better color to the Debug Gutter, since it normally displays errors
"highlight SignColumn guibg=red 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes - Random color scheme depending on gui/terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try 
    let mycolorschemes = [ 'molokai', 'dracula', 'gruvbox', 'ayu' ]
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_invert_selection='0'
    let ayucolor="mirage"

    set background=dark
    exe 'colorscheme ' . mycolorschemes[localtime() % len(mycolorschemes)]
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'Normal·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '^V' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ '^S' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \ 't'  : 'Terminal'
            \}

" Function: return current mode
" abort -> function will abort soon as error detected
function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %{ModeCurrent()}
set statusline+=\ 
set statusline+=%#LineNr#
set statusline+=%#Function#\ %f\ %m
set statusline+=\ 
set statusline+=%#LineNr#
set statusline+=%#Warnings#
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Execute a command while preserving cursor position and history.
function! Preserve(command)
    let _s=@/         " Save search history.
    let l = line('.') " Save current line.
    let c = col('.')  " Save current column.
    execute a:command
    let @/=_s         " Reset search history.
    call cursor(l, c) " Reset cursor position.
endfunction

" Get current syntax/color properties for vim
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Small terminal
function! s:small_terminal() abort
    new
    wincmd J
    call nvim_win_set_height(0, 18)
    term
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following mappings change/overwrite the normal behaviour of some keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unmap the arrow keys in normal and visual mode
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
vno <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Visual Mode Indenting
vmap > >gv
vmap < <gv

" I really hate that things don't auto-center
nmap G Gzz
nmap } }zz
nmap { {zz
nmap ]] ]]zz
nmap [[ [[zz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Common Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>

" Automatically jump to end of text you pasted - Paste multiple lines multiple times with simple ppppp
vnoremap <silent> y y`]
vnoremap <silent> p p`]
vnoremap <silent> p p^
nnoremap <silent> p p`]

" This turns off Vim’s crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Want a different map leader than \
let mapleader = "\<Space>"

" Tab Navigation
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

" Visual Mode Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <C-r> :%s/<c-r><c-w>//gc<left><left><left>

" Source selection with <leader>+s on visual mode
vnoremap <leader>s y:execute @@<cr>:echo 'Sourced selection.'<cr>

" Make <leader>w write and close the buffer
noremap <leader>w :w<CR>:bd<CR> 

" Make <leader>q Close buffer
noremap <leader>q :bd<CR> 

" System clipboard interaction
noremap <leader>y "+y
noremap <leader>p "+p

" Create a new line below the cursor in normal mode
noremap <leader>o :only<CR>

" Clear current search highlight
noremap <leader><Esc> :nohlsearch<CR>

" Select entire buffer
nnoremap <leader>b ggVG

" <leader>= Reindent all the file
nnoremap <Leader>= :call Preserve("normal gg=Gzz")<CR>

" Map U to redo (since u undo's)
nnoremap U <c-r>

" Panic Button
nnoremap <f9> mzggg?G`z

" Move lines up / down
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Vertical Navigation
nmap <A-j> }
nmap <A-k> {
nmap <A-S-j> ]m
nmap <A-S-k> [m

" Go to next ''/""/[]/{}
nnoremap <Leader>j :call search('""\\|()\\|[]\\|{}\\|''''')<CR>
nnoremap <Leader>k :call search('""\\|()\\|[]\\|{}\\|''''', 'b')<CR>

" File Navigation
nnoremap <Leader><Leader> <C-^>

" Show syntax highlight group
nnoremap <leader>sp :call <SID>SynStack()<CR>

" Make a small terminal at the bottom of the screen.
nnoremap <leader>tt :call <SID>small_terminal()<CR>

" Resize Windows
nnoremap <Leader>< :vertical resize +10<CR>
nnoremap <Leader>> :vertical resize -1o<CR>
nnoremap <Leader>, :resize +10<CR>
nnoremap <Leader>. :resize -10<CR>

" Window Navigation
nmap <A-Up> :wincmd k<CR>
nmap <A-Down> :wincmd j<CR>
nmap <A-Left> :wincmd h<CR>
nmap <A-Right> :wincmd l<CR>
nmap <A-d> :wincmd w<CR>
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Right> <C-\><C-n><C-w>l
tnoremap <leader><Esc> <C-\><C-n>
tnoremap <A-d> <C-\><C-n><C-w>w

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Correct some filetypes
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufRead,BufNewFile *.ejs,*.mustache,*.tpl setfiletype html

" Change cwd to file we are currently editing
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing whitespace on save for a bunch of filetypes on save
autocmd BufWritePre *.php call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.md call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.py call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.sh call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.txt call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.js call Preserve("%s/\\s\\+$//e")
autocmd BufWritePre *.html call Preserve("%s/\\s\\+$//e")

" Saves when focus lost.
au FocusLost * silent! wa

" http://superuser.com/questions/305945/gvim-omni-completion-preview-window-doesnt-go-away
au InsertLeave * if pumvisible() == 0|pclose|endif

" Resize splits when the window is resized
au VimResized * :wincmd =

" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Only show trailing whitespace when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:•
    au InsertLeave * :set listchars+=trail:•
augroup END

" Highlight text on yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc Mappings / Settings They need to be outside of the plugin file :(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <leader>ge <Plug>(coc-diagnostic-next-error)
nmap <leader>gt :CocSearch <C-R>=expand("<cword>")<CR><CR> " Search/Replace Word inside full project
