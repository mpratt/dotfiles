" ~/.vim/settings.vim
" Michael Pratt
" pratt@hablarmierda.net " http://www.michael-pratt.com

" Encoding Settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" How my editor looks like
set linespace=3                       " Prefer a slightly higher line height
set guifont=consolas\ regular\ 11     " Font and Size
set go-=T                             " Hide Gvim toolbar by default
set noerrorbells                      " disable sound on errors
set novisualbell                      " disable sound on errors
set nowrap                            " Don't wrap lines
set linebreak                         " Wrap lines at convenient points
"set nofoldenable                      " Disable code folding
set title

" General Settings
set switchbuf=usetab,newtab
set nostartofline      " Avoid moving cursor to BOL when jumping around
set ruler              " show the cursor position all the time
set autoread           " auto read when file is changed from outside
set bs=2               " allow backspacing over everything in insert mode
set backspace=indent,eol,start  " make backspaces more powerfull
set history=100        " keep 100 lines of command line history
set hidden             "Switch between buffers without saving
set showcmd            " Show command in bottom right portion of the screen
set number             " Show lines numbers
set showmatch          " Cursor shows matching ) and }
"set showmode           " Show current mode
set noshowmode         " I dont need this, since Im using Powerline
set clipboard=unnamed  " yank to the system register (*) by default
set laststatus=2       " Always show the status line
set confirm            " Y-N-C prompt if closing with unsaved changes.
set mouse=a            " enable using the mouse if terminal emulator supports it (xterm does)
set selectmode+=mouse  " Enable selections with the mouse
set mousehide          " Hide mouse when typing
set synmaxcol=512      " long lines syntax coloring/highlighting
"set spell              " Turn on spell checking
"set fileformats=unix,dos,mac
set ffs=unix,dos,mac
set formatoptions+=1            " When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
set pastetoggle=<F11>           " When in insert mode, press <F11> to go to paste mode, where you can paste mass data that won't be autoindented
set wildmenu                    " Use bash-like tab completion in Vim command line
set wildmode=longest,list:longest
set wildignore+=.hg,.git,.svn   " Ignore Version Control 
set wildignore+=*.pyc           " Ignore Python byte code
set wildignore+=*.jpg,*.png,*.xpm,*.gif,*.bmp  " Ignore Image Files

" keep some context when moving
set scrolloff=15
set sidescrolloff=15

" make plugins smoother (don't redraw while executing macros)
set lazyredraw

" Tab and Indenting Stuff
set expandtab           " enter spaces when tab is pressed
set textwidth=500       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " auto indentation
set smartindent

" Search Settings
set hlsearch           " Highlight searching
set ignorecase         " case insensitive search
set smartcase          " unless uppercase letters are used in the regex.
set incsearch          " Set incremental searching

" Backup and Undo Settings
set noswapfile
set nobackup
set nowb
set directory^=~/.vim/tmp/ " store swap files here
set undolevels=1000        " use many levels of undo
set undodir=~/.vim/tmp/    " Keep undo history across sessions, by storing in file.
set fillchars+=vert:│ "vertical splits less gap between bars

" fix slight delay after pressing ESC then O
" http://ksjoberg.com/vim-esckeys.html
" set noesckeys
set timeout timeoutlen=1000 ttimeoutlen=100

" Auto-complete with <Ctrl+X Ctrl+O> | Tab
set completeopt=longest,menu,preview
"set complete-=i

" Show end of command visually when editing text
set cpoptions+=$

" Set the tag file search order
set tags=./TAGS;

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys

" Set Shell
set shell=bash\ --login

if has("gui_running")
    " Display tabs and trailing spaces visually
    set list 
    set listchars=tab:›\ 
    set listchars+=trail:-
    set listchars+=extends:>
    set listchars+=precedes:<
    set listchars+=eol:¬
    "set listchars=tab:▶\ 
    "set listchars+=eol:★
    "set listchars+=trail:◥
    "set listchars+=extends:❯
    "set listchars+=precedes:❮ 

    " set tab labels to show at most 20 characters
    set guitablabel=%-0.20t%M

    " Start Fullscreen!
    set lines=999
    set columns=999
endif
