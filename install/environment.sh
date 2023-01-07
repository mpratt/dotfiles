#!/bin/bash
##################################################################
#  This scripts bootstraps all environment setup
##################################################################
set -e

if [[ "$(whoami)" == "root" ]]; then
    echo "Running as root is not recommended"
    exit 0
fi

# Install Yay
if ! [ -e "/usr/bin/yay" ]; then
    git clone https://aur.archlinux.org/yay.git ~/yay-tmp
    cd ~/yay-tmp
    makepkg -si
fi

yay -Syu
yay -S archlinux-keyring

LIST=$(grep -v '^$\|^\s*\#' "${HOME}/.dotfiles/env/arch_packages.list")
for pkg in ${LIST}; do
    echo "Installing: ${pkg}"
    yay -S  --noconfirm ${pkg}
    echo ""
done
