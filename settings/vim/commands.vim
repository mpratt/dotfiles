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

" Remove _ from the word list when running php
" autocmd FileType php setlocal iskeyword-=_

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

" Lint and execution mappings for some filetypes
autocmd FileType php noremap <F11> :w!<CR>:!/usr/bin/php -l %<CR>
autocmd FileType php noremap <F12> :w!<CR>:!/usr/bin/php -f %<CR>
autocmd FileType python noremap <F11> :w!<CR>:!/usr/bin/pyflakes %<CR>
autocmd FileType python noremap <F12> :w!<CR>:!/usr/bin/python -B %<CR>

" Close Tag Plugin
au Filetype html,xml,xsl,php source ~/.vim/scripts/closetag.vim

" JsBeautifier Plugin
au Filetype javascript source $HOME/.vim/scripts/jsbeautify.vim

" Exit insert mode after 4 seconds of idle time
" :au CursorHoldI * stopinsert 

" Saves when focus lost.
au FocusLost * silent! wa
