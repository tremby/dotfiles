#!/bin/bash

# Load X resources
#xrdb -load $HOME/.Xresources # This appears to be done automatically

{
	# Set keymap, compose key, and make caps lock another control key
	#setxkbmap gb dvorak compose:ralt ctrl:nocaps # For regular keyboards
	setxkbmap us -option compose:ralt # For Keyboardio Model 01

	# Set mouse speed
	xset m 17/10 17/10

	# Set keyboard repeat rate
	xset r rate 300 25 2>/dev/null

	# Switch off X screensaver
	xset s off

	# Put the pointer in the top right corner
	xte "mousemove 7680 0" # xte is found in xautomation package
} &

# Hide the mouse pointer
# Use https://github.com/Airblader/unclutter-xfixes rather than the original.
# Ensure it isn't starting twice -- if the original unclutter is installed it
# may be running automatically at startup due to /etc/X11/Xsession.d/90unclutter
unclutter --idle 3 --root &

# Run music player notifier
mpn &

# Run redshift
redshift-gtk &

# Run snapcast client
snapclient --host $MPD_HOST --soundcard pulse &

# Run local settings if there are any
if [ -f $HOME/.xinitrc.local ]; then
	. $HOME/.xinitrc.local
fi

# Run the window manager
exec i3
