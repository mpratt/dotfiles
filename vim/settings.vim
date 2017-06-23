" ~/.vim/settings.vim
" Michael Pratt
" pratt@hablarmierda.net " http://www.michael-pratt.com

" Encoding Settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Terminal Stuff
set t_Co=256
set term=xterm-256color

" Disable Background Color Erase so that color scheme work properly
" when vim is used inside tmux and GNU screen
set t_ut=

" How my editor looks like
set linespace=3                            " Prefer a slightly higher line height
" set guifont=consolas\ regular\ 11        " Font and Size
" set guifont=Fira\ Mono\ Regular\ 10      " Font and Size
set guifont=Source\ Code\ Pro\ Medium\ 10  " Font and Size
set noerrorbells                           " disable sound on errors
set novisualbell                           " disable sound on errors
set nowrap                                 " Don't wrap lines
set linebreak                              " Wrap lines at convenient points
set title                                  " Show Title
set guioptions-=T                          " remove toolbar
set guioptions-=m                          " remove menu bar

" General Settings
set ffs=unix,dos,mac
set switchbuf=usetab,newtab
set exrc               " Enable project specific .vimrc
set nofoldenable       " Disable Folding when opening files, use zi to enable manually
set nostartofline      " Avoid moving cursor to BOL when jumping around
set ruler              " show the cursor position all the time
set autoread           " auto read when file is changed from outside
set bs=2               " allow backspacing over everything in insert mode
set backspace=indent,eol,start  " make backspaces more powerfull
set history=100        " keep 100 lines of command line history
set hidden             " Switch between buffers without saving
set showcmd            " Show command in bottom right portion of the screen
set number             " Show lines numbers
set showmatch          " Cursor shows matching ) and }
set cursorline         " Show Cursor line
set noshowmode         " I dont need this, since Im using Airline
set clipboard=unnamed  " yank to the system register (*) by default
set confirm            " Y-N-C prompt if closing with unsaved changes.
set mouse=a            " enable using the mouse if terminal emulator supports it (xterm does)
set selectmode+=mouse  " Enable selections with the mouse
set mousehide          " Hide mouse when typing
set synmaxcol=530      " long lines syntax coloring/highlighting
set formatoptions+=1   " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set pastetoggle=<F11>  " When in insert mode, press <F11> to go to paste mode, where you can paste mass data that won't be autoindented
set ttyfast            " Optimize for fast terminal connections
set gdefault           " Add the g flag to search/replace by default
set wildmenu           " Use bash-like tab completion in Vim command line
set wildmode=longest,list:longest

" Stuff to ignore when tab completing
set wildignore+=.hg,.git,.svn
set wildignore+=*.pyc    
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.bmp,*.jpeg
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl
set wildignore+=*.sw? 
set wildignore+=*.luac
set wildignore+=migrations
set wildignore+=*.pyc
set wildignore+=*.orig

" keep some context when moving
set scrolloff=15
set sidescrolloff=15

" make plugins smoother (don't redraw while executing macros)
set lazyredraw

" Tab and Indenting Stuff
set expandtab           " enter spaces when tab is pressed
set textwidth=500       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set shiftwidth=4        " number of spaces to use for auto indent
set softtabstop=4
set autoindent          " auto indentation
set smartindent

" Search Settings
set hlsearch           " Highlight searching
set ignorecase         " case insensitive search
set smartcase          " unless uppercase letters are used in the regex.
set incsearch          " Set incremental searching

" Backup and Undo Settings
set backup             " enable backups
set noswapfile         " it's 2015+, Vim.
set undolevels=1000    " use many levels of undo
set fillchars+=vert:│  "vertical splits less gap between bars

" Undo/Backup/Swap folders. Create them when needed
set undodir=~/.vim/local/tmp/undo/
set backupdir=~/.vim/local/tmp/backup/
set directory=~/.vim/local/tmp/swap/

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

if !isdirectory(expand('~/.vim/local/sessions'))
    call mkdir(expand('~/.vim/local/sessions'), "p")
endif

" Set sensible heights for splits
set winheight=50

" Autocomplete stuff
set omnifunc=syntaxcomplete#Complete

" fix slight delay after pressing ESC then O
" http://ksjoberg.com/vim-esckeys.html
" set noesckeys
" set timeout timeoutlen=1000 ttimeoutlen=100

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set completeopt=longest,menu,preview
set complete=.,w,b,u,t

" Show end of command visually when editing text
set cpoptions+=$

" Set the tag file search order
set tags=./TAGS;

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys

" Set Shell
set shell=/bin/bash

" Spell checking stuff
try
  lang en_us
catch
endtry

if has("gui_running")
    " Display tabs and trailing spaces visually
    set list 
    set listchars=nbsp:¬,eol:↳,tab:└─,extends:»,precedes:«

    " Other Alternative
    "set listchars=tab:›\ 
    "set listchars+=trail:-
    "set listchars+=extends:>
    "set listchars+=precedes:<
    "set listchars+=eol:¬

    " Other Alternative
    "set listchars=tab:▶\ 
    "set listchars+=eol:★
    "set listchars+=trail:◥
    "set listchars+=extends:❯
    "set listchars+=precedes:❮ 

    " set tab labels to show at most 15 characters
    " set guitablabel=%-0.15t%M

    " Start Fullscreen!
    set lines=999
    set columns=999
endif

" Windows Only Settings
if has("win32") || has("win64")
    set ssl     " it should do ~ vs $HOME
endif

" shortcuts to open files externally and perform online searches
if has('mac')
    let g:open_command = 'open'
elseif has('unix')
    let g:open_command = 'xdg-open'
else
    let g:open_command = 'start'
endif
