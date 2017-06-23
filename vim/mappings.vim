" ~/.vim/mappings.vim
" Michael Pratt
" http://www.michael-pratt.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DONT FORGET TO UPDATE THE README FILE WITH ADDED MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Want a different map leader than \
let mapleader = "\<Space>"

" Switch between windows easily with alt and arrow keys
nmap <silent><A-Up> :wincmd k<CR>
nmap <silent><A-Down> :wincmd j<CR>
nmap <silent><A-Left> :wincmd h<CR>
nmap <silent><A-Right> :wincmd l<CR>

" Move between next/previous tabs
no <C-right> :tabnext<CR>
no <C-left> :tabprevious<CR>

" Tab Navigation
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

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

" Create a new line below the cursor in normal mode
noremap <leader>o o<ESC>k

" Clear current search highlight
noremap <leader>h :nohlsearch<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal rnu!<cr>

" Source selection
vnoremap <leader>a y:execute @@<cr>:echo 'Sourced selection.'<cr>

" Select entire buffer
nnoremap <leader>b ggVG

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

" Type 12<Enter> to go to line 12 (12G breaks my wrist) Or just <Enter> to go to the start of the file
nnoremap <CR> gg

" Send visual selection to my site
" vnoremap <c-p> :w !curl -sF 'sprunge=<-' 'http://michael-pratt.com' \| tr -d '\n ' \| pbcopy && open `pbpaste`<cr>

" Panic Button
nnoremap <f9> mzggg?G`z
