# Michael Pratt <pratt@hablarmierda.net>
# $HOME/.common.sh

# Append custom PATH
[ -e "${HOME}/.bin" ] && PATH=${PATH}:${HOME}/.bin
[ -e "${HOME}/.dotfiles/bin" ] && PATH=${PATH}:${HOME}/.dotfiles/bin

# Allow root to use DISPLAY
xhost + &> /dev/null
