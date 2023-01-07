# My Dotfiles

Hello Friend! You know kow this works..

## Overview

If you want to install my dotfiles, just run this:

```sh
git clone https://github.com/mpratt/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
make setup
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The directories are selfexplanatory, bash has bash configuration files, Vim has my vim setup, etc etc.

To uninstall you can run:

```sh
cd ~/.dotfiles
make uninstall
```

There is another script used to configure my arch setup. (Yeah, ARCH BTW..)
```sh
cd ~/.dotfiles
make environment
```
