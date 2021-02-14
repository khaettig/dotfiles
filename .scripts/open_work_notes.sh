#!/bin/bash

cd ~/Work/Notes
if [[ -n "$TMUX" ]]; then
  nvim -o Incoming.md NextActions.md
else
  tmux new-session -A -s work nvim -o Incoming.md NextActions.md
fi
