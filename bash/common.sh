# Michael Pratt <pratt@hablarmierda.net>
# $HOME/.common.sh

# Append custom PATH
[ -e "${HOME}/.bin" ] && PATH=${PATH}:${HOME}/.bin
[ -e "${HOME}/.dotfiles/bin" ] && PATH=${PATH}:${HOME}/.dotfiles/bin
[ -e "${HOME}/.composer/vendor/bin" ] && PATH=${PATH}:${HOME}/.composer/vendor/bin

# Allow root to use DISPLAY
xhost + &> /dev/null
