let g:istanbul#jsonPath = ['.coverage/coverage.json', '.coverage/coverage-final.json']

autocmd FileType javascript nnoremap <buffer> <leader>c :IstanbulUpdate<CR>
