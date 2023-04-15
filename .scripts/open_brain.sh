#!/bin/bash

cd ~/WorkNotes/Brain
if [[ -n "$TMUX" ]]; then
  nvim main.md
else
  tmux new-session -A -s brain nvim main.md
fi
