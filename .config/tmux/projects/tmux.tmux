#!/usr/bin/env bash

PROJECT_DIR="$HOME/.config/tmux"
SESSION_NAME="Tmux"
WINDOW_NAME="lvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && lvim" C-m \; \
        split-window -v -p 15 -c $PROJECT_DIR \; \
        send-keys 'clear' C-m \; \
        split-window -h -p 50 -c $PROJECT_DIR \; \
        send-keys 'clear' C-m \; \
        select-pane -t 0
else
    tmux attach -t $SESSION_NAME
fi
