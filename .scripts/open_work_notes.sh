#!/bin/bash

cd ~/Work/Notes
if [[ -n "$TMUX" ]]; then
  nvim Incoming.md
else
  tmux new-session -A -s work nvim Incoming.md
fi
