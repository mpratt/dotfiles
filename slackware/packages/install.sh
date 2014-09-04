#!/bin/bash
###############################################
#  Install Slackware Packages
#  Michael Pratt <pratt@hablarmierda.net>
###############################################
LOCATION=$(realpath $(dirname $0))
VERSION=$(cat /etc/slackware-version | egrep -o '[0-9\.]+')

if ! [ -e "/etc/slackware-version" ]; then
    echo "Not using Slackware"
    exit 0
fi

if [[ "$(whoami)" != "root" ]]; then
    echo "You are not root!"
    exit 0
fi

echo "Installing Compiled pkgs"
upgradepkg --install-new ${LOCATION}/Compiled/*.t?z
copyIt ${LOCATION}/Compiled/slackpkgplus.conf /etc/slackpkg/slackpkgplus.conf

echo "Using slackpkg/slackpkg+ to install alienbob stuff"
slackpkg update
slackpkg update gpg

if [[ "$(uname -m)" == "x86_64" ]]; then
    if [ -z "$(ls /var/log/packages/ | grep compat32)" ]; then
        slackpkg install multilib
    fi
fi

if [ -z "$(ls /var/log/packages/ | grep chromium)" ]; then
    slackpkg install chromium
fi

if [ -z "$(ls /var/log/packages/ | grep vlc)" ]; then
    slackpkg install vlc
fi

if [ -z "$(ls /var/log/packages/ | grep ffmpeg)" ]; then
    slackpkg install ffmpeg
fi

if [ -z "$(ls /var/log/packages/ | grep wine)" ]; then
    slackpkg install wine
fi

if [ -z "$(ls /var/log/packages/ | grep libreoffice)" ]; then
    slackpkg install libreoffice-l10n-es
    slackpkg install libreoffice-l10n-de
    slackpkg install libreoffice
fi

echo "Building local SlackBuilds"
if [ -z "$(ls /var/log/packages/ | grep adminer)" ]; then
    echo "Building Adminer"
    cd ${LOCATION}/Slackbuilds/adminer/
    sh adminer.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Adminer"
fi

if [ -z "$(ls /var/log/packages/ | grep areao)" ]; then
    echo "Building Areao Icon theme"
    cd ${LOCATION}/Slackbuilds/areao-icon-theme/
    sh areao-icon-theme.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Areao Icon Theme"
fi

if [ -z "$(ls /var/log/packages/ | grep phpsh)" ]; then
    echo "Building Facebook PHPSH"
    cd ${LOCATION}/Slackbuilds/facebook-phpsh/
    sh facebook-phpsh.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Facebook PHPSH"
fi

if [ -z "$(ls /var/log/packages/ | grep sbopkg)" ]; then
    echo "Running Sbopkg"
    sbopkg -r

    echo "Copying Queue files"
    mkdir -p /var/lib/sbopkg/queues/
    cp -r ${LOCATION}/Queue/*sqf /var/lib/sbopkg/queues/

    sbopkg -k -B -e continue -i Core.sqf
    sbopkg -k -B -e continue -i Desktop.sqf
    sbopkg -k -B -e continue -i Development.sqf
    sbopkg -k -B -e continue -i Internet.sqf
    sbopkg -k -B -e continue -i Media.sqf
    sbopkg -k -B -e continue -i Office.sqf
    sbopkg -k -B -e continue -i Security.sqf
    sbopkg -k -B -e continue -i Games.sqf

    if [[ "$(uname -m)" != "x86_64" ]] || [ -n "$(ls /var/log/packages/ | grep compat32)" ]; then
        sbopkg -k -B -e continue -i 32Bit.sqf
    fi

    if [[ "$(uname -m)" == "x86_64" ]]; then
        sbopkg -e continue -k -i 64Bit.sqf
    fi

    echo "Cleaning /var/lib/sbopkg/queues/"
    rm -rf /var/lib/sbopkg/queues/*.sqf
fi
