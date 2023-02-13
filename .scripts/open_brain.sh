#!/bin/bash

cd ~/WorkNotes/Brain
if [[ -n "$TMUX" ]]; then
  nvim
else
  tmux new-session -A -s brain nvim main.md
fi
