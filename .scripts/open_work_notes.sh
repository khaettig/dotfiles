#!/bin/bash

cd ~/WorkNotes
if [[ -n "$TMUX" ]]; then
  nvim Incoming.md -c "sp NextProject.md" -c "vsp NextActions.md" -c "execute \"normal! \<C-W>L\"" -c "execute \"normal! \<C-W>h\""
else
  tmux new-session -A -s work nvim Incoming.md -c "sp NextProject.md" -c "vsp NextActions.md" -c "execute \"normal! \<C-W>L\"" -c "execute \"normal! \<C-W>h\""
fi
