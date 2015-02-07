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

" Move between buffers in normal mode with Ctrl and arroy keys
no <C-right> :tabnext<CR>
no <C-left> :tabprevious<CR>

" Tab Navigation
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

" Ctrl+k deletes the current line
noremap <C-k> dd

" Visual Mode Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
nnoremap <C-r> :%s/<c-r><c-w>//gc<left><left><left>

" Use <leader>+s for saving
noremap <C-s> :echoerr "Use leader-s for saving"<CR><ESC>
inoremap <C-s> <ESC>:echoerr "Use leader-s for saving"<CR><ESC>
noremap <leader>s :update<CR>

" Make <leader>w write and close the buffer
noremap <leader>w :w<CR>:bd<CR> 

" System clipboard interaction
noremap <leader>y "+y
noremap <leader>p "+p

" Create a new line below/above cursor in normal mode
noremap <leader>o o<ESC>k
noremap <leader>O O<Esc>j

" Clear current search highlight
noremap <leader>h :nohlsearch<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Toggle [i]nvisible characters
nnoremap <leader>- :set list!<cr>:set redraw!<cr>

" Edit $MYVIMRC
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Source selection
vnoremap <leader>a y:execute @@<cr>:echo 'Sourced selection.'<cr>

" Pressing ,ss will toggle and untoggle spell checking
nnoremap <leader>l; :setlocal spell!<cr>
nnoremap <silent> <leader>ls :setlocal spelllang=es<cr>
nnoremap <silent> <leader>le :setlocal spelllang=en<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Split line (sister to [J]oin lines)
nnoremap <A-p> i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Made D and Y behave
nnoremap D d$
nnoremap Y y$

" Use H and L to navigate to start/finish of line
noremap H ^
noremap L $
vnoremap L g_

" Map U to redo (since u undo's)
nnoremap U <c-r>

" Type 12<Enter> to go to line 12 (12G breaks my wrist) Or just <Enter> to go to the end of a file
" Hit Backspace to go to beginning of file.
nnoremap <CR> G
nnoremap <BS> gg

" Send visual selection to my site
" vnoremap <c-p> :w !curl -sF 'sprunge=<-' 'http://michael-pratt.com' \| tr -d '\n ' \| pbcopy && open `pbpaste`<cr>

" Select entire buffer
nnoremap vaa ggVG

" Panic Button
nnoremap <f9> mzggg?G`z

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

" This makes the cursor move to the next visual line when navigating wrapped text, rather than the next actual line.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" Visual Mode Indenting
vmap > >gv
vmap < <gv

" ddI really hate that things don't auto-center
nmap G Gzz
nmap }dd }zz
nmap { {ddzz

" ddKeep search matches in the middle of the window.
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

" Automatically jump to end of text you pasted - Paste multiple lines multiple times with simple ppppp.
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Keep the cursor in place while joining lines
" nnoremap J mzJ`z
