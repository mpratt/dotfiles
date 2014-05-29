#!/bin/bash
###############################################
#  Install Slackware Packages
#  Michael Pratt <pratt@hablarmierda.net>
###############################################
set -e

# Utility function that checks if a package is present
function hasPkg()
{
    local pkg=${1}
    if [ -n $(ls "/var/log/packages/" | grep "${pkg}") ]; then
        echo "yay"
        return 0
    fi

    return 1
}

# Downloads a package
function downloadPkg()
{
    local name=${1}
    local url=${2}

    echo "Scrapping ${url}"
    html=$(curl -s "${url}")
    pkg=$(echo $html | egrep -o "\"${name}-([0-9\.a-z_]+)-${ARCH}" | sed 's/"//g' | uniq)

    if [ -z "${pkg}" ]; then
        echo "Invalid Package ${name}"
        return 1
    fi

    link=$(echo $html | egrep -o "${pkg}-([^\.]+)\.t.?z" | uniq)
    if ! hasPkg ${pkg}; then
        echo "Installing ${name} ${url}${link}"
        wget -c ${url}${link}
    else
        echo "${pkg}, Already installed ${link}"
    fi

    echo ""
}

if ! [ -e "/etc/slackware-version" ]; then
    echo "Not using Slackware"
    exit 0
fi

if [[ "$(whoami)" != "root" ]]; then
    echo "You are not root!"
    exit 0
fi

LOCATION=$(realpath $(dirname $0))
VERSION=$(cat /etc/slackware-version | egrep -o '[0-9\.]+')
if [[ "$(uname -m)" == "x86_64" ]]; then
    IS64="1"
    FOLDER="pkg64"
    ARCH="x86_64"
else
    IS64="0"
    FOLDER="pkg"
    ARCH="i486"
fi

echo "Building local SlackBuilds"
if ! hasPkg adminer; then
    echo "Building Adminer"
    cd ${CWD}/Slackbuilds/adminer/
    sh adminer.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Adminer"
fi

if ! hasPkg areao; then
    echo "Building Areao Icon theme"
    cd ${CWD}/Slackbuilds/areao-icon-theme/
    sh areao-icon-theme.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Areao Icon Theme"
fi

if ! hasPkg facebook-phpsh; then
    echo "Building Facebook PHPSH"
    cd ${CWD}/Slackbuilds/facebook-phpsh/
    sh facebook-phpsh.SlackBuild
    upgradepkg --install-new /tmp/*.t?z
else
    echo "Skipping Facebook PHPSH"
fi

# Download Packages
downloadPkg "vlc" "http://slackware.org.uk/people/alien/restricted_slackbuilds/vlc/$FOLDER/$VERSION/"
downloadPkg "ffmpeg" "http://slackware.org.uk/people/alien/restricted_slackbuilds/ffmpeg/$FOLDER/$VERSION/"
downloadPkg "openjdk" "http://www.slackware.com/~alien/slackbuilds/openjdk/$FOLDER/$VERSION/"
downloadPkg "icedtea-web" "http://www.slackware.com/~alien/slackbuilds/icedtea-web/$FOLDER/$VERSION/"
downloadPkg "chromium" "http://www.slackware.com/~alien/slackbuilds/chromium/$FOLDER/$VERSION/"
downloadPkg "chromium-pepperflash-plugin" "http://www.slackware.com/~alien/slackbuilds/chromium-pepperflash-plugin/$FOLDER/$VERSION/"
downloadPkg "wine" "http://www.slackware.com/~alien/slackbuilds/wine/$FOLDER/$VERSION/"
#downloadPkg "wine_gecko" "http://www.slackware.com/~alien/slackbuilds/wine_gecko/$FOLDER/$VERSION/"
downloadPkg "libreoffice" "http://www.slackware.com/~alien/slackbuilds/libreoffice/$FOLDER/$VERSION/"
downloadPkg "libreoffice-l10n-es" "http://www.slackware.com/~alien/slackbuilds/libreoffice/$FOLDER/$VERSION/"
downloadPkg "libreoffice-l10n-de" "http://www.slackware.com/~alien/slackbuilds/libreoffice/$FOLDER/$VERSION/"
downloadPkg "texlive" "http://rlworkman.net/pkgs/$VERSION/${ARCH}/"

# Avoid conflicts with texlive files
if [ -n "$(find /tmp/ -type f | grep texlive)" ]; then
    echo "Removing tetex and tetex-doc"
    removepkg tetex
    removepkg tetex-doc
fi

# Install all files
if [ -n "$(find /tmp/ -type f | egrep -i '\.t(g|x)z')" ]; then
    upgradepkg --install-new /tmp/*.t?z
fi

cd ${LOCATION}
echo "Installing Compiled pkgs"
upgradepkg --install-new ${LOCATION}/Compiled/*.t?z

SBOPKG=0
egrep -v '(^#|^$)' ${LOCATION}/Queue/Core.sqf | while read -r package; do
    if [ -z "$(ls /var/log/packages/ | grep -i ${package})" ]; then
        SBOPKG=1
        echo "${package} is not installed! - running sbopkg"
        sleep 5
        break
    fi
done

if [ ${SBOPKG} -gt 0 ]; then
    echo "Running Sbopkg - Copying Queue files"
    cp -r ${LOCATION}/Queue/*sqf /var/lib/sbopkg/queues/
    sbopkg -i Core.sqf
    sbopkg -i Desktop.sqf
    sbopkg -i Development.sqf
    sbopkg -i Internet.sqf
    sbopkg -i Media.sqf
    sbopkg -i Office.sqf
    sbopkg -i Security.sqf
    sbopkg -i Games.sqf

    if [ "${IS64}" -eq 0 ]; then
        echo "Installing 32 bit software"
        sbopkg -i 32Bit.sqf
    else
        sbopkg -i 64Bit.sqf
    fi
    echo "Cleaning /var/lib/sbopkg/queues/"
    rm -rf /var/lib/sbopkg/queues/*.sqf
else
    echo "No need to run sbopkg queues"
fi
