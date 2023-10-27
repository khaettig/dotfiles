let test#strategy = 'basic'
let test#python#runner = 'pytest'

autocmd FileType python nnoremap <buffer> <Leader>tn :TestNearest<CR>
autocmd FileType python nnoremap <buffer> <Leader>tf :TestFile<CR>
autocmd FileType python nnoremap <buffer> <Leader>tl :TestLast<CR>
autocmd FileType python nnoremap <buffer> <Leader>ta :TestSuite<CR>
