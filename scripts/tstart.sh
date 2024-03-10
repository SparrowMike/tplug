#!/usr/bin/env bash

session=$(pwd | awk -F/ '{print $NF}')

window=1
tmux rename-session "$session"
tmux rename-window -t "$session":"$window" "editor"
tmux send-keys -t "$session":"$window" 'nvim' C-m

shopt -s nullglob  

# sh_files=( *.sh )
# lua_files=( *.lua )
# tmux_files=( *.tmux )
#
# count_files=$(( ${#sh_files[@]} + ${#lua_files[@]} + ${#tmux_files[@]} ))
#
# --- alternative to above --- 
# count_files=$(find . -maxdepth 1 -type f \( -name "*.sh" -o -name "*.lua" -o -name "*.tmux" \) | wc -l)

js_files=( *.js )
ts_files=( *.ts )

count_files=$(( ${#js_files[@]} + ${#ts_files[@]} ))

if [ "$count_files" -gt 0 ]; then
    window=2
    tmux new-window -t "$session":"$window" -n 'terminal'
    tmux send-keys -t "$session":"$window" 'npm run dev' C-m
fi

tmux select-window -t "$session":"1"

exit 0
