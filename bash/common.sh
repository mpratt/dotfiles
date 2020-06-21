# Michael Pratt
# $HOME/.common.sh

# Define some options
if [ -x "$(command -v nvim)" ]; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

# Append custom PATH
if [ -e "${HOME}/.dotfiles/bin" ]; then
    PATH=${PATH}:${HOME}/.dotfiles/bin
    for p in $(find ${HOME}/.dotfiles/bin -type d); do
        PATH="${PATH}:${p}"
    done
fi

[ -e "${HOME}/.bin" ] && PATH=${PATH}:${HOME}/.bin
[ -e "${HOME}/.config/composer/vendor/bin" ] && PATH=${PATH}:${HOME}/.config/composer/vendor/bin
[ -x "$(command -v npm)" ] && mkdir -p "${HOME}/.config/npm-packages" && npm config set prefix "${HOME}/.config/npm-packages" && PATH=${PATH}:${HOME}/.config/npm-packages/bin

# Allow root to use DISPLAY
xhost + &> /dev/null
