" Vim php syntax file
" File: ~/.vim/after/syntax/php.vim
" Author: Michael Pratt
"
" The file php.vim I use, puts some keywords like function, die, new and others, into the phpKeyword
" group. I prefer to treat those keywords as 'special', so what this file does is correct that.

" Clear the phpKeyword and repopulate it without the 'function', 'new' and other keywords
syn clear phpKeyword
syn keyword phpKeyword eval empty isset unset list instanceof insteadof contained
syn keyword phpKeyword if echo else elseif while do for foreach break switch case default continue return goto contained
syn keyword phpKeyword as endif endwhile endfor endforeach endswitch declare endeclare print clone yield contained
syn keyword phpKeyword try catch finally throw contained

" Add a new group called phpCustom, with the 'function', 'new' and other keywords
syn keyword phpSpecial new function die exit contained

" Add phpSpecial to the phpClFunction cluster
syn cluster phpClFunction add=phpSpecial

" Force highlight
hi! link phpSpecial Special
