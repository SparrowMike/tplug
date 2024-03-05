#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-hook -g session-created "run-shell '$CURRENT_DIR/scripts/tstart.sh'"
tmux bind-key N run-shell "$CURRENT_DIR/scripts/tstart.sh"

# session_id=$(tmux display -p '#{session_id}')
# if [ "${session_id#\$}" = "0" ]; then
#     source "$CURRENT_DIR/scripts/tstart.sh"
# fi
#
