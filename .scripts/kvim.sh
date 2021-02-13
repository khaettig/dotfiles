#!/bin/bash

if [ ! -f ~/.local/bin/nvim ]; then
  echo "Downloading neovim"
  mkdir -p ~/.local/bin
  curl https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output ~/.local/bin/nvim 
fi

if [ ! -f ~/.config/kinit.vim ]; then
  echo "Downloading init.vim"
  mkdir -p ~/.config
  curl https://raw.githubusercontent.com/khaettig/dotfiles/master/.config/nvim/init.vim --output ~/.config/kinit.vim 
fi

nvim -S ~/.config/kinit.vim
