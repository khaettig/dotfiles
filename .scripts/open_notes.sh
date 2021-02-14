#!/bin/bash

cd ~/Notes
if [[ -n "$TMUX" ]]; then
  nvim -o Incoming.md System/NextActions.md
else
  tmux new-session -A -s notes nvim -o Incoming.md System/NextActions.md
fi
