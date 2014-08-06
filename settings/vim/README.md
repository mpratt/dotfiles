Vim
====

Welcome to my vim config! It is mostly managed via [Vundle](https://github.com/gmarik/vundle/).
It has a bunch of plugins and colorschemes.

As you can see the configuration is divided into different vim files that are later sourced inside the vimrc.

* plugins.vim     All the Bundle declarations and their configuration
* settings.vim    Global settings
* commands.vim    Mostly autocommand callings
* mappings.vim    My custom mappings
* vimrc           Bootstraps the whole thing and sets the colorscheme

![Screenshot](http://i.imgur.com/3oxUMER.png)

### Used Plugins/Colorschemes

* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [skammer/vim-css-color](https://github.com/skammer/vim-css-color)
* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [Valloric/YouCompleteMe](https://github.com/)
* [Glench/Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [goldfeld/vim-seek](https://github.com/goldfeld/vim-seek)
* [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
* [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
* [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
* [bling/vim-airline](https://github.com/vim/vim-airline)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [StanAngeloff/php.vim](https://github.com/StanAngeloff/php.vim)
* [shawncplus/phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim)
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
* [paradigm/TextObjectify](https://github.com/paradigm/TextObjectify)
* [honza/vim-snippets](https://github.com/honza/vim-snippets)
* Colorschemes
    - [nanotech/jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
    - [veloce/vim-aldmeris](https://github.com/veloce/vim-aldmeris)
    - [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

### Mappings

#### Custom Mappings

* Leader is mapped to <kbd>space</kbd>
* <kbd>Alt-Up|Down|Left|Right</kbd> Move between windows
* <kbd>Alt-o | Alt-i</kbd> Jump back/forward in the change list
* <kbd>C-Up | C-Down</kbd> Moves current line up/down
* <kbd>C-Right | C-Left</kbd> Move between buffers
* <kbd>C-Tab</kbd> Next Tab
* <kbd>C-Shift-Tab</kbd> Prev Tab
* <kbd>C-s</kbd> Save file
* <kbd>C-k</kbd> Delete a line
* <kbd>C-r</kbd> Visual mode replace
* <kbd>Leader-y</kbd> Yank to global register
* <kbd>Leader-p</kbd> Paste from global register
* <kbd>Leader-w</kbd> Write and close buffer
* <kbd>Leader-o</kbd> Add a new empty line after the current line
* <kbd>Leader-O</kbd> Add a new empty line before the current line
* <kbd>Leader-b</kbd> Go into insert mode between parenthesis
* <kbd>Leader-h</kbd> Disable search highlight
* <kbd>F9</kbd> Open a file explorer on the current folder
* <kbd>U (shift-u)</kbd> Undo
* <kbd>H/L</kbd> Go to start/Finish of the line
* <kbd>Enter</kbd> Replaces G. So it goes to the end of the file or to a line
* <kbd>Backspace</kbd> Goes to the start of a file

#### Other Mappings

Theese are plugin mappings that I should either memorize or have remapped

* UltiSnips
    * <kbd>C-e</kbd> Expand trigger
* Vim Expand Region
    * <kbd>v</kbd> Expands a region
    * <kbd>V</kbd> Shrinks a regio
* CtrlP
    * <kbd>C-f</kbd> When CtrlP is open, use this mapping to switch modes
* EasyMotion
    * <kbd>Leader-Leader-w</kbd> Word Motion
    * <kbd>Leader-Leader-f</kbd> Find char forward
    * <kbd>Leader-Leader-s</kbd> Find char backwards
* Emmet-Vim
    * <kbd>C-y-,</kbd> Expand emmet style shortcuts (on insert mode)
* Vim Surround
    * <kbd>cs"'</kbd> Converts surrounding double quotes into single qoutes
    * <kbd>cs'\<tag\></kbd> Converts surrounding single quotes into a tag
    * <kbd>cst"</kbd> Converts surrounding tags into double quotes
    * <kbd>ysiw]</kbd> Surrounds a word with brackets
    * <kbd>ys2aw"</kbd> Surrounds two words with double quotes
    * <kbd>Shift-V (select) S<tag></kbd> Surrounds the selection with a tag
* Vim Multiple Cursors
    * <kbd>C-n</kbd> Highlight current word and finds the next match
    * <kbd>C-p</kbd> Goes back
    * <kbd>C-x</kbd> Skips to the next match
