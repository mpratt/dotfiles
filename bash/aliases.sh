# Michael Pratt <pratt@hablarmierda.net>
# $HOME/.shells.custom

# Define some options
export GREP_OPTIONS="--color=auto"
export EDITOR="vim"
export VISUAL="vim"

# Easier directory change
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Other alias
alias :q="exit"
alias lsoctal="stat -c '%a %n'"
alias nocomment="grep -Ev '^\s*(#|//|$)'"
alias screenoff="xset dpms force off"
alias phpunit="phpunit --verbose"
alias phpcheck="find ./ -iname \*.php | xargs -n 1 php -l"
alias servephp="php -S localhost:8000"
alias servepython="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias regrep="egrep -R -iH -n"
alias getip="curl -s http://wtfismyip.com/text"
alias gvim="gvim --remote-tab-silent"

# Append custom PATH
[ -e "${HOME}/.bin" ] && PATH=${PATH}:${HOME}/.bin
[ -e "${HOME}/dotfiles/.bin" ] && PATH=${PATH}:${HOME}/dotfiles/.bin

# Allow root to use DISPLAY
xhost +
