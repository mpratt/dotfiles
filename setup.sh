#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation stuff
##################################################################
set -e
cd ~/.dotfiles
for folder in $(find -maxdepth 1 -type d -printf "%f\n" ); do
    if [[ "${folder}" != ".git" ]] && [[ "${folder}" != "." ]]; then
        echo "Installing ${folder}"
        stow -D --dotfiles ${folder}
        stow --dotfiles ${folder}
    fi
done

fc-cache -vf ~/.fonts
