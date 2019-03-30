#!/usr/bin/env bash

# From Reddit user u/airblader, seen at
# https://www.reddit.com/r/i3wm/comments/4d4luc/how_to_focus_the_last_window/

last=

xprop -root -spy _NET_ACTIVE_WINDOW | while :
do
	read line

	[[ -z "$last" ]] || i3-msg "[id=$last] mark _last"
	last=$(echo "$line" | awk -F' ' '{printf $NF}')
done
