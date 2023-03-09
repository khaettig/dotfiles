source ~/.config/nvim/settings.vim
source ~/.config/nvim/install_plug.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/functions.vim
luafile ~/.config/nvim/commands.lua
source ~/.config/nvim/file_type_settings.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/colors.vim
luafile ~/.config/nvim/colors.lua

if isdirectory("/home/kevin/.scripts/")
    source ~/.config/nvim/scripts.vim
endif
