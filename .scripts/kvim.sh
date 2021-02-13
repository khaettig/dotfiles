#!/bin/bash

# curl -sSL https://raw.githubusercontent.com/khaettig/dotfiles/master/.scripts/kvim.sh | sh

if [ ! -f ~/.local/bin/nvim ]; then
  echo "Downloading neovim"
  mkdir -p ~/.local/bin
  curl -sSL https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o ~/.local/bin/nvim
fi

if [ ! -f ~/.config/kinit.vim ]; then
  echo "Downloading init.vim"
  mkdir -p ~/.config
  curl -sSL https://raw.githubusercontent.com/khaettig/dotfiles/master/.config/nvim/init.vim -o ~/.config/kinit.vim
fi

chmod +x ~/.local/bin/nvim
~/.local/bin/nvim -S ~/.config/kinit.vim
