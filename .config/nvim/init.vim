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
Plug 'puremourning/vimspector'
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
set exrc
set secure

" Remap hjkl to neo2 keys
noremap i h
noremap a j
noremap l k
noremap e l

" Remap overwritten keys
noremap h n
noremap n i
noremap j a
noremap k e 

" Use arrow keys for split navigation
noremap <Up> <C-w><Up>
noremap <Down> <C-w><Down>
noremap <Left> <C-w><Left>
noremap <Right> <C-w><Right>

" Shortcuts
nnoremap <silent> <F3> :sp $MYVIMRC<CR>
nnoremap <silent> <F4> :PlugUpdate<CR>:source $MYVIMRC<CR>
nnoremap <silent> <leader>v :VimuxRunCommand("!!")<CR>
nnoremap <silent> <leader>m :VimuxRunCommand("exit")<CR>
map <silent> <C-y> :NERDTreeToggle<CR>
map <silent> <leader><C-y> :NERDTreeFind<CR>
noremap <C-l> <C-y>
noremap <C-a> <C-E>
nnoremap <silent> <leader>b ^O__import__("pdb").set_trace()  # TODO<ESC>
nnoremap <silent> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO<ESC>
nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap <silent> <leader>j :%!python -m json.tool<CR>
nnoremap , '

" Plugin Settings
"" NERDTRee
let NERDTreeIgnore = ['__pycache__', '\.pyc$']
"" vim-test
let test#strategy = 'dispatch'
"" vim-dispatch
let g:dispatch_no_tmux_make = 1
let g:dispatch_compilers = {}
let g:dispatch_compilers['.venv/bin/'] = ''
let g:dispatch_compilers['python3 -m unittest'] = 'pyunit'
let g:dispatch_compilers['python3 manage.py test'] = 'pyunit'
let g:dispatch_compilers['karma'] = ''
let g:dispatch_compilers['./.karma'] = 'karma'
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
let g:ale_html_beautify_options = '-s 2 -w 88'
let g:ale_fix_on_save = 1
let g:ale_hover_cursor = 0
let g:deoplete#enable_at_startup = 1
highlight ALEWarning ctermbg=52
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Mappings for EasyMotion
nmap ſ <Plug>(easymotion-s2)
xmap ſ <Plug>(easymotion-s2)
omap ſ <Plug>(easymotion-s2)


" Mappings for fugitive
let g:nremap = {'a': '', 'i': ''}
let g:xremap = {'a': '', 'i': ''}
let g:oremap = {'a': '', 'i': ''}
nmap <leader>ge :diffget //2<CR>
nmap <leader>gn :diffget //3<CR>
nmap <leader>gd :Gvdiffsplit!<CR>
nmap <leader>gf :let g:ale_fix_on_save = 0<CR>
nmap ßß :w<CR>:only<CR>:cnext<CR>:Gvdiffsplit!<CR>z.<CR>
nmap ü :cprevious<CR>
nmap ö :cnext<CR>
nmap Ü :lprevious<CR>
nmap Ö :lnext<CR>
nmap ßf /<<<<<<<\\|=======\\|>>>>>>><CR>

" Mappings for vim-test
noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>
noremap <Leader>ts :TestSuite<CR>
noremap <Leader>td :TestNearest -strategy=basic<CR>

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

" Mappings for Vimspector
nnoremap <leader>il :call vimspector#Launch()<CR>
nnoremap <leader>ix :call vimspector#Reset()<CR>
nnoremap <leader>ib :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>is :call vimspector#StepInto()<CR>
nnoremap <leader>in :call vimspector#StepOver()<CR>
nnoremap <leader>io :call vimspector#StepOut()<CR>
nnoremap <leader>ic :call vimspector#Continue()<CR>
nnoremap <leader>ir :call vimspector#Restart()<CR>
nnoremap <leader>it :call vimspector#RunToCursor()<CR>

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

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nnoremap <silent> ä :call ToggleList("Quickfix List", "c")<CR>
nnoremap <silent> Ä :call ToggleList("Location List", "l")<CR>

augroup DisableMappings
    autocmd! VimEnter * :vunmap a%
augroup END

" Python scripts
:source ~/.scripts/js_rename.py
:command! -nargs=* JSRename :py3 js_rename(<f-args>) 

:source ~/.scripts/gtd.py
:command! Archive :py3 gtd_archive()
:command! Arc :py3 gtd_archive()
:command! Project :py3 gtd_project()
:command! Pro :py3 gtd_project()
:command! Someday :py3 gtd_someday()
:command! Som :py3 gtd_someday()
