#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation scripts for
#  different types of stuff.
#  Michael Pratt <pratt@hablarmierda.net>
##################################################################
set -e
LOCATION=$(realpath $(dirname $0))

# Source function Files
source bin/functions.d/functions.sh

# Copy /bin
copyIt ${LOCATION}/bin/ ${HOME}/.bin/

# Install the Environment
sh settings/install.sh ${LOCATION}

# Install Slackware stuff
sh slackware/install.sh ${LOCATION}
