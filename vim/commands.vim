" ~/.vim/commands.vim
" Michael Pratt
" http://www.michael-pratt.com

" Omni Complete settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Add $ to the keywords when running php
" autocmd FileType php setlocal iskeyword+=$

" Make sure all markdown files have the correct filetype set and setup wrapping
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown

" Treat JSON files like JavaScript
au BufNewFile,BufRead *.json set ft=javascript

" Change cwd to file we are currently editing
autocmd BufEnter * silent! lcd %:p:h

" Remove trailing whitespace on save for a bunch of filetypes on save
if exists("*Preserve")
    autocmd BufWritePre *.php call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.md call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.py call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.sh call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.txt call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.js call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.json call Preserve("%s/\\s\\+$//e")
    autocmd BufWritePre *.html call Preserve("%s/\\s\\+$//e")
else
    autocmd BufWritePre *.php :%s/\s\+$//e
    autocmd BufWritePre *.md :%s/\s\+$//e
    autocmd BufWritePre *.py :%s/\s\+$//e
    autocmd BufWritePre *.sh :%s/\s\+$//e
    autocmd BufWritePre *.txt :%s/\s\+$//e
    autocmd BufWritePre *.js :%s/\s\+$//e
    autocmd BufWritePre *.json :%s/\s\+$//e
    autocmd BufWritePre *.html :%s/\s\+$//e
endif

" JsBeautifier Plugin
au Filetype javascript source $HOME/.vim/local/scripts/jsbeautify.vim

" Debug Commands for JS/PHP
au FileType javascript nnoremap <leader>mb ^vg_daconsole.log( <esc>pa );<cr><esc>
au FileType php nnoremap <leader>mb ^vg_daprint_r(<esc>pa, true);<cr><esc>

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

" Reload vimrc when edited
" autocmd BufWritePost .vimrc,_vimrc,vimrc so $MYVIMRC
