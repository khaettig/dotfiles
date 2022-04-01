#!/bin/bash

cd ~/Notes
if [[ -n "$TMUX" ]]; then
  nvim Incoming.md -c "sp System/Review_Daily.md" -c "vsp System/NextActions.md" -c "execute \"normal! \<C-W>L\"" -c "execute \"normal! \<C-W>h\""
else
  tmux new-session -A -s notes nvim Incoming.md -c "sp System/Review_Daily.md" -c "vsp System/NextActions.md" -c "execute \"normal! \<C-W>L\"" -c "execute \"normal! \<C-W>h\""
fi
