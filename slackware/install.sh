#!/bin/bash
##################################################################
#  Install slackware stuff
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

if [ -e "/etc/slackware-version" ]; then
    echo "Slackware Detected"
    if [ -w "/etc/rc.d/" ]; then
        echo "Linking scripts to /etc/rc.d/"
        copyIt ${LOCATION}/config/rc.firewall /etc/rc.d/rc.firewall
        copyIt ${LOCATION}/config/rc.local /etc/rc.d/rc.local
        copyIt ${LOCATION}/config/rc.local_shutdown /etc/rc.d/rc.local_shutdown

        if [ -z "$(grep 'startup.mp4' /etc/rc.d/rc.S)" ]; then
            echo "Applying Bootsplash patch"
            cd /etc/rc.d/
            cp ${LOCATION}/config/bootsplash.patch /etc/rc.d/
            patch -p1 -N < bootsplash.patch
            rm -rf /etc/rc.d/bootsplash.patch
        fi

        if [ ! -e "/boot/video/startup.mp4" ]; then
            mkdir /boot/video/
            cp -r ${LOCATION}/config/video/bwtbm-startup.mp4 /boot/video/startup.mp4
        fi
    else
        echo "You dont have permission to write in /etc/rc.d/"
    fi


    if [[ $(whoami) == "root" ]]; then
        sh ${LOCATION}/packages/install.sh
    else
        echo "You dont have permision to install packages"
    fi

else
    echo "Not using slackware"
fi
