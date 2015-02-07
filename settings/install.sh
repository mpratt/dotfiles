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

echo "Copying Environment Stuff into ${HOME}"
copyIt ${LOCATION}/env/shells.common ~/.shells.common
copyIt ${LOCATION}/env/bashrc ~/.bashrc
copyIt ${LOCATION}/env/zshrc ~/.zshrc
copyIt ${LOCATION}/env/bash_profile ~/.bash_profile
copyIt ${LOCATION}/env/xserverrc ~/.xserverrc
copyIt ${LOCATION}/env/ackrc ~/.ackrc
copyIt ${LOCATION}/env/ctags ~/.ctags
copyIt ${LOCATION}/env/inputrc ~/.inputrc
copyIt ${LOCATION}/env/terminalrc ~/.config/xfce4/terminal/terminalrc
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
copyIt ${LOCATION}/vim/ ~/.vim/ " --exclude bundle"
symlinkIt ${HOME}/.vim/vimrc ~/.vimrc
mkdir -p ${HOME}/.local/share/pixmaps/ && copyIt ${LOCATION}/vim/gvim.png ${HOME}/.local/share/pixmaps/gvim.png
mkdir -p ${HOME}/.local/share/icons/hicolor/256x256/apps && copyIt ${LOCATION}/vim/gvim.png ${HOME}/.local/share/icons/hicolor/256x256/apps/gvim.png
mkdir -p ${HOME}/.local/share/applications && copyIt ${LOCATION}/vim/gvim.desktop ${HOME}/.local/share/applications/gvim.desktop
if [ -e "${HOME}/.kde/share/config/kresources/kxkbrc" ]; then
    echo "Change KDE keyboard to us (alt-intl) and CAPS key into ESC for Vim"
    copyIt ${LOCATION}/vim/kxkbrc ${HOME}/.kde/share/config/kresources/kxkbrc
fi
echo ""

echo "Copying Window Manager Stuff (kde, openbox, i3, etc)"
copyIt ${LOCATION}/openbox/ ~/.config/openbox
copyIt ${LOCATION}/i3/ ~/.i3
symlinkIt ${HOME}/.i3/i3status.conf ~/.i3status.conf
[ -e "${HOME}/.config/Thunar/" ] && copyIt ${LOCATION}/thunar/uca.xml ${HOME}/.config/Thunar/uca.xml
echo ""

if [ -w "/etc/" ]; then
    echo "Modifying /etc stuff"
    [ -f "/etc/inetd.conf" ] && echo "Commenting all services in inetd.conf" && sed -i 's/^#//g;s/^/#/g' /etc/inetd.conf

    exists=0
    getent passwd $1 >/dev/null 2>&1 && exists=1
    if [ "${exists}" -eq 1 ] && [ -z "$(grep 'pratt' /etc/sudoers)" ]; then
        echo "Edditing Sudoers file"
        if [ -f "/etc/sudoers.tmp" ]; then
            echo "/etc/sudoers.tmp exists, cannot edit sudoers"
        else
            touch /etc/sudoers.tmp
            echo "pratt ALL=NOPASSWD:/sbin/iwconfig,/sbin/iwlist,/sbin/ifconfig, /sbin/shutdown,/sbin/dhclient,/sbin/dhcpcd" >> /tmp/sudoers.new
            visudo -c -f /tmp/sudoers.new
            if [ "$?" -eq "0" ]; then
                cp /tmp/sudoers.new /etc/sudoers
            fi
            rm /etc/sudoers.tmp
        fi
    fi

    if [ -e "/etc/slackware-version" ]; then
        echo "Modify hosts.allow/hosts.deny for more security"
        echo ""

        sed -i -e '/#dotfilesauto$/d' /etc/hosts.deny
        echo "Deny Access to all services in hosts.deny"
        echo -e "All: All #dotfilesauto" >> /etc/hosts.deny
        echo ""

        sed -i -e '/#dotfilesauto$/d' /etc/hosts.allow
        echo "Allowing sshd to 192.168.0.,10.42.0.,127.0.0.1"
        echo -e "sshd:192.168.0.,10.42.0.,127.0.0.1 #dotfilesauto" >> /etc/hosts.allow
        echo ""

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

    echo ""
    echo "Copying fonts to /usr/share/fonts/TTF/"
    cp ${LOCATION}/fonts/TTF/*.TTF /usr/share/fonts/TTF/
    cp ${LOCATION}/fonts/TTF/*.ttf /usr/share/fonts/TTF/
    cp ${LOCATION}/fonts/OTF/*.otf /usr/share/fonts/OTF/
    fc-cache -vf
else
    echo "You Cannot write into /etc/"
fi
