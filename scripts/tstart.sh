#!/usr/bin/env bash

session=$(pwd | awk -F/ '{print $NF}')

window=1
tmux rename-session "$session"
tmux rename-window -t "$session":"$window" "editor"
tmux send-keys -t "$session":"$window" 'nvim' C-m

if [ "$session" != "tmux" ] && [ "$session" != "nvim" ]; then
    window=2
    tmux new-window -t "$session":"$window" -n 'terminal'
    tmux send-keys -t "$session":"$window" 'npm run dev' C-m
fi

tmux select-window -t "$session":"1"

exit 0

