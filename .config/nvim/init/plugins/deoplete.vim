let g:deoplete#enable_at_startup = 1

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
