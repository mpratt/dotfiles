#!/bin/bash
##################################################################
#  This scripts bootstraps all the installation stuff
##################################################################
set -e

backup()
{
    local dst=${1}
    local cdate=$(date +%Y-%m-%d_%H_%M)

    echo "Backing up ${dst}"
    mkdir -p ${HOME}/dotfiles_backup/${cdate}

    if [ -L "${dst}" ]; then
        echo "Symlink, no need to back it up"
    else
        if [ -f "${dst}" ]; then
            cp -rf "${dst}" "${HOME}/dotfiles_backup/${cdate}/$(basename ${dst} | tr '.' '_')"
        else
            cp -rf "${dst}" "${HOME}/dotfiles_backup/${cdate}/$(basename ${dst} | tr '.' '_')"
        fi
    fi
}

symlink()
{
    local src="${HOME}/.dotfiles/${1}"
    local dst=${2}

    if [ -e "${dst}" ]; then
        backup "${dst}"
        rm -rf "${dst}"
    fi

    if [ -e "${src}" ]; then
        echo "Linking $(basename ${src})"
        ln -sf ${src} ${dst} || echo "Error Linking ${dst}"
    else
        echo "Could not find ${src}"
    fi
}

copy_file()
{
    local src="${1}"
    local target="${2}"
    if [ -e "${target}" ]; then
        backup "${target}"
    fi

    cp "${HOME}/.dotfiles/${src}" "${target}"
}

cd "${HOME}/.dotfiles"
echo "Adding Thunar custom actions"
mkdir -p "${HOME}/.config/Thunar"
copy_file "thunar/uca.xml" "${HOME}/.config/Thunar/uca.xml"

echo "Adding Vifm configuration"
mkdir -p "${HOME}/.config/vifm"
symlink "vifm/vifmrc" "${HOME}/.config/vifm/vifmrc"

echo "Adding Alacritty configuration"
mkdir -p "${HOME}/.config/alacritty"
symlink "alacritty/alacritty.toml" "${HOME}/.config/alacritty/alacritty.toml"

echo "Adding starship configuration"
symlink "starship/starship.toml" "${HOME}/.config/starship.toml"

echo "Adding Tmux configuration"
symlink "tmux/tmux.conf" "${HOME}/.tmux.conf"

echo "Adding XDG users dirs configuration"
copy_file "xdg/user-dirs.dirs" "${HOME}/.config/user-dirs.dirs"

echo "Adding Bash configuration"
symlink "bash/bashrc" "${HOME}/.bashrc"
symlink "bash/bash_profile" "${HOME}/.bash_profile"

echo "Adding Git configuration"
symlink "git/gitconfig" "${HOME}/.gitconfig"
symlink "git/gitignore_global" "${HOME}/.gitignore_global"
symlink "git/gitk" "${HOME}/.gitk"
symlink "git/gitmessage" "${HOME}/.gitmessage"

echo "Adding vim/nvim configuration"
mkdir -p "${HOME}/.config/nvim"
mkdir -p "${HOME}/.vim"
symlink "nvim" "${HOME}/.config/nvim"
symlink "vim" "${HOME}/.vim"

echo "Adding home bin dir"
symlink "bin" "${HOME}/.bin"

echo "Adding Dolphin Actions"
mkdir -p "${HOME}/.local/share/kservices5/ServiceMenus"
symlink "dolphin/jpg-to-png.desktop" "${HOME}/.local/share/kservices5/ServiceMenus/jpg-to-png.desktop"
chmod +x "${HOME}/.local/share/kservices5/ServiceMenus/jpg-to-png.desktop"
symlink "dolphin/png-to-jpg.desktop" "${HOME}/.local/share/kservices5/ServiceMenus/png-to-jpg.desktop"
chmod +x "${HOME}/.local/share/kservices5/ServiceMenus/png-to-jpg.desktop"
symlink "dolphin/media-info.desktop" "${HOME}/.local/share/kservices5/ServiceMenus/media-info.desktop"
chmod +x "${HOME}/.local/share/kservices5/ServiceMenus/media-info.desktop"

echo "Adding SSH configuration"
mkdir -p "${HOME}/.ssh"
symlink "ssh/config.d" "${HOME}/.ssh/config.d"
if [[ -e "${HOME}/.ssh/config" && -z "$(grep 'Include ~/.ssh/config.d' ${HOME}/.ssh/config)" ]]; then
    echo -e "\nInclude ~/.ssh/config.d/*" >> "${HOME}/.ssh/config"
fi

echo "Running font cache..."
symlink "fonts" "${HOME}/.fonts"
fc-cache -vf ~/.fonts
