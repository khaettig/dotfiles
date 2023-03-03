#!/bin/bash

cd ~/.config/nvim/
if [[ -n "$TMUX" ]]; then
  nvim init.vim
else
  tmux new-session -A -s nvim nvim init.vim
fi
