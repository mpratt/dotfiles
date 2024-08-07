#!/bin/bash
##################################################################
#  This scripts uninstalls everything
##################################################################
set -e
cd ~/.dotfiles

remove_symlink()
{
    local target="${1}"
    if [ -L "${target}" ]; then
        rm -rf "${target}"
    fi
}

echo "Removing Thunar custom actions"
remove_symlink "${HOME}/.config/Thunar/uca.xml"

echo "Removing Vifm configuration"
remove_symlink "${HOME}/.config/vifm/vifmrc"

echo "Removing Alacritty configuration"
remove_symlink "${HOME}/.config/alacritty/alacritty.toml"

echo "Removing starship configuration"
remove_symlink "${HOME}/.config/starship.toml"

echo "Removing Tmux configuration"
remove_symlink "${HOME}/.config/tmux"

echo "Removing XDG users dirs configuration"
remove_symlink "${HOME}/.config/user-dirs.dirs"

echo "Removing Bash configuration"
remove_symlink "${HOME}/.bashrc"
remove_symlink "${HOME}/.bash_profile"

echo "Removing Git configuration"
remove_symlink "${HOME}/.gitconfig"
remove_symlink "${HOME}/.gitignore_global"
remove_symlink "${HOME}/.gitk"

echo "Removing Nvim/Vim stuff"
remove_symlink "${HOME}/.config/nvim"
remove_symlink "${HOME}/.vim"

echo "Removing font Dir..."
remove_symlink "${HOME}/.fonts"

echo "Removing Dolphin custom actions"
remove_symlink "${HOME}/.local/share/kservices5/ServiceMenus/jpg-to-png.desktop"
remove_symlink "${HOME}/.local/share/kservices5/ServiceMenus/png-to-jpg.desktop"
remove_symlink "${HOME}/.local/share/kservices5/ServiceMenus/media-info.desktop"

echo "Removing SSH configuration"
remove_symlink "${HOME}/.ssh/config.d"
sed -i 's#Include ~/.ssh/config.d/\*##g' "${HOME}/.ssh/config"
