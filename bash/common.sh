# Michael Pratt <pratt@hablarmierda.net>
# $HOME/.common.sh

# Define some options
export EDITOR="vim"
export VISUAL="vim"

# Append custom PATH
if [ -e "${HOME}/.dotfiles/bin" ]; then
    PATH=${PATH}:${HOME}/.dotfiles/bin
    for p in $(find ${HOME}/.dotfiles/bin -type d); do
        PATH="${PATH}:${p}"
    done
fi

[ -e "${HOME}/.bin" ] && PATH=${PATH}:${HOME}/.bin
[ -e "${HOME}/.config/composer/vendor/bin" ] && PATH=${PATH}:${HOME}/.config/composer/vendor/bin

# Allow root to use DISPLAY
xhost + &> /dev/null
