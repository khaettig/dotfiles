#!/bin/bash

cd ~/.config/nvim/
if [[ -n "$TMUX" ]]; then
  nvim init.lua
else
  tmux new-session -A -s nvim nvim init.lua
fi
