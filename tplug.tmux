#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-hook -g session-created "run-shell "$CURRENT_DIR/scripts/tstart.sh""
