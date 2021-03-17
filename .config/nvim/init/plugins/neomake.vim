let g:neomake_virtualtext_current_error = 0

let g:neomake_error_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_python_enabled_makers = ['pytest', 'pytestxdist', 'testmon']

let s:postprocessor_errorformat = '%t:%o:%f:%l:%m,%-GSUMMARY%.%#'
let s:pytest_wrapper = '~/.scripts/test_wrappers/pytest_main.py'

let g:neomake_pytest_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper],
    \ 'errorformat': s:postprocessor_errorformat,
    \ }
let g:neomake_pytestxdist_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper, '-n', 'auto'],
    \ 'errorformat': s:postprocessor_errorformat,
    \ }
let g:neomake_testmon_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper, '--testmon'],
    \ 'errorformat': s:postprocessor_errorformat,
    \ }
