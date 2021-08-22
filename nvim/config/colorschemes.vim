"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes - Random color scheme depending on gui/terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try 
    let mycolorschemes = [ 'gruvbox' ]
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_invert_selection='0'

    set background=dark
    exe 'colorscheme ' . mycolorschemes[localtime() % len(mycolorschemes)]
catch
endtry
