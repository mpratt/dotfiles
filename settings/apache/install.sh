#!/bin/bash
##################################################################
#  Do Minor Apache configuration
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
set -e
LOCATION=$(realpath $(dirname $0))

if [[ "$(hostname)" != "parsiphae" ]]; then
    echo "Apache is configured only on parsiphae"
    exit 0
fi

# Source function files
if [ -n "${1}" ] && [ -e "${1}" ]; then
    source ${1}/bin/functions.d/functions.sh
else
    source ../../bin/functions.d/functions.sh
fi

# Install php related stuff
if [ -e "$(which phploc)" ]; then
    echo "PHP stuff already installed"
else
    echo "Installing PHP stuff"
    pear config-set auto_discover 1
    pear install pear.phpunit.de/PHPUnit
    pear install pear.phpunit.de/phploc
    pear install pear.phpunit.de/phpcpd
    pear install phpunit/PHPUnit_Selenium
    pear channel-discover pear.phpmd.org
    pear channel-discover pear.pdepend.org
    pear install --alldeps phpmd/PHP_PMD
    pear install pear.phpunit.de/phpdcd
    pear install doc.php.net/pman
fi
echo ""

# Modify /etc/ stuff
if [ -w "/etc/" ]; then
    HOSTFILE="/etc/hosts"
    if [ -z "$(grep '#dotfiles-script' ${HOSTFILE})" ]; then
        echo "Modifying /etc/hosts"
        echo -e "127.0.0.1\tlocalhost\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tparsiphae.localhost\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tparsiphae\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tvayausted.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.vayausted.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tmichael-pratt.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.michael-pratt.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tphpmyadmin.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.phpmyadmin.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tadminer.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.adminer.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tlab.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.lab.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\tclientes.loc\t#dotfiles-script" >> ${HOSTFILE}
        echo -e "127.0.0.1\twww.clientes.loc\t#dotfiles-script" >> ${HOSTFILE}
    else
        echo "${HOSTFILE} was already modified"
    fi

    echo "Copying httpd modules"
    cp ${LOCATION}/httpd-userdir.conf /etc/httpd/extra/
    cp ${LOCATION}/httpd-vhosts.conf /etc/httpd/extra/

    echo "Modifying httpd.conf"
    sed -i 's:#Include /etc/httpd/extra/httpd-vhosts.conf:Include /etc/httpd/extra/httpd-vhosts.conf:' /etc/httpd/httpd.conf
    sed -i 's:#Include /etc/httpd/extra/httpd-userdir.conf:Include /etc/httpd/extra/httpd-userdir.conf:' /etc/httpd/httpd.conf
    sed -i 's:#Include /etc/httpd/mod_php.conf:Include /etc/httpd/mod_php.conf:' /etc/httpd/httpd.conf

    if [ -z "$(grep 'index.php' /etc/httpd/httpd.conf)" ]; then
        sed -i 's:DirectoryIndex index.html:DirectoryIndex index.html index.php:' /etc/httpd/httpd.conf
    fi

    if [ -z "$(grep 'ServerSignature' /etc/httpd/httpd.conf)" ]; then
        echo -e "ServerSignature Off" >> /etc/httpd/httpd.conf
        echo -e "ServerTokens Prod" >> /etc/httpd/httpd.conf
    fi
else
    echo "You Cannot write into /etc/"
fi
