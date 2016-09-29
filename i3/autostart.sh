#!/bin/bash
# i3 Autostart command

wallpaper --use-previous --use-random &
setxkbmap -layout us -variant intl &
sleep 2
xmodmap ~/.xmodmap &
sleep 2
nm-applet &
xfce4-power-manager &
