Vim
====

Welcome to my vim config!
As you can see the configuration is divided into different vim files that are later sourced inside the vimrc.

* settings.vim (Global Settings)
* commands.vim (Autocommand calls)
* mappings.vim (Custom mappings)
* vimrc (Bootstraps the whole thing, installs Plugins, change some key behaviours and sets the Colorscheme)

### Used Plugins/Colorschemes

* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [honza/vim-snippets](https://github.com/honza/vim-snippets)
* [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
* [bling/vim-airline](https://github.com/bling/vim-airline)
* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [ap/vim-css-color](https://github.com/ap/vim-css-color)
* [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
* [2072/PHP-Indenting-for-VIm](https://github.com/2072/PHP-Indenting-for-VIm)
* [2072/vim-syntax-for-PHP](https://github.com/2072/vim-syntax-for-PHP)
* [blueyed/smarty.vim](https://github.com/blueyed/smarty.vim)
* Colorschemes:
    - [veloce/vim-aldmeris](https://github.com/veloce/vim-aldmeris)
    - [endel/vim-github-colorscheme](https://github.com/endel/vim-github-colorscheme)
    - [sjl/badwolf](https://github.com/sjl/badwolf)
    - [tomasr/molokai](https://github.com/tomasr/molokai)

### Mappings

#### Custom Mappings

* Leader is mapped to <kbd>space</kbd>
* <kbd>Alt-Up|Down|Left|Right</kbd> Move between windows
* <kbd>C-Right | C-Left</kbd> Move between TABS
* <kbd>C-Tab | C-Shift-Tab</kbd> Next Tab / Prev Tab
* <kbd>C-r</kbd> Visual mode replace
* <kbd>Leader-s</kbd> Save file
* <kbd>Leader-w</kbd> Write and close buffer
* <kbd>Leader-y</kbd> Yank to global register
* <kbd>Leader-p</kbd> Paste from global register
* <kbd>Leader-o</kbd> Add a new empty line after the current line
* <kbd>Leader-h</kbd> Disable search highlight
* <kbd>Leader-n</kbd> Use Relative Line Numbers
* <kbd>Leader-a</kbd> Sources the selection
* <kbd>Leader-b</kbd> Select entire buffer
* <kbd>Leader-dm</kbd> Deletes `^M` chars
* <kbd>Alt-p</kbd> Split lines (sister to [J]oin)
* <kbd>D/Y (shift-d/y)</kbd> Delete/Yank till the end of the line
* <kbd>H/L</kbd> Go to start/Finish of the line
* <kbd>U (shift-u)</kbd> Redo (since `u` undo's)
* <kbd>Enter</kbd> Replaces gg. So it goes to the start of that line
* <kbd>F9</kbd> Panic button

#### Other Plugin Mappings

Theese are plugin mappings that I should either memorize or have remapped:

* Unimpaired
    - <kbd>C-Up | C-Down</kbd> Moves current line up/down
* CtrlP
    - <kbd>C-p</kbd> Opens CtrlP Dialog
* NERDTree
    - <kbd>F4</kbd> Toggle NERDTree
* UltiSnips
    - <kbd>C-e</kbd> Expand trigger
* Vim Surround
    - <kbd>leader-r</kbd> Shortcut for surrounding a word
    - <kbd>cs"'</kbd> Converts surrounding double quotes into single qoutes
    - <kbd>cs'\<tag\></kbd> Converts surrounding single quotes into a tag
    - <kbd>cst"</kbd> Converts surrounding tags into double quotes
    - <kbd>ysiw]</kbd> Surrounds a word with brackets
    - <kbd>ys2aw"</kbd> Surrounds two words with double quotes
    - <kbd>Shift-V (select) S<tag></kbd> Surrounds the selection with a tag
* Custom Scripts
    - <kbd>Leader-js</kbd> (javascript) Beautify Javascript
    - <kbd>Leader-mb</kbd> (javascript & PHP) Debug word
