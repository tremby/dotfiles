#!/bin/bash

if ! tmux has-session -t audio; then
	tmux \
		new-session -d -x 96 -y 114 -A -s audio -n music ncmpcpp\;\
		set-option -t audio:music -p remain-on-exit on\;\
		new-window -d -n volume "ssh -t hoard TERM=xterm-256color node src/snapmixer/index.js"\;\
		set-option -t audio:volume -p remain-on-exit on\;\
		join-pane -p 28 -s audio:volume -t audio:music\;\
		select-pane -t 0
fi

i3-sensible-terminal -c audio -- tmux new-session -A -s audio
