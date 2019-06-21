#!/bin/bash

# Load X resources
#xrdb -load $HOME/.Xresources # This appears to be done automatically

{
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

# Run redshift
redshift-gtk &

# Run bluetooth manager
blueman-applet &

# Run local settings if there are any
if [ -f $HOME/.xinitrc.local ]; then
	. $HOME/.xinitrc.local
fi

# Tidy up any focus tracking scripts still running from a previous instance of
# i3
kill $(pgrep -f track-last-focused.sh)

# Run the window manager
exec i3
