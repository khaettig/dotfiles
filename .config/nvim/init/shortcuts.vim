nnoremap <silent> <F3> :sp $MYVIMRC<CR>
nnoremap <silent> <F4> :source $MYVIMRC<CR>:PlugUpdate<CR>:source $MYVIMRC<CR>
nnoremap <silent> <ESC><ESC> :noh<CR>

" Split navigation
noremap <S-Up> <C-w><Up>
noremap <S-Down> <C-w><Down>
noremap <S-Left> <C-w><Left>
noremap <S-Right> <C-w><Right>

" Quickfix
noremap ü :cprevious<CR>
noremap ö :cnext<CR>
noremap Ü :lprevious<CR>
noremap Ö :lnext<CR>

nnoremap <leader>ü :colder<CR>
nnoremap <leader>ö :cnewer<CR>
nnoremap <leader>Ü :lolder<CR>
nnoremap <leader>Ö :lnewer<CR>

nnoremap <silent> ä :call ToggleList("Quickfix List", "c", 15)<CR>
nnoremap <silent> <leader>ä :call ToggleList("Quickfix List", "c", 30)<CR>
nnoremap <silent> Ä :call ToggleList("Location List", "l", 15)<CR>
nnoremap <silent> <leader>Ä :call ToggleList("Location List", "l", 30)<CR>

nnoremap <leader>ä <C-w>_
nnoremap ¡ <C-w><Up><C-w>_
nnoremap ¿ <C-w><Down><C-w>_

" Python
autocmd FileType python nnoremap <buffer> <leader>b ^O__import__("pdb").set_trace()  # TODO<ESC>
autocmd FileType python nnoremap <buffer> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO<ESC>

" Markdown
autocmd FileType markdown nnoremap <buffer> <leader><CR> I~~<ESC>A~~<ESC>
