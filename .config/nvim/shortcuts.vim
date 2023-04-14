nnoremap <silent> <F2> :e ~/.config/nvim/cheat_sheet.md<CR>
nnoremap <silent> <F4> :source $MYVIMRC<CR>:PlugUpdate<CR>:source $MYVIMRC<CR>
nnoremap <silent> <leader>no :noh<CR>

nnoremap <silent> <leader>qq :q<CR>
nnoremap <silent> <leader>qa :wqa<CR>
nnoremap <silent> <leader>ww :w<CR>
nnoremap <silent> <leader>wq :wq<CR>
nnoremap <silent> <leader>wa :wa<CR>

nmap <silent> <leader>to OTODO(kh): <ESC>gccA
nmap <silent> <leader>tO :Gg TODO(kh)<CR>

nnoremap <silent> <leader>tsf :FindTestsForFile<CR>
nnoremap <silent> <leader>tsq :SelectTestsFromQuickFixList<CR>

" Move lines
nnoremap <A-a> :m .+1<CR>==
nnoremap <A-l> :m .-2<CR>==
inoremap <A-a> <ESC>:m .+1<CR>==gi
inoremap <A-l> <ESC>:m .-2<CR>==gi
vnoremap <A-a> :m '>+1<CR>gv=gv
vnoremap <A-l> :m '<-2<CR>gv=gv

" Split navigation
noremap <S-Up> <C-w><Up>
noremap <S-Down> <C-w><Down>
noremap <S-Left> <C-w><Left>
noremap <S-Right> <C-w><Right>

" Quickfix
noremap ü :cprevious<CR>zz
noremap ö :cnext<CR>zz

nnoremap ν :CodeReviewPrevious<CR>
nnoremap τ :CodeReviewNext<CR>

nnoremap <leader>ü :colder<CR>
nnoremap <leader>ö :cnewer<CR>
nnoremap <leader>Ü :lolder<CR>
nnoremap <leader>Ö :lnewer<CR>

nnoremap <silent> ä :call ToggleList("Quickfix List", "c", 15)<CR>
nnoremap <silent> <leader>ä :call ToggleList("Quickfix List", "c", 30)<CR>
nnoremap <silent> Ä :call ToggleList("Location List", "l", 15)<CR>
nnoremap <silent> <leader>Ä :call ToggleList("Location List", "l", 30)<CR>

nnoremap ¡ <C-w><Up><C-w>_
nnoremap ¿ <C-w><Down><C-w>_

nnoremap <leader>A :%diffput<CR><C-w><Right>:%diffget<CR>:wqa<CR>

" Python
autocmd FileType python nnoremap <buffer> <leader>b ^O__import__("pdb").set_trace()  # TODO(kh)<ESC>
autocmd FileType python nnoremap <buffer> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO(kh)<ESC>

" Markdown
autocmd FileType markdown nnoremap <silent> <buffer> <enter> :GoToLink<CR>
