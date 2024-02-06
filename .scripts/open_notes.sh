#!/bin/bash

cd ~/Notes
if [[ -n "$TMUX" ]]; then
  nvim Incoming.md -c "vsp System/ProjectList.md" -c "sp System/NextActions.md" -c "execute \"normal! \<C-W>h\"" -c "sp System/Review_Daily.md" -c "execute \"normal! \<C-W>k\""
else
  tmux new-session -A -s notes nvim Incoming.md -c "vsp System/ProjectList.md" -c "sp System/NextActions.md" -c "execute \"normal! \<C-W>h\"" -c "sp System/Review_Daily.md" -c "execute \"normal! \<C-W>k\""
fi
