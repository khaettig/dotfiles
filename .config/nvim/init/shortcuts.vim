" remap hjkl to neo2 keys
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

noremap ¡ <C-w><Up><C-w>_
noremap ¿ <C-w><Down><C-w>_

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
nnoremap <silent> <leader><CR> I~~<ESC>A~~<ESC>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader><C-p> :GBranches<CR>

nmap ü :cprevious<CR>
nmap ö :cnext<CR>
nmap Ü :lprevious<CR>
nmap Ö :lnext<CR>
nmap ßf /<<<<<<<\\|=======\\|>>>>>>><CR>

nnoremap <silent> ä :call ToggleList("Quickfix List", "c")<CR>
nnoremap <silent> Ä :call ToggleList("Location List", "l")<CR>
