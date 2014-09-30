let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_session_dir = '~/.vim/local/sessions'

if has("unix")
    let g:startify_custom_header =
                \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
endif
