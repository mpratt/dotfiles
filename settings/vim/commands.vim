" ~/.vim/commands.vim
" Michael Pratt
" pratt@hablarmierda.net 
" http://www.michael-pratt.com

" Omni Complete settings
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set omnifunc=syntaxcomplete#Complete

" Add $ to the keywords when running php
" autocmd FileType php setlocal iskeyword+=$

" Make sure all markdown files have the correct filetype set and setup wrapping
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" Change cwd to file we are currently editing
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing whitespace on save for a bunch of filetypes
autocmd BufWritePre *.php :%s/\s\+$//e
autocmd BufWritePre *.md :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.sh :%s/\s\+$//e
autocmd BufWritePre *.txt :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
autocmd BufWritePre *.json :%s/\s\+$//e
autocmd BufWritePre *.twig :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e

" JsBeautifier Plugin
au Filetype javascript source $HOME/.vim/local/scripts/jsbeautify.vim

" Exit insert mode after 4 seconds of idle time
" :au CursorHoldI * stopinsert 

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

" Only show trailing whitspace when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:•
    au InsertLeave * :set listchars+=trail:•
augroup END
