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

nmap <leader>gf :let g:ale_fix_on_save = 0<CR>
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-f> :ALEFix<CR>
nmap <silent> <leader>r :ALERename<CR>
nmap <silent> <leader>x :ALEFindReferences<CR>
nmap <silent> <leader>d :w<CR>:ALEGoToDefinition<CR>

" Fix ALE preview window navigation
autocmd FileType ale-preview-selection silent! unmap <buffer> a
autocmd FileType ale-preview-selection silent! unmap <buffer> i
