#!/bin/sh

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xdefaults ] && xrdb ~/.Xdefaults
# [ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xset r rate 200 50 & # Faster repeat on keyboard
sxhkd & # Set hotkeys
dunst & # For notifications
xcompmgr & # For transparency
setxkbmap -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' & # Set Caps to Mod/Escape
xmodmap -e 'keycode 135 = Super_R' & # Properties button extra Mod/Escape
[ -f ~/.scripts/dwmbar ] && ~/.scripts/dwmbar &

# wm=$(dialog --title "Which WM do you want to use?" --menu "Please select a WM" 0 0 2 "classic" "i3" "new" "dwm")
while :; do
    xwallpaper --zoom ~/.config/wall.png
    ssh-agent dwm || break
done

# exec i3

