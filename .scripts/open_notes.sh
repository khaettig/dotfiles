#!/bin/bash

cd ~/Notes
if [[ -n "$TMUX" ]]; then
  nvim Incoming.md
else
  tmux new-session -A -s notes nvim Incoming.md
fi
