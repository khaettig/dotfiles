#!/bin/sh
tmux new-session -d -s prog "nvim"
 
tmux new-window -t prog:9 -n 'notes' 'cd ~/Work/Notes && nvim Incoming.md'
 
tmux select-window -t prog:1
tmux -2 attach-session -t prog
