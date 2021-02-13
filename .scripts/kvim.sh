#!/bin/bash

if [ ! -f ~/.local/bin/nvim ]; then
  echo "Downloading neovim"
  wget -O ~/.local/bin/nvim https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
fi

if [ ! -f ~/.config/kinit.vim ]; then
  echo "Downloading init.vim"
  wget -O ~/.config/kinit.vim https://raw.githubusercontent.com/khaettig/dotfiles/master/.config/nvim/init.vim 
fi

nvim -S ~/.config/kinit.vim
