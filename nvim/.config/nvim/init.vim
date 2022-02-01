" .vimrc
" Michael Pratt
" http://www.michael-pratt.com

filetype off

" Load custom settings/plugins
call plug#begin(stdpath('data') . '/plugged')
    Plug 'gruvbox-community/gruvbox',
    Plug 'tpope/vim-fugitive',
    Plug 'neovim/nvim-lspconfig',
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'hrsh7th/nvim-cmp',
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'vifm/vifm.vim'
    Plug 'ap/vim-buftabline'
    Plug 'machakann/vim-sandwich'
    Plug 'numToStr/Comment.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
call plug#end()

for fpath in split(globpath('~/.config/nvim/config', '*.vim'), '\n')
    exe 'source' fpath
endfor

lua require('lsp')

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
set signcolumn=yes                         " Always show the sign Column
set cmdheight=2                            " Better display for messages

" General Settings
set ffs=unix,dos,mac
set nofoldenable        " Disable Folding when opening files, use zi to enable manually
set hidden              " Switch between buffers without saving (needed by coc)
set number              " Show lines numbers
set rnu                 " Show Relative Line Numbers
set showmatch           " Cursor shows matching ) and }
set cursorline          " Show Cursor line
set clipboard=unnamed   " yank to the system register (*) by default
set confirm             " Y-N-C prompt if closing with unsaved changes.
set scrolloff=10        " Setting 'scrolloff' to a large value causes the cursor to stay in the middle line when possible
set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Tab and Indenting Stuff
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set shiftwidth=4        " number of spaces to use for auto indent
set softtabstop=4
set smartindent
set cindent
set cinkeys=0{,0},!^F,o,O,e

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

" Better Completion
" set completeopt=longest,menuone,noinsert
set completeopt=menu,menuone,noselect
set complete=.,b,u,t,w " Scan the current buffer, buffers from other windows, buffers from the buffer list, Scan buffers that have been unloaded from the buffer list, Tag completion and the current and included files
set shortmess+=c   " don't give |ins-completion-menu| messages.

" Show end of command visually when editing text
set cpoptions+=$

" Python version
set pyx=3

" Spell checking stuff
try
    lang en_us
catch
endtry

" Display tabs and trailing spaces visually
set list
set listchars=nbsp:¬,eol:↳,tab:└─,extends:»,precedes:«

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

nmap <A-S-j> ]m
nmap <A-S-k> [m

" Vertical Navigation
nmap <A-j> }
nmap <A-k> {

" Go to next ''/""/[]/{}
nnoremap <Leader>j :call search('""\\|()\\|[]\\|{}\\|''''')<CR>
nnoremap <Leader>k :call search('""\\|()\\|[]\\|{}\\|''''', 'b')<CR>

" File Navigation
nnoremap <Leader><Leader> <C-^>

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
" Change cwd to file we are currently editing
autocmd BufEnter * silent! lcd %:p:h

" Saves when focus lost.
au FocusLost * silent! wa

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

augroup highlight_yank
autocmd!
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup mpratt
    autocmd!
    " Remove trailing whitespace on save for a bunch of filetypes on save
    autocmd BufWritePre * call Preserve("%s/\\s\\+$//e")
augroup END
