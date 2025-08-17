#!/bin/sh

if ! tmux has-session -t main; then
	tmux \
		new-session -d -x 96 -y 114 -A -s main -n misc\;\
		set-option -t main:misc -p remain-on-exit on\;\
		select-pane -t 0
fi

i3-sensible-terminal -c main -- tmux new-session -A -s main
