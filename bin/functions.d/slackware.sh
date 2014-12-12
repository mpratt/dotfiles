#!/bin/bash
##################################################################
#  This file defines behaviour for slackware linux bash
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
echo "   _____ __           __                          "
echo "  / ___// /___ ______/ /___      ______ _________ "
echo "  \__ \/ / __  / ___/ //_/ | /| / / __  / ___/ _\\"
echo " ___/ / / /_/ / /__/ ,<  | |/ |/ / /_/ / /  /  __/"
echo "/____/_/\__,_/\___/_/|_| |__/|__/\__,_/_/   \___/  $(awk '{print $2}' /etc/slackware-version)"

# Standard Slackware Scripts
for profile_script in /etc/profile.d/*.sh ; do
    if [ -x "${profile_script}" ]; then
        source ${profile_script}
    fi
done
unset profile_script

# Network Alias
alias sdhcpcd="sudo /sbin/dhcpcd"
alias sdhclient="sudo /sbin/dhclient"
alias sifconfig="sudo /sbin/ifconfig"
alias siwconfig="sudo /sbin/iwconfig"
alias siwlist="sudo /sbin/iwlist"
alias sshutdown="sudo /sbin/shutdown"

# Non-root Alias for Administration tools
if [ "$(whoami)" != "root" ]; then
    alias sbopkg="su -c sbopkg"
    alias slackpkg="su -c 'slackpkg update && slackpkg install-new && slackpkg upgrade-all'"
    alias halt="su -c halt"
    alias reboot="su -c reboot"
fi

# Add /usr/sbin to $PATH
PATH=${PATH}:/usr/sbin/
