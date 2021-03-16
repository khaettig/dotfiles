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
Plug 'neomake/neomake'
Plug 'janko/vim-test'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'takac/vim-hardtime'
Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Deoplete and depenencies
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

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
source ~/.config/nvim/init/plugins/neomake.vim
source ~/.config/nvim/init/plugins/vim_test.vim
source ~/.config/nvim/init/plugins/ale.vim
source ~/.config/nvim/init/plugins/vimspector.vim

source ~/.config/nvim/init/plugins/deoplete.vim

source ~/.config/nvim/init/plugins/py_coverage.vim

source ~/.config/nvim/init/plugins/js_coverage.vim

source ~/.config/nvim/init/plugins/vim_markdown.vim