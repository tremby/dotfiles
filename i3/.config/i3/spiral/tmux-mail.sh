#!/bin/sh

if ! tmux has-session -t mail; then
	tmux \
		new-session -d -x 96 -y 114 -A -s mail -n email neomutt\;\
		set-option -t mail:email -p remain-on-exit on\;\
		select-pane -t 0
fi

i3-sensible-terminal -c mail -- tmux new-session -A -s mail
