" Install plug.vim if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'benmills/vimux'
Plug 'janko/vim-test'
Plug 'dense-analysis/ale'

" Deoplete and depenencies
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Python specific
Plug 'python-rope/ropevim', {'for': 'python'}
Plug 'mgedmin/coverage-highlight.vim', {'for': 'python'}
call plug#end()

" Remap hjkl to neo2 keys
noremap i h
noremap a j
noremap l k
noremap e l

" Remap overwritten keys
noremap h n
noremap n i
noremap j a
noremap ä e 

" Use arrow keys for split navigation
noremap <Up> <C-w><Up>
noremap <Down> <C-w><Down> 
noremap <Left> <C-w><Left>
noremap <Right> <C-w><Right>
inoremap <Up> <C-w><Right>
inoremap <Down> <C-w><Down>
inoremap <Left> <C-w><Left>
inoremap <Right> <C-w><Right>

" Shortcuts
nnoremap <silent> <F3> :sp $MYVIMRC<CR>
nnoremap <silent> <F4> :source $MYVIMRC<CR>:PlugUpdate<CR>
nnoremap <silent> <F5> :wa<CR>:call VimuxRunCommand("runapp")<CR>
nnoremap <silent> <F6> :wa<CR>:call VimuxRunCommand("rununittests")<CR>
nnoremap <silent> <F7> :wa<CR>:call VimuxRunCommand("rune2etests")<CR>
map <silent> <C-y> :NERDTreeToggle<CR>
noremap <C-l> <C-y>
noremap <C-a> <C-E>
map <silent> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO<ESC>

" Vim Settings
syntax on
color ron
let mapleader = ","
set clipboard=unnamedplus
set splitright
set splitbelow
set number relativenumber
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/
highlight clear SignColumn

" Plugin Settings
let test#strategy = "vimux"
let g:EasyMotion_keys='abcdefghijklmopqrstuvwxyzäöü'
let g:gitgutter_map_keys = 0

let g:ale_linters = {'python': ['pylint', 'pyls']}
let g:ale_fixers = {'python': 'autopep8'}
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:deoplete#enable_at_startup = 1

let g:ropevim_guess_project=1

" Mappings for EasyMotion
map ö <Plug>(easymotion-prefix)

" Mappings for fugitive
let g:nremap = {'a': '', 'i': ''}
let g:xremap = {'a': '', 'i': ''}
let g:oremap = {'a': '', 'i': ''}

" Mappings for vim-test
noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>

" Mappings for ALE
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-f> :ALEFix<CR>
nmap <silent> <leader>x :ALEFindReferences<CR>
nmap <silent> <leader>d :w<CR>:ALEGoToDefinition<CR>

" Indentations
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd FileType python setlocal ts=4 sw=4 expandtab

set autoindent
set smartindent

" Minimize/Restore tmux height from within vim (to inspect failed tests)
let g:tmuxRunnerMaxed = 0
function! ToggleTmux()
   if g:tmuxRunnerMaxed
     silent execute "!tmux resize-pane -t 1 -y 10"
     let g:tmuxRunnerMaxed = 0
   else
     silent execute "!tmux resize-pane -t 0 -y 2"
     let g:tmuxRunnerMaxed = 1
   endif
endfunction

noremap <silent> <leader>m :call ToggleTmux()<CR>
