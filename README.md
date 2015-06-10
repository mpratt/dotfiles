My Dotfiles
===========

Hi there friend. These are my dot files and a script to install them on my system.
The bootstrap system was inspired by [Zack Holman's Dotfiles Repo](https://github.com/holman/dotfiles).

## Overview

If you want to install my dotfiles, just run this:

```sh
git clone https://github.com/mpratt/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash setup.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The directories are self explanatory, bash has bash configuration files, Vim has my vim setup, etc etc.
