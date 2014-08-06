#!/bin/bash
##################################################################
#  Install environment stuff
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
set -e
LOCATION=$(realpath $(dirname $0))

# Source function files
if [ -n "${1}" ] && [ -e "${1}" ]; then
    source ${1}/bin/functions.d/functions.sh
else
    source ../bin/functions.d/functions.sh
fi

# Create .config directory
if [ -e "${HOME}/.config" ]; then
    echo "Config dir exists!"
else
    mkdir ~/.config/
    echo "Creating ~/.config directory"
fi

echo "Linking Bash Stuff into ${HOME}"
symlinkIt ${LOCATION}/bash/bashrc ~/.bashrc
symlinkIt ${LOCATION}/bash/bash_profile ~/.bash_profile
symlinkIt ${LOCATION}/bash/xserverrc ~/.xserverrc
symlinkIt ${LOCATION}/bash/ackrc ~/.ackrc
symlinkIt ${LOCATION}/bash/ctags ~/.ctags
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

echo ""
if [[ "$(whoami)" == "pratt" ]]; then
    echo "Linking Vim Stuff into ${HOME}"
    symlinkIt ${LOCATION}/vim/ ~/.vim
    symlinkIt ${LOCATION}/vim/vimrc ~/.vimrc
    echo ""

    echo "Building Pratt's Profile (openbox, chromium, i3, ~/.local, thunderbird)"
    symlinkIt ${LOCATION}/openbox/ ~/.config/openbox
    symlinkIt ${LOCATION}/chromium/ ~/.config/chromium
    symlinkIt ${LOCATION}/thunderbird/ ~/.thunderbird
    symlinkIt ${LOCATION}/thunar/ ~/.config/Thunar
    symlinkIt ${LOCATION}/local/ ~/.local
    symlinkIt ${LOCATION}/i3/ ~/.i3
    symlinkIt ${LOCATION}/i3/i3status.conf ~/.i3status.conf
else
    echo "Copying Vim Stuff into ${HOME}"
    rm -rf ~/.vim && mkdir ~/.vim
    cp -r ${LOCATION}/vim/* ~/.vim
    symlinkIt ~/.vim/vimrc ~/.vimrc
    echo ""

    echo "You are not pratt"
fi

echo ""
if [ -w "/usr/share/fonts/TTF/" ] && [ -z "$(ls /usr/share/fonts/TTF/ | egrep -i 'CONSOLA|MONACO')" ]; then
    echo "Copying fonts to /usr/share/fonts/TTF/"
    cp ${LOCATION}/fonts/*.TTF /usr/share/fonts/TTF/
    cp ${LOCATION}/fonts/*.ttf /usr/share/fonts/TTF/
    fc-cache -vf
else
    echo "Custom fonts already installed!"
fi

# Creating Home Symlinks
if [ -e "/mnt/data/" ]; then
    echo ""
    echo "Creating Home Shortcuts (Archive, Documentos ....)"
    symlinkIt /mnt/data/Audio ~/Audio
    symlinkIt /mnt/data/Clientes ~/Clientes
    symlinkIt /mnt/data/Descargas ~/Descargas
    symlinkIt /mnt/data/Documentos ~/Documentos
    symlinkIt /mnt/data/Games ~/Games
    symlinkIt /mnt/data/Imagenes ~/Imagenes
    symlinkIt /mnt/data/Proyectos ~/Proyectos
    symlinkIt /mnt/data/Scripts ~/Scripts
    symlinkIt /mnt/data/Video ~/Video
    symlinkIt /mnt/data/Web ~/Web
    symlinkIt /mnt/data/Laboratorio ~/Laboratorio
fi
echo ""
