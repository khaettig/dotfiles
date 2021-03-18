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
let g:neomake_javascript_enabled_makers = ['jest']

let s:wrapper_errorformat = '%t:%o:%f:%l:%m,%t:%o:%f:%l:,%-GSUMMARY:%.%#'
let s:pytest_wrapper = '~/.scripts/test_wrappers/pytest_main.py'
let s:jest_wrapper = '~/.scripts/test_wrappers/jest_main.py'

let g:neomake_pytest_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper],
    \ 'errorformat': s:wrapper_errorformat,
    \ }
let g:neomake_pytestxdist_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper, '-n', 'auto'],
    \ 'errorformat': s:wrapper_errorformat,
    \ }
let g:neomake_testmon_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper, '--testmon'],
    \ 'errorformat': s:wrapper_errorformat,
    \ }
let g:neomake_jest_maker = {
    \ 'exe': 'python3', 
    \ 'args': [s:pytest_wrapper, '--executable', './frontend/node_modules/jest/bin/jest.js'],
    \ 'errorformat': s:wrapper_errorformat,
    \ }
