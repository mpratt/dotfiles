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

echo "Copying Bash Stuff into ${HOME}"
copyIt ${LOCATION}/bash/bashrc ~/.bashrc
copyIt ${LOCATION}/bash/bash_profile ~/.bash_profile
copyIt ${LOCATION}/bash/xserverrc ~/.xserverrc
copyIt ${LOCATION}/bash/ackrc ~/.ackrc
copyIt ${LOCATION}/bash/ctags ~/.ctags
copyIt ${LOCATION}/bash/inputrc ~/.inputrc
echo ""

echo "Copying GTK Stuff into ${HOME}"
copyIt ${LOCATION}/gtk/gtkrc-2.0 ~/.gtkrc-2.0
copyIt ${LOCATION}/gtk/gtk-3.0 ~/.config/gtk-3.0
copyIt ${LOCATION}/gtk/gtkrc.mine ~/.gtkrc.mine
copyIt ${LOCATION}/gtk/gtk-bookmarks ~/.gtk-bookmarks
echo ""

echo "Copying Git Stuff into ${HOME}"
copyIt ${LOCATION}/git/gitignore_global ~/.gitignore_global
copyIt ${LOCATION}/git/gitconfig ~/.gitconfig
copyIt ${LOCATION}/git/gitk ~/.gitk
echo ""

echo "Copying Vim Stuff into ${HOME}"
copyIt ${LOCATION}/vim/ ~/.vim/
symlinkIt ${HOME}/.vim/vimrc ~/.vimrc
echo ""

echo "Building User Profile (openbox, i3, etc)"
copyIt ${LOCATION}/openbox/ ~/.config/openbox
#[[ "$(whoami)" == "pratt" ]] && copyIt ${LOCATION}/thunderbird/ ~/.thunderbird/
#mkdir -p ${HOME}/.vagrant.d && copyIt ${LOCATION}/vagrant.d/ ~/.vagrant.d

copyIt ${LOCATION}/i3/ ~/.i3
symlinkIt ${HOME}/.i3/i3status.conf ~/.i3status.conf

[ -e "${HOME}/.config/Thunar/" ] && copyIt ${LOCATION}/thunar/uca.xml ${HOME}/.config/Thunar/uca.xml
mkdir -p ${HOME}/.local/share/pixmaps/ && copyIt ${LOCATION}/vim/gvim.png ${HOME}/.local/share/pixmaps/gvim.png
mkdir -p ${HOME}/.local/share/icons/hicolor/256x256/apps && copyIt ${LOCATION}/vim/gvim.png ${HOME}/.local/share/icons/hicolor/256x256/apps/gvim.png
mkdir -p ${HOME}/.local/share/applications && copyIt ${LOCATION}/vim/gvim.desktop ${HOME}/.local/share/applications/gvim.desktop

if [ -e "${HOME}/.kde/share/config/kresources/kxkbrc" ]; then
    echo "Change KDE keyboard to us (alt-intl) and CAPS key into ESC"
    copyIt ${LOCATION}/vim/kxkbrc ${HOME}/.kde/share/config/kresources/kxkbrc
fi

