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
alias gvim="gvim-single-instance"
alias diff='colordiff -u'

# Serve current directory
alias servephp="php -S localhost:8000"
alias servepython="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

# Other alias
alias :q="exit"
alias lsoctal="stat -c '%a %n'"
alias nocomment="grep -Ev '^\s*(#|//|$)'"
alias screenoff="xset dpms force off"
alias ytb2mp3="youtube-dl --extract-audio --audio-format mp3 --audio-quality 0"
alias regrep="egrep -R -iH -n"
alias ducks="du -cks * | sort -rn | head -11" #
alias voyeur="lsof -i -P +c 0 +M"
alias tulpan="netstat -tulpan"
alias ddos='hping3 -c 10000 -d 120 -S -w 64 -p 21 --flood --rand-source'
