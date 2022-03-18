#!/bin/bash

cd ~/WorkNotes
if [[ -n "$TMUX" ]]; then
  nvim -o Incoming.md NextActions.md
else
  tmux new-session -A -s work nvim -O Incoming.md NextActions.md
fi