if [ -w "/usr/share/fonts/TTF/" ] && [ -z "$(ls /usr/share/fonts/TTF/ | egrep -i 'CONSOLA|MONACO')" ]; then
    echo ""
    echo "Copying fonts to /usr/share/fonts/TTF/"
    cp ${LOCATION}/fonts/*.TTF /usr/share/fonts/TTF/
    cp ${LOCATION}/fonts/*.ttf /usr/share/fonts/TTF/
    fc-cache -vf
else
    echo "Custom fonts already installed! Or you have no permissions to install fonts"
fi

# Modify some /etc stuff
if [ -w "/etc/" ]; then
    echo ""
    [ -f "/etc/inetd.conf" ] && echo "Comment all inetd.conf services" && sed -i 's/^#//g;s/^/#/g' /etc/inetd.conf

    exists=0
    getent passwd $1 >/dev/null 2>&1 && exists=1
    if [ "${exists}" -eq 1 ] && [ -z "$(grep 'pratt' /etc/sudoers)" ]; then
        echo "Edditing Sudoers file"
        if [ -f "/etc/sudoers.tmp" ]; then
            echo "/etc/sudoers.tmp exists, cannot edit sudoers"
            exit 1
        fi

        touch /etc/sudoers.tmp
        echo "pratt ALL=NOPASSWD:/sbin/iwconfig,/sbin/iwlist,/sbin/ifconfig, /sbin/shutdown,/sbin/dhclient,/sbin/dhcpcd" >> /tmp/sudoers.new
        visudo -c -f /tmp/sudoers.new
        if [ "$?" -eq "0" ]; then
            cp /tmp/sudoers.new /etc/sudoers
        fi
        rm /etc/sudoers.tmp
    fi

    if [ -e "/etc/slackware-version" ]; then

        echo "Modify hosts.allow/hosts.deny for more security"
        copyIt ${LOCATION}/hosts/hosts.allow /etc/hosts.allow
        copyIt ${LOCATION}/hosts/hosts.deny /etc/hosts.deny

        echo "Modifying httpd.conf to allow userdir_module"
        sed -i 's:#Include /etc/httpd/extra/httpd-userdir.conf:Include /etc/httpd/extra/httpd-userdir.conf:' /etc/httpd/httpd.conf
        sed -i 's:#Include /etc/httpd/mod_php.conf:Include /etc/httpd/mod_php.conf:' /etc/httpd/httpd.conf

        if [ -f "/usr/lib64/httpd/modules/mod_userdir.so" ]; then
            sed -i 's:#LoadModule userdir_module lib64/httpd/modules/mod_userdir.so:LoadModule userdir_module lib64/httpd/modules/mod_userdir.so:' /etc/httpd/httpd.conf
            sed -i 's:#LoadModule rewrite_module lib64/httpd/modules/mod_rewrite.so:LoadModule rewrite_module lib64/httpd/modules/mod_rewrite.so:' /etc/httpd/httpd.conf
        elif [ -f "/usr/lib/httpd/modules/mod_userdir.so" ]; then
            sed -i 's:#LoadModule userdir_module lib/httpd/modules/mod_userdir.so:LoadModule userdir_module lib/httpd/modules/mod_userdir.so:' /etc/httpd/httpd.conf
            sed -i 's:#LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so:LoadModule rewrite_module lib/httpd/modules/mod_rewrite.so:' /etc/httpd/httpd.conf
        fi

        if [ -z "$(grep 'index.php' /etc/httpd/httpd.conf)" ]; then
            sed -i 's:DirectoryIndex index.html:DirectoryIndex index.html index.php:' /etc/httpd/httpd.conf
        fi

        if [ -z "$(grep 'ServerSignature' /etc/httpd/httpd.conf)" ]; then
            echo -e "ServerSignature Off" >> /etc/httpd/httpd.conf
            echo -e "ServerTokens Prod" >> /etc/httpd/httpd.conf
        fi
    fi

    if [ -z "$(grep '9c20bd82-1f3d-416e-b524-380172cd6959' /etc/fstab)" ]; then
        echo "Writing mount data into fstab"
        mkdir -p /mnt/{share,storage,backup}
        echo "# SAMSUNG M3 External Drive" >> /etc/fstab
        echo "/dev/disk/by-uuid/108639C48639AB5C                      /mnt/share   ntfs   defaults,user,rw,umask=000,exec,comment=x-gvfs-show  0   0" >> /etc/fstab
        echo "/dev/disk/by-uuid/9c20bd82-1f3d-416e-b524-380172cd6959  /mnt/storage ext4   defaults,user,exec,comment=x-gvfs-show            0   0" >> /etc/fstab
        echo "/dev/disk/by-uuid/4baf3ce6-d77e-4da9-903c-fec952096f70  /mnt/backup  ext4   defaults,user,exec,comment=x-gvfs-show            0   0" >> /etc/fstab
    fi
else
    echo "You Cannot write into /etc/"
fi
