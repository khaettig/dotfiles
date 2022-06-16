call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat' 
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'janko/vim-test'
Plug 'guns/xterm-color-table.vim'
Plug 'SirVer/ultisnips'
Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
Plug 'ThePrimeagen/refactoring.nvim'

" Python specific
Plug 'kalekseev/vim-coverage.py', {'do': ':UpdateRemotePlugins'}
Plug 'python-rope/ropevim',

" Javascript specific
Plug 'retorillo/istanbul.vim'

" Markdown specific
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" While working on colors
" Plug 'nvim-treesitter/playground'
" Plug 'ap/vim-css-color'
call plug#end()

source ~/.config/nvim/plugins/nerd_tree.vim
source ~/.config/nvim/plugins/git_gutter.vim
source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/vim_test.vim
source ~/.config/nvim/plugins/ultisnips.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/maximizer.vim
source ~/.config/nvim/plugins/completion.vim
luafile ~/.config/nvim/plugins/lsp.lua
luafile ~/.config/nvim/plugins/treesitter.lua
luafile ~/.config/nvim/plugins/treesitter-playground.lua
luafile ~/.config/nvim/plugins/refactoring.lua

source ~/.config/nvim/plugins/py_coverage.vim
source ~/.config/nvim/plugins/ropevim.vim

source ~/.config/nvim/plugins/js_coverage.vim

source ~/.config/nvim/plugins/vim_markdown.vim
