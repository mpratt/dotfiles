# This shell script is run before Openbox launches.
CWD=$(dirname $0)

# Allow transparencies for tint2
#if which xcompmgr >/dev/null 2>&1; then
#    sleep 1
#    xcompmgr &
#fi

# Thunar Daemon
thunar --daemon &

# Change your keymap:
setxkbmap -layout "us" -variant "intl"

# Map the caps-lock key to Escape button
#setxkbmap -option caps:escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Setup the wallpaper
[ -e "${HOME}/.dotfiles/bin/wallpaper" ] && ${HOME}/.dotfiles/bin/wallpaper --use-previous --use-random

# Autorun x11vnc on adrastea
if [ -n "$(cat /etc/HOSTNAME | grep -i adrastea)" ] && [ -e "/usr/bin/x11vnc" ]; then
    x11vnc -usepw -bg -forever
fi

# Start some apps
tint2 -c "${CWD}/tint2rc" &
nm-applet &
xfce4-power-manager &
volumeicon &

