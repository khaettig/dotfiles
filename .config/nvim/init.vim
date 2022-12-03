source ~/.config/nvim/settings.vim
source ~/.config/nvim/install_plug.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/commands.vim
source ~/.config/nvim/file_type_settings.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/colors.vim
luafile ~/.config/nvim/colors.lua

if isdirectory("/home/kevin/.scripts/")
    source ~/.config/nvim/scripts.vim
endif
