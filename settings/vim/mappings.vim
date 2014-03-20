" ~/.vim/mappings.vim
" Michael Pratt
" pratt@hablarmierda.net 
" http://www.michael-pratt.com

" Want a different map leader than \
let mapleader = ","
"set timeoutlen=500    " Ever notice a slight lag after typing the leader key + command? This lowers the timeout.

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

" Move lines up and down in normal mode with Ctrl and arrow keys
no <C-up> ddkP
no <C-down> ddp

" Move between buffers in normal mode with Ctrl and arroy keys
no <C-right> :bn<CR>
no <C-left> :bp<CR>

" Map U to redo (since u undo's)
nnoremap U <c-r>

" Switch between windows easily with alt and arrow keys
nmap <silent><A-Up> :wincmd k<CR>
nmap <silent><A-Down> :wincmd j<CR>
nmap <silent><A-Left> :wincmd h<CR>
nmap <silent><A-Right> :wincmd l<CR>

" Tab Navigation
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>

" Allow the space key on normal mode
noremap <Space> i<Space><Esc>

" Ctrl+k deletes the current line
noremap <C-k> dd

" Open a tag in new tab
nmap <leader>] <C-w><C-]><C-w>T

" Deletes the current buffer
nmap <leader>dd :bd<CR>

" System clipboard interaction | Make mouse middle click paste without formatting it.
noremap <leader>y "+y
noremap <leader>p "+p
noremap <MouseMiddle> "*p

" Use CTRL+s for saving
noremap <C-s> :update<CR>
inoremap <C-s> <ESC>:w<CR>

" Visual Mode Indenting
vmap > >gv
vmap < <gv

" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Make <leader>w write and close the buffer
noremap <leader>w :w<CR>:bd<CR> 

" Visual Mode Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Alt-o: Jump back in the changelist
nnoremap <m-o> g;

" Alt-i: Jump forward in the changelist
nnoremap <m-i> g,

" Use H and L to navigate to start/finish of line
noremap H ^
noremap L $

" Create a new line below/above cursor in normal mode
nmap <leader>o o<ESC>k
nmap <leader>O O<Esc>j

" Clear current search highlight
nmap <leader>/ :nohlsearch<CR>

" Common mistakes
command! Q q
command! Qall qall
cmap WQ wq
cmap Wq wq

" Start file manager
if has("win32")
    nmap <F9> :!start explorer /e,,%:p:h<CR>
else
    nmap <F9> :exec '!thunar &'<CR>
endif

" Puts me on a good place with functions and php
nmap <leader>b ^f{i<CR><ESC>f}i<CR><ESC>O
