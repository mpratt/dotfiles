#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation stuff
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
if ! [ -e "${HOME}/.config" ]; then
    echo "Creating ~/.config directory"
    mkdir -p ~/.config/
fi

echo "Linking Bash stuff"
symlinkIt ${LOCATION}/bash/bashrc ~/.bashrc
symlinkIt ${LOCATION}/bash/bash_profile ~/.bash_profile
echo ""

echo "Linking GTK Stuff into ${HOME}"
symlinkIt ${LOCATION}/gtk/gtkrc-2.0 ~/.gtkrc-2.0
symlinkIt ${LOCATION}/gtk/gtk-3.0 ~/.config/gtk-3.0
symlinkIt ${LOCATION}/gtk/gtkrc.mine ~/.gtkrc.mine
echo ""

echo "Linking Git Stuff into ${HOME}"
symlinkIt ${LOCATION}/git/gitignore_global ~/.gitignore_global
symlinkIt ${LOCATION}/git/gitconfig ~/.gitconfig
symlinkIt ${LOCATION}/git/gitk ~/.gitk
echo ""

echo "Linking Vim/Neovim/Terminal Stuff into ${HOME}"
symlinkIt ${LOCATION}/alacritty ~/.config/alacritty
symlinkIt ${LOCATION}/vim ~/.vim
symlinkIt ${LOCATION}/nvim ~/.config/nvim
mkdir -p ${HOME}/.config/vifm/ && symlinkIt ${LOCATION}/vifm/vifmrc ~/.config/vifm/vifmrc
echo ""

if [ -e "${HOME}/.config/Thunar/" ]; then
    echo "Copy Custom Actions/Shortcuts to Thunar"
    symlinkIt ${LOCATION}/thunar/uca.xml ${HOME}/.config/Thunar/uca.xml
    symlinkIt ${LOCATION}/thunar/accels.scm ${HOME}/.config/Thunar/accels.scm
    echo ""
fi

echo "Setting up Default XDG Home folders"
symlinkIt ${LOCATION}/xdg/user-dirs.dirs ~/.config/user-dirs.dirs

NOTUSEDDIRECTORIES=('Music' 'Templates')
for i in ${NOTUSEDDIRECTORIES[@]}; do
    DP="${HOME}/${i}"
    if [ -e "${DP}" ]; then
        if [ ! "$(ls -A ${DP})" ]; then
            echo "Deleting empty directory ${DP}"
            rm -rf ${DP}
        else
            echo "${DP} is not empty! Lets leave it there"
        fi
    fi
done

CREATEDIRECTORIES=('Audio' 'Documents' 'Templates' 'Downloads' 'Pictures' 'Projects' 'Public' 'Videos')
for i in ${CREATEDIRECTORIES[@]}; do
    DP="${HOME}/${i}"
    if ! [ -e "${DP}" ]; then
        echo "Creating ${DP}"
        mkdir -p ${DP}
    else
        echo "${DP} already exists"
    fi
done

echo "Copying file templates into ~/Templates"
cp -r ${LOCATION}/templates/* ${HOME}/Templates

echo "Copying fonts to ${HOME}/.fonts"
mkdir -p ~/.fonts
cp ${LOCATION}/fonts/* ~/.fonts
fc-cache -vf ~/.fonts
echo ""
