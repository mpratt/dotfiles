#!/bin/bash
##################################################################
#  Do Minor security stuff
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

# Network Manager rules
if [ -w "/etc/NetworkManager/dispatcher.d/" ]; then
    echo "Linking Network Manager Dispatcher"
    cp -r ${LOCATION}/nm/* /etc/NetworkManager/dispatcher.d/
    ls /etc/NetworkManager/dispatcher.d/*
else
    echo "Could not link Network Manager Security scripts"
fi

# Modify /etc/ stuff
if [ -w "/etc/" ]; then
    echo "Modify hosts.allow/hosts.deny"
    cp ${LOCATION}/hosts/hosts.allow /etc/hosts.allow
    cp ${LOCATION}/hosts/hosts.deny /etc/hosts.deny

    echo "Comment all inetd.conf services"
    sed -i 's/^#//g;s/^/#/g' /etc/inetd.conf

    if [ -z "$(grep 'pratt' /etc/sudoers)" ]; then
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
    else
        echo "Sudoers file already modified"
    fi
else
    echo "You Cannot write into /etc/"
fi
