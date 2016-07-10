#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation stuff
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
set -e
LOCATION=$(realpath $(dirname $0))

##################################################################
# Creates symlinks - Used in Installation files
##################################################################
function symlinkIt()
{
    local src=$(realpath "${1}")
    local dst=${2}
    local cdate=$(date +%Y-%m-%d_%H_%M)

    if [ -e "${dst}" ]; then
        echo "Backing up ${dst}"
        mkdir -p ${HOME}/dotfiles_backup/${cdate}

        if [ -L "${dst}" ]; then
            echo "Symlink, no need to back it up"
        else
            if [ -f "${dst}" ]; then
                cp -rf "${dst}" "${HOME}/dotfiles_backup/${cdate}$(basename ${dst} | tr '.' '_')"
            else
                cp -rf "${dst}" "${HOME}/dotfiles_backup/${cdate}$(basename ${dst} | tr '.' '_')"
            fi
        fi

        rm -rf ${dst}
    fi

    if [ -e "${src}" ]; then
        echo "Linking $(basename ${src})"
        ln -sf ${src} ${dst} || echo "Error Linking ${dst}"
    else
        echo "Could not find ${src}"
    fi
}

##################################################################
# The logic
##################################################################
# Create .config directory
if [ -e "${HOME}/.config" ]; then
    echo "Config dir exists!"
else
    mkdir -p ~/.config/
    echo "Creating ~/.config directory"
fi

echo "Linking Bash stuff"
symlinkIt ${LOCATION}/bash/bashrc ~/.bashrc
symlinkIt ${LOCATION}/bash/bash_profile ~/.bash_profile
symlinkIt ${LOCATION}/bash/aliases.sh ~/.aliases.sh
symlinkIt ${LOCATION}/bash/common.sh ~/.common.sh
echo ""

echo "Linking ZSH stuff"
symlinkIt ${LOCATION}/zsh/zshrc ~/.zshrc
echo ""

echo "Linking environment stuff into ${HOME}"
symlinkIt ${LOCATION}/ack/ackrc ~/.ackrc
symlinkIt ${LOCATION}/ctags/ctags ~/.ctags
symlinkIt ${LOCATION}/xserver/xserverrc ~/.xserverrc

mkdir -p ~/.config/xfce4/terminal/
symlinkIt ${LOCATION}/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
echo ""

echo "Linking GTK Stuff into ${HOME}"
symlinkIt ${LOCATION}/gtk/gtkrc-2.0 ~/.gtkrc-2.0
symlinkIt ${LOCATION}/gtk/gtk-3.0 ~/.config/gtk-3.0
symlinkIt ${LOCATION}/gtk/gtkrc.mine ~/.gtkrc.mine
symlinkIt ${LOCATION}/gtk/gtk-bookmarks ~/.gtk-bookmarks
echo ""

echo "Linking Git Stuff into ${HOME}"
symlinkIt ${LOCATION}/git/gitignore_global ~/.gitignore_global
symlinkIt ${LOCATION}/git/gitconfig ~/.gitconfig
symlinkIt ${LOCATION}/git/gitk ~/.gitk
echo ""

echo "Linking Vim Stuff into ${HOME}"
symlinkIt ${LOCATION}/vim ~/.vim
symlinkIt ${HOME}/.vim/vimrc ~/.vimrc
mkdir -p ${HOME}/.local/share/pixmaps/ && cp ${LOCATION}/vim/gvim.png ${HOME}/.local/share/pixmaps/gvim.png
mkdir -p ${HOME}/.local/share/icons/hicolor/256x256/apps && cp ${LOCATION}/vim/gvim.png ${HOME}/.local/share/icons/hicolor/256x256/apps/gvim.png
mkdir -p ${HOME}/.local/share/applications && cp ${LOCATION}/vim/gvim.desktop ${HOME}/.local/share/applications/gvim.desktop
echo ""

echo "Linking User Profile (openbox, i3, etc)"
symlinkIt ${LOCATION}/openbox/ ~/.config/openbox
symlinkIt ${LOCATION}/i3/ ~/.i3
echo ""

echo "Copy Custom Actions to Thunar"
[ -e "${HOME}/.config/Thunar/" ] && symlinkIt ${LOCATION}/thunar/uca.xml ${HOME}/.config/Thunar/uca.xml
echo ""

if [ -e "${HOME}/.kde/share/config/kresources/kxkbrc" ]; then
    echo "Change KDE keyboard to us (alt-intl) and CAPS key into ESC"
    cp ${LOCATION}/vim/kxkbrc ${HOME}/.kde/share/config/kresources/kxkbrc
    echo ""
fi

echo "Copying fonts to ${HOME}/.fonts"
mkdir -p ~/.fonts
cp ${LOCATION}/fonts/* ~/.fonts
fc-cache -vf ~/.fonts
echo ""
