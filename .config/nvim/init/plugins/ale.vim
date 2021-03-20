highlight ALEWarning ctermbg=52

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

nnoremap <leader>gf :let g:ale_fix_on_save = 0<CR>
nnoremap <silent> <C-n> <Plug>(ale_next_wrap)
nnoremap <silent> <C-f> :ALEFix<CR>
nnoremap <silent> <leader>r :ALERename<CR>
nnoremap <silent> <leader>x :ALEFindReferences<CR>
nnoremap <silent> <leader>d :w<CR>:ALEGoToDefinition<CR>
