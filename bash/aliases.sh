# Michael Pratt <pratt@hablarmierda.net>
# $HOME/.aliases.sh

# Easier directory change
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Get current external ip
#alias getip="dig +short myip.opendns.com @resolver1.opendns.com"
alias getip="curl -s http://wtfismyip.com/text"

# Overwrite common commands
alias phpunit="phpunit --verbose"
alias cat="cat -v" # Cat show-nonprinting
alias diff='colordiff -u'

# Color Aliases
alias ls="ls --color=auto"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip --color=auto"

# Serve current directory
alias serve-php="php -S localhost:8000"
alias serve-python="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

# Custom aliases
alias :q="exit"
alias ll="ls -l --color=auto"
alias lsoctal="stat -c '%a %n'"
alias nocomment="grep -Ev '^\s*(#|//|$)'"
alias screenoff="xset dpms force off"
alias regrep="egrep -R -iH -n --color=auto"
alias ducks="du -cks * | sort -rn | head -11" #
alias voyeur="lsof -i -P +c 0 +M"
alias tulpan="netstat -tulpan"
alias ddos='hping3 -c 10000 -d 120 -S -w 64 -p 21 --flood --rand-source'
alias calculate='calc'
alias clock="while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done"
alias cdp=". cdp"

# Vim/Nvim
if [ -x "$(command -v nvim)" ]; then
    alias gvim="gnvim --disable-ext-cmdline"
    alias vim="nvim"
fi
