call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'neovim/nvim-lspconfig'
Plug 'neomake/neomake'
Plug 'nvim-lua/completion-nvim'
Plug 'janko/vim-test'
Plug 'guns/xterm-color-table.vim'
Plug 'SirVer/ultisnips'
Plug 'takac/vim-hardtime'
Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" Python specific
Plug 'kalekseev/vim-coverage.py', {'do': ':UpdateRemotePlugins'}

" Javascript specific
Plug 'ruanyl/coverage.vim'

" Markdown specific
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
call plug#end()

source ~/.config/nvim/init/plugins/nerd_tree.vim
source ~/.config/nvim/init/plugins/git_gutter.vim
source ~/.config/nvim/init/plugins/lightline.vim
source ~/.config/nvim/init/plugins/fugitive.vim
source ~/.config/nvim/init/plugins/dispatch.vim
source ~/.config/nvim/init/plugins/neomake.vim
source ~/.config/nvim/init/plugins/vim_test.vim
source ~/.config/nvim/init/plugins/ultisnips.vim
source ~/.config/nvim/init/plugins/fzf.vim
source ~/.config/nvim/init/plugins/vimspector.vim
source ~/.config/nvim/init/plugins/maximizer.vim
source ~/.config/nvim/init/plugins/completion.vim
luafile ~/.config/nvim/init/plugins/lsp.lua

source ~/.config/nvim/init/plugins/py_coverage.vim

source ~/.config/nvim/init/plugins/js_coverage.vim

source ~/.config/nvim/init/plugins/vim_markdown.vim
