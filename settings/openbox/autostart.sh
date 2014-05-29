#!/bin/bash
# This shell script is run before Openbox launches.

# Allow transparencies for tint2
if which xcompmgr >/dev/null 2>&1; then
    sleep 2
    xcompmgr &
fi

# Change your keymap:
setxkbmap -layout "us" -variant "intl"

# Map the caps-lock key to Escape button
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Setup the wallpaper
wallpaper --use-previous --use-random &


# Start some apps
nm-applet &
xfce4-power-manager &
volti &
tint2 -c /home/pratt/.config/openbox/tint2rc
