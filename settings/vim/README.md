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

* [Vundle.vim](https://github.com/gmarik/Vundle.vim)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-css-color](https://github.com/skammer/vim-css-color)
* [vim-expand-region](https://github.com/terryma/vim-expand-region)
* [unite.vim](https://github.com/Shougo/unite.vim)
* [neomru.vim](https://github.com/Shougo/neomru.vim)
* [vimproc.vim](https://github.com/Shougo/vimproc.vim)
* [Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
* [ultisnips](https://github.com/SirVer/ultisnips)
* [vim-snippets](https://github.com/honza/vim-snippets)
* [vim-sneak](https://github.com/justinmk/vim-sneak)
* [vim-airline](https://github.com/bling/vim-airline)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [TextObjectify](https://github.com/paradigm/TextObjectify)
* [php.vim](https://github.com/StanAngeloff/php.vim)
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim)
* [vim-startify](https://github.com/mhinz/vim-startify)
* [goyo.vim](https://github.com/junegunn/goyo.vim)
* [vim-ps1](https://github.com/Hackworth/vim-ps1)
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* Colorschemes
    - [jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
    - [vim-aldmeris](https://github.com/veloce/vim-aldmeris)
    - [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

### Mappings

#### Custom Mappings

* Leader is mapped to <kbd>space</kbd>
* <kbd>Alt-Up|Down|Left|Right</kbd> Move between windows
* <kbd>C-Right | C-Left</kbd> Move between buffers
* <kbd>C-Tab</kbd> Next Tab
* <kbd>C-Shift-Tab</kbd> Prev Tab
* <kbd>C-Up | C-Down</kbd> Moves current line up/down
* <kbd>Alt-i | Alt-a</kbd> In Insert Mode (Go to start/end of the line)
* <kbd>C-k</kbd> Delete a line
* <kbd>C-r</kbd> Visual mode replace
* <kbd>Leader-s</kbd> Save file
* <kbd>Leader-w</kbd> Write and close buffer
* <kbd>Leader-y</kbd> Yank to global register
* <kbd>Leader-p</kbd> Paste from global register
* <kbd>Leader-o</kbd> Add a new empty line after the current line
* <kbd>Leader-O</kbd> Add a new empty line before the current line
* <kbd>Leader-b</kbd> Go into insert mode between parenthesis
* <kbd>Leader-h</kbd> Disable search highlight
* <kbd>Leader-n</kbd> Toggle line numbers
* <kbd>Leader--</kbd> Toggle Invisible chars
* <kbd>Leader-ev</kbd> Edits .vimrc
* <kbd>Leader-a</kbd> Sources the selection
* <kbd>Leader-l</kbd> Toggle spell
* <kbd>Leader-ls</kbd> Use spanish for spellchecking
* <kbd>Leader-le</kbd> Use english for spellchecking
* <kbd>Leader-dm</kbd> Deletes `^M` chars
* <kbd>D/Y (shift-d/y)</kbd> Delete/Yank till the end of the line
* <kbd>H/L</kbd> Go to start/Finish of the line
* <kbd>U (shift-u)</kbd> Redo (since `u` undo's)
* <kbd>S (shift-s)</kbd> Split lines (sister to [J]oin)
* <kbd>v-aa</kbd> Select whole buffer
* <kbd>F9</kbd> Panic button
* <kbd>Enter</kbd> Replaces G. So it goes to the end of the file or to a line
* <kbd>Backspace</kbd> Goes to the start of a file

#### Other Mappings

Theese are plugin mappings that I should either memorize or have remapped

* UltiSnips
    * <kbd>C-e</kbd> Expand trigger
* Vim Expand Region
    * <kbd>v</kbd> Expands a region
    * <kbd>V</kbd> Shrinks a regio
* Unite.vim
    * <kbd>C-p</kbd> Open files just like CtrlP
    * <kbd>C-l</kbd> Search MRU
    * <kbd>leader-/</kbd> Search Content
    * <kbd>leader-ys</kbd> Search Yank history
    * <kbd>leader-bs</kbd> Search buffer
    * <kbd>leader-es</kbd> Search Everything
* Emmet-Vim
    * <kbd>C-y-,</kbd> Expand emmet style shortcuts (on insert mode)
* Vim Surround
    * <kbd>leader-r</kbd> Shortcut for surrounding a word
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
* You Complete Me
    * <kbd>C-Space</kbd> Toggle full list
* Goyo.vim
    * <kbd>leader-g</kbd> Toggle Goyo Mode
