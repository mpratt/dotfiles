" Vim php syntax file
" File: $VIMCONFIG/after/ftplugin/php.vim
" Author: Michael Pratt

" Avoid function redefinition error
if exists('g:local_php_script')
  finish
endif

let g:local_php_script = 1

" Search and open a testfile based on the given Input
function ftplugin#php#FindTestFile()
    let filename = expand('%:r')
    let extension = expand('%:e')
    let fullpath = expand('%:p:h')
    for p in split(fullpath, '/')
        let files = [ substitute(fullpath, '/' . p . '/', '/tests/', '') . '/' . filename . 'Test.' . extension, substitute(fullpath, '/' . p . '/', '/tests/', '') . '/' . filename . '.' . extension ]
        for f in files
            if filereadable(f)
                echo f . ' exists'
                execute ':edit ' . f
                return 1
            endif
        endfor
    endfor
    echo 'No testing file was found'
endfunction

" Select inside/outside functions
xmap if i{
xmap af a{

" Find Test Files
nnoremap <Leader>te :call ftplugin#php#FindTestFile()<CR>
