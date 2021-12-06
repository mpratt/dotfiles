#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation stuff
##################################################################
set -e
for folder in $(find -maxdepth 1 -type d -printf "%f\n" -not -path '\.'); do
    echo "Uninstalling ${folder}"
    stow -D --dotfiles ${folder}
done

fc-cache -vf ~/.fonts
