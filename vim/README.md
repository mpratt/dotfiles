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

* [gmarik/Vundle.vim](https://github.com/gmarik/Vundle.vim)
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [skammer/vim-css-color](https://github.com/skammer/vim-css-color)
* [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
* [Glench/Vim-Jinja2-Syntax](https://github.com/Glench/Vim-Jinja2-Syntax)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [honza/vim-snippets](https://github.com/honza/vim-snippets)
* [justinmk/vim-sneak](https://github.com/justinmk/vim-sneak)
* [bling/vim-airline](https://github.com/bling/vim-airline)
* [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [StanAngeloff/php.vim](https://github.com/StanAngeloff/php.vim)
* [nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [mattn/emmet-vim](https://github.com/mattn/emmet-vim)
* [PProvost/vim-ps1](https://github.com/PProvost/vim-ps1)
* Colorschemes
    - [veloce/vim-aldmeris](https://github.com/veloce/vim-aldmeris)
    - [endel/vim-github-colorscheme](https://github.com/endel/vim-github-colorscheme)
    - [nanotech/jellybeans.vim](https://github.com/nanotech/jellybeans.vim)
    - [sjl/badwolf](https://github.com/sjl/badwolf)
    - [tomasr/molokai](https://github.com/tomasr/molokai)
    - [shawncplus/phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim) (Not enabled)

### Mappings

#### Custom Mappings

* Leader is mapped to <kbd>space</kbd>
* <kbd>Alt-Up|Down|Left|Right</kbd> Move between windows
* <kbd>C-Right | C-Left</kbd> Move between buffers
* <kbd>C-Tab</kbd> Next Tab
* <kbd>C-Shift-Tab</kbd> Prev Tab
* <kbd>C-k</kbd> Delete a line
* <kbd>C-r</kbd> Visual mode replace
* <kbd>Leader-s</kbd> Save file
* <kbd>Leader-w</kbd> Write and close buffer
* <kbd>Leader-y</kbd> Yank to global register
* <kbd>Leader-p</kbd> Paste from global register
* <kbd>Leader-o</kbd> Add a new empty line after the current line
* <kbd>Leader-O</kbd> Add a new empty line before the current line
* <kbd>Leader-h</kbd> Disable search highlight
* <kbd>Leader-n</kbd> Toggle line numbers
* <kbd>Leader--</kbd> Toggle Invisible chars
* <kbd>Leader-ev</kbd> Edits .vimrc
* <kbd>Leader-a</kbd> Sources the selection
* <kbd>Leader-l;</kbd> Toggle spell
* <kbd>Leader-ls</kbd> Use spanish for spellchecking
* <kbd>Leader-le</kbd> Use english for spellchecking
* <kbd>Leader-dm</kbd> Deletes `^M` chars
* <kbd>Alt-p</kbd> Split lines (sister to [J]oin)
* <kbd>D/Y (shift-d/y)</kbd> Delete/Yank till the end of the line
* <kbd>H/L</kbd> Go to start/Finish of the line
* <kbd>U (shift-u)</kbd> Redo (since `u` undo's)
* <kbd>v-aa</kbd> Select whole buffer
* <kbd>F9</kbd> Panic button
* <kbd>Enter</kbd> Replaces G. So it goes to the end of the file or to a line
* <kbd>Backspace</kbd> Goes to the start of a file

#### Other Mappings

Theese are plugin mappings that I should either memorize or have remapped

* Unimpaired
    * <kbd>C-Up | C-Down</kbd> Moves current line up/down
* UltiSnips
    * <kbd>C-e</kbd> Expand trigger
* Vim Expand Region
    * <kbd>v</kbd> Expands a region
    * <kbd>V</kbd> Shrinks a regio
* Emmet-Vim
    * <kbd>C-Z-,</kbd> Expand emmet style shortcuts (on insert mode)
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
