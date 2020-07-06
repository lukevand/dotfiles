#!/bin/sh
! pgrep redshift >/dev/null && redshift >/dev/null 2>&1 &

# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -d -r

# setxkbmap -layout us -variant colemak
setxkbmap -layout us
xrdb ~/.config/Xresources
# setxkbmap -layout us
xmodmap ~/.config/xmodmap
# space2control.sh
xset r rate 300 50
xset s 600 600
compton --backend glx --glx-no-stencil --daemon
dunst &
# fcitx-autostart &
~/git/slstatus/slstatus &
# st &
sxhkd -m 1 &
unclutter --timeout 8 --ignore-scrolling --fork --jitter 1

while true; do
	~/git/dwm/dwm
done
