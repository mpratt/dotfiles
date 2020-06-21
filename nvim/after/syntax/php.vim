" Vim php syntax file
" File: ~/.vim/after/syntax/php.vim
" Author: Michael Pratt

" Add a new group called phpCustom, with the 'function', 'new' and other keywords
syn keyword phpSpecial use namespace new die exit contained
syn keyword customPhpFunctions function __construct __destruct __call contained

" Force highlight
hi! link phpSpecial Statement
hi! link customPhpFunctions Function
hi! link phpVarSelector Keyword
hi! link phpInclude Statement
