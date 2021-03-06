#!/usr/bin/env bash

PROJECT_DIR="$HOME/Code/Self/Lua/LuaCourse"
SESSION_NAME="Lua"
WINDOW_NAME="nvim"

TMUX_SESSIONS=`tmux list-sessions | grep $SESSION_NAME -c`

if [[ "$TMUX_SESSIONS" == "0" ]]; then
    tmux start-server
    tmux new-session -s $SESSION_NAME -n $WINDOW_NAME -c $PROJECT_DIR \; \
        attach-session -t . -c $PROJECT_DIR \; \
        send-keys "cd $PROJECT_DIR && nvim" C-m \; \
        split-window -v -p 25 -c $PROJECT_DIR \; \
        send-keys 'clear && git fetch --all' C-m \; \
        split-window -h -p 50 -c $PROJECT_DIR \; \
        send-keys 'clear && npm run dev' C-m \; \
        select-pane -t 0
else
    tmux attach -t $SESSION_NAME
fi
