let g:neomake_virtualtext_current_error = 0

let g:neomake_error_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_python_enabled_makers = ['testmon']

" --tb=line is broken with --testmon, use custom parser as workaround
let g:neomake_testmon_maker = {
    \ 'exe': 'python3', 
    \ 'args': ['~/.scripts/pytest_wrapper.py', '--testmon'],
    \ 'errorformat': '%t:%o:%f:%l:%m,%-GSUMMARY%.%#',
    \ }
