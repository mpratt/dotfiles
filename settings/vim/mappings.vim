" ~/.vim/mappings.vim
" Michael Pratt
" pratt@hablarmierda.net 
" http://www.michael-pratt.com

" Want a different map leader than \
let mapleader = "\<Space>"

" Switch between windows easily with alt and arrow keys
nmap <silent><A-Up> :wincmd k<CR>
nmap <silent><A-Down> :wincmd j<CR>
nmap <silent><A-Left> :wincmd h<CR>
nmap <silent><A-Right> :wincmd l<CR>

" Alt-o: Jump back in the changelist
nnoremap <silent><A-o> g;

" Alt-i: Jump forward in the changelist
nnoremap <silent><A-i> g,

" Move lines up and down in normal mode with Ctrl and arrow keys
no <C-up> ddkP
no <C-down> ddp

" Move between buffers in normal mode with Ctrl and arroy keys
no <C-right> :bn<CR>
no <C-left> :bp<CR>

" Tab Navigation
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>

" Use CTRL+s for saving
noremap <C-s> :update<CR>
inoremap <C-s> <ESC>:w<CR>

" Ctrl+k deletes the current line
noremap <C-k> dd

" Visual Mode Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" System clipboard interaction
noremap <leader>y "+y
noremap <leader>p "+p

" Make <leader>w write and close the buffer
noremap <leader>w :w<CR>:bd<CR> 


" Create a new line below/above cursor in normal mode
nmap <leader>o o<ESC>k
nmap <leader>O O<Esc>j

" Puts me on a good place with functions and php
nmap <leader>b ^f{i<CR><ESC>f}i<CR><ESC>O

" Clear current search highlight
nmap <leader>h :nohlsearch<CR>

" Made D and Y behave
nnoremap D d$
nnoremap Y y$

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Map U to redo (since u undo's)
nnoremap U <c-r>

" Use H and L to navigate to start/finish of line
noremap H ^
noremap L $

" Type 12<Enter> to go to line 12 (12G breaks my wrist) Or just <Enter> to go to the end of a file
" Hit Backspace to go to beginning of file.
nnoremap <CR> G
nnoremap <BS> gg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following mappings change/overwrite the normal behaviour of some keyskbd 
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

" This makes the cursor move to the next visual line when navigating wrapped text, rather than the next actual line.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Visual Mode Indenting
vmap > >gv
vmap < <gv

" I really hate that things don't auto-center
nmap G Gzz
nmap } }zz
nmap { {zz

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

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

" Automatically jump to end of text you pasted - Paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Send visual selection to my site
" vnoremap <c-p> :w !curl -sF 'sprunge=<-' 'http://michael-pratt.com' \| tr -d '\n ' \| pbcopy && open `pbpaste`<cr>

" Select entire buffer
nnoremap vaa ggVG

" Panic Button
nnoremap <f9> mzggg?G`z

" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>:set redraw!<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source
vnoremap <leader>a y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>A ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>v <C-w>v
