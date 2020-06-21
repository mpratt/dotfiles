#!/bin/bash
##################################################################
#  This scripts removes the installation of the dotfiles
##################################################################
set -e

##################################################################
# Creates symlinks - Used in Installation files
##################################################################
function removeSymlink()
{
    local dst=${1}
    local cdate=$(date +%Y-%m-%d_%H_%M)

    if [ -e "${dst}" ]; then
        echo "Removing up ${dst}"
        mkdir -p ${HOME}/dotfiles_backup/${cdate}
        cp -r "${dst}" "${HOME}/dotfiles_backup/${cdate}/$(basename ${dst})"
        if [ -L "${dst}" ]; then
            rm -rf ${dst}
        fi
    fi
}

##################################################################
# The logic
##################################################################
echo "Removing Bash/Zsh stuff"
removeSymlink ~/.bashrc
removeSymlink ~/.bash_profile
removeSymlink ~/.aliases.sh
removeSymlink ~/.common.sh
removeSymlink ~/.zshrc
echo ""

echo "Removing environment stuff (ack/ctags/xserverrc/terminalrc)"
removeSymlink ~/.ackrc
removeSymlink ~/.ctags
removeSymlink ~/.xserverrc
removeSymlink ~/.config/xfce4/terminal/terminalrc

echo "Removing GTK Stuff"
removeSymlink ~/.gtkrc-2.0
removeSymlink ~/.config/gtk-3.0
removeSymlink ~/.gtkrc.mine
echo ""

echo "Removing Git Stuff"
removeSymlink ~/.gitignore_global
removeSymlink ~/.gitconfig
removeSymlink ~/.gitk
echo ""

echo "Removing Vim/Nvim/Terminal Stuff"
removeSymlink ~/.config/alacritty
removeSymlink ~/.vim
removeSymlink ~/.vimrc
removeSymlink ~/.config/vifm/vifmrc
removeSymlink ~/.config/nvim
rm -rf ${HOME}/.local/share/pixmaps/gvim.png
rm -rf ${HOME}/.local/share/icons/hicolor/256x256/apps/gvim.png
rm -rf ${HOME}/.local/share/applications/gvim.desktop
echo ""

echo "Removing User Profile Stuff (openbox, i3, gmrun etc)"
removeSymlink ~/.config/openbox
removeSymlink ~/.gmrunrc
removeSymlink ~/.xmodmap
removeSymlink ~/.i3
removeSymlink ${HOME}/.config/Thunar/uca.xml
removeSymlink ~/.config/user-dirs.dirs
echo ""
