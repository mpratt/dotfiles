#!/bin/bash
# This shell script is run before Openbox launches.

# Change your keymap:
setxkbmap -layout "us" -variant "intl"

# Map the caps-lock key to Escape button
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Start some apps
tint2 -c ~/.config/openbox/tint2rc &
nm-applet &
xfce4-power-manager &
volti &
wallpaper --use-previous --use-random &
