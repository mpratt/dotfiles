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

![Screenshot](http://i.imgur.com/om9ayHi.png)

### Used Plugins/Colorschemes

* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [skammer/vim-css-color](https://github.com/skammer/vim-css-color)
* [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [Valloric/YouCompleteMe](https://github.com/)
* [Glench/Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [goldfeld/vim-seek](https://github.com/goldfeld/vim-seek)
* [tpope/vim-ragtag](https://github.com/tpope/vim-ragtag)
* [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
* [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
* [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
* [Lokaltog/powerline](https://github.com/Lokaltog/powerline)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [StanAngeloff/php.vim](https://github.com/StanAngeloff/php.vim)
* [shawncplus/phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim)
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
* [paradigm/TextObjectify](https://github.com/paradigm/TextObjectify)
* Colorschemes
    - [nanotech/jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
    - [veloce/vim-aldmeris](https://github.com/veloce/vim-aldmeris)
    - [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)


### Mappings

#### Custom Mappings

* Leader is mapped to <kbd>,</kbd>
* <kbd>C-Up</kbd> Moves current line up
* <kbd>C-Down</kbd> Moves current line down
* <kbd>C-Right | C-Left</kbd> Move between buffers
* <kbd>U (shift-u)</kbd> Undo
* <kbd>Alt-Up|Down|Left|Right</kbd> Move between windows
* <kbd>C-Tab</kbd> Next Tab
* <kbd>C-Shift-Tab</kbd> Prev Tab
* <kbd>C-k</kbd> Delete a line
* <kbd>C-s</kbd> Save file
* <kbd>Leader-]</kbd> Open tag in new tab
* <kbd>Leader-y</kbd> Yank to global register
* <kbd>Leader-p</kbd> Paste from global register
* <kbd>Leader-w</kbd> Write and close buffer
* <kbd>Leader-/</kbd> Disable search highlight
* <kbd>C-r</kbd> Visual mode replace
* <kbd>Alt-o</kbd> Jump back in the change list
* <kbd>Alt-i</kbd> Jump forward in the change list
* <kbd>H/L</kbd> Go to start/Finish of the line
* <kbd>Leader-o</kbd> Add a new empty line after the current line
* <kbd>Leader-O</kbd> Add a new empty line before the current line
* <kbd>F9</kbd> Open a file explorer on the current folder
* <kbd>Leader-b</kbd> Go into insert mode between parenthesis

#### Other Mappings

Theese are mappings that I should memorize...

* RagTag
    * <kbd>CTRL-X-/</kbd> Close the last open HTML tag
    * <kbd>CTRL-X-SPACE</kbd> Create open/close HTML tags from the typed word
    * <kbd>CTRL-X-CR</kbd> The same as CTRL+X SPACE but puts a newspace in between
    * <kbd>CTRL-X-!</kbd> Insert HTML doctype
    * <kbd>CTRL-X-@</kbd> Insert CSS stylesheet
    * <kbd>CTRL-X-#</kbd> Insert meta content-type meta tag
    * <kbd>CTRL-X-$</kbd> Load JavaScript document
