tnoremap <Esc> <C-\><C-n>
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

nnoremap <silent> <leader>ff :Gg %:t -- ':!*.po'<CR><CR>

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

nnoremap <silent> <leader>b :lua require"dap".toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require"dap".set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>

" Python
autocmd FileType python nnoremap <buffer> <leader>s ^Ofrom unittest import skip<CR>@skip  # TODO(kh)<ESC>
autocmd FileType python nnoremap <buffer> <leader>rf :!black %<CR>

autocmd FileType python nnoremap <buffer> <Leader>dn :lua require("dap-python").test_method()<CR>
autocmd FileType python nnoremap <buffer> <Leader>df :lua require("dap-python").test_class()<CR>
autocmd FileType python vnoremap <buffer> <Leader>ds <ESC>:lua require("dap-python").debug_selection()<CR>

" Javascript
autocmd FileType javascript nnoremap <buffer> <leader>tn :lua require"jester".run()<CR>
autocmd FileType javascript nnoremap <buffer> <leader>tf :lua require"jester".run_file()<CR>
autocmd FileType javascript nnoremap <buffer> <leader>tl :lua require"jester".run_last()<CR>
autocmd FileType javascript nnoremap <buffer> <leader>dn :lua require"jester".debug()<CR>
autocmd FileType javascript nnoremap <buffer> <leader>df :lua require"jester".debug_file()<CR>
autocmd FileType javascript nnoremap <buffer> <leader>dl :lua require"jester".debug_last()<CR>

" Markdown
autocmd FileType markdown nnoremap <silent> <buffer> <enter> :GoToLink<CR>
autocmd FileType markdown nnoremap <silent> <buffer> <leader><enter> :AddTodoistTodo<CR>
autocmd FileType markdown nnoremap <silent> <buffer> ✔ A ✔<ESC>
