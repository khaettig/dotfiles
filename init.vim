" Install plug.vim if not installed
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'benmills/vimux'
Plug 'janko/vim-test'
Plug 'dense-analysis/ale'
Plug 'takac/vim-hardtime'
Plug 'ThePrimeagen/vim-be-good'

" Deoplete and depenencies
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Python specific
Plug 'kalekseev/vim-coverage.py', {'for': 'python'}

" Javascript specific
Plug 'ruanyl/coverage.vim', {'for': 'javascript'}
call plug#end()

" Vim Settings
syntax on
color ron
let mapleader = " "
set clipboard=unnamedplus
set splitright
set splitbelow
set number relativenumber
set ignorecase
set smartcase
set encoding=utf-8
set viminfo=<800,:100,/50,'100,f1

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
nnoremap <silent> <F4> :PlugUpdate<CR>:source $MYVIMRC<CR>
nnoremap <silent> <F5> :wa<CR>:call VimuxRunCommand("runapp")<CR>
nnoremap <silent> <F6> :wa<CR>:call VimuxRunCommand("rununittests")<CR>
nnoremap <silent> <F7> :wa<CR>:call VimuxRunCommand("rune2etests")<CR>
nnoremap <silent> <leader>v :VimuxRunCommand("!!")<CR>
nnoremap <silent> <leader>m :VimuxRunCommand("exit")<CR>
map <silent> <C-y> :NERDTreeToggle<CR>
map <silent> <leader><C-y> :NERDTreeFind<CR>
noremap <C-l> <C-y>
noremap <C-a> <C-E>
nnoremap <silent> <leader>b ^Oimport pdb; pdb.set_trace()<ESC>
nnoremap <silent> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO<ESC>
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap <silent> <leader>j :%!python -m json.tool<CR>
nnoremap <silent> <leader>i :!isort %<CR>

" Plugin Settings
"" vim-test
let test#strategy = 'vimux'
let test#python#runner = 'djangotest'
" let test#javascript#karma#executable = 'frontend/node_modules/karma/bin/karma run'
let test#javascript#karma#file_pattern ='**/test_.*\.js'
"" vim-dispatch
let g:dispatch_no_tmux_make = 1
let g:EasyMotion_keys='abcdefghijklmopqrstuvwxyzäöü'
let g:EasyMotion_do_mapping = 0
highlight EasyMotionTarget ctermbg=none ctermfg=cyan
let g:gitgutter_map_keys = 0
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'
let g:coverage_json_report_path = '.coverage/coverage.json'
let g:list_of_normal_keys = ["l", "i", "a", "e"]
let g:list_of_visual_keys = ["l", "i", "a", "e"]

let g:ale_linters = {
\   'python': ['pylint', 'pyls'],
\   'javascript': ['eslint', 'tsserver']}
let g:ale_fixers = {
\   'python': ['black'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'html': ['html-beautify'],
\   'htmldjango': ['html-beautify'],
\   'css': ['prettier'],
\   'scss': ['prettier']}
let g:ale_json_fixjson_options = '-i 2'
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_html_beautify_options = '-s 2 -w 88'
let g:ale_fix_on_save = 1
let g:ale_hover_cursor = 0
let g:deoplete#enable_at_startup = 1
highlight ALEWarning ctermbg=52
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Mappings for EasyMotion
nmap f <Plug>(easymotion-s2)
xmap f <Plug>(easymotion-s2)
omap f <Plug>(easymotion-s2)

" Mappings for fugitive
let g:nremap = {'a': '', 'i': ''}
let g:xremap = {'a': '', 'i': ''}
let g:oremap = {'a': '', 'i': ''}
nmap <leader>ge :diffget //2<CR>
nmap <leader>gn :diffget //3<CR>
nmap <leader>gd :Gvdiffsplit!<CR>
nmap <leader>gf :let g:ale_fix_on_save = 0<CR>
nmap ßß :w<CR>:only<CR>:cnext<CR>:Gvdiffsplit!<CR>z.<CR>
nmap ßq :cnext<CR>
nmap ẞq :cprevious<CR>
nmap ßf /<<<<<<<\\|=======\\|>>>>>>><CR>

" Mappings for vim-test
noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>
noremap <Leader>ts :TestNearest -strategy=basic<CR>

" Mappings for ALE
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-f> :ALEFix<CR>
nmap <silent> <leader>r :ALERename<CR>
nmap <silent> <leader>x :ALEFindReferences<CR>
nmap <silent> <leader>d :w<CR>:ALEGoToDefinition<CR>

" Fix ALE preview window navigation
autocmd FileType ale-preview-selection silent! unmap <buffer> a
autocmd FileType ale-preview-selection silent! unmap <buffer> i

" Mappings for Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Indentations
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType htmldjango setlocal ts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType json setlocal ts=4 sw=4 expandtab
autocmd FileType python setlocal ts=4 sw=4 expandtab
autocmd FileType lua setlocal ts=4 sw=4 expandtab
autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd FileType markdown setlocal ts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=4 sw=4 expandtab

set autoindent
set smartindent

" GTD
autocmd BufNewFile */Projects/*.md 0r Templates/project.md

nmap <silent> <leader>c :CoveragePyToggle<CR>

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

noremap <silent> , :call ToggleTmux()<CR><C-w>=<CR>

augroup DisableMappings
    autocmd! VimEnter * :vunmap a%
augroup END
