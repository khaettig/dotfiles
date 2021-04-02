let g:neomake_virtualtext_current_error = 0

let g:neomake_error_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '>>',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_python_enabled_makers = ['pytest']
let g:neomake_javascript_enabled_makers = ['jest']

let s:wrapper_errorformat = '%t:%o:%f:%l:%m,%t:%o:%f:%l:,%-GSUMMARY:%.%#'
let s:pytest_wrapper = '~/.scripts/test_wrappers/pytest_main.py'
let s:jest_wrapper = '~/.scripts/test_wrappers/jest_main.py'

" let g:neomake_pytest_maker = {
"     \ 'exe': 'python3', 
"     \ 'args': [s:pytest_wrapper, '--cov=', '--cov-branch'],
"     \ 'errorformat': s:wrapper_errorformat,
"     \ }
" let g:neomake_pytestxdist_maker = {
"     \ 'exe': 'python3', 
"     \ 'args': [s:pytest_wrapper, '-n', 'auto', '--cov=', '--cov-branch'],
"     \ 'errorformat': s:wrapper_errorformat,
"     \ }
" let g:neomake_testmon_maker = {
"     \ 'exe': 'python3', 
"     \ 'args': [s:pytest_wrapper, '--testmon'],
"     \ 'errorformat': s:wrapper_errorformat,
"     \ }
" let g:neomake_jest_maker = {
"     \ 'exe': 'python3', 
"     \ 'args': [
"     \    s:jest_wrapper,
"     \    '--cwd', './frontend', '--onlyChanged',
"     \  ],
"     \ 'errorformat': s:wrapper_errorformat,
"     \ }
" let g:neomake_jestcoverage_maker = {
"     \ 'exe': 'python3', 
"     \ 'args': [
"     \    s:jest_wrapper,
"     \    '--cwd', './frontend', '--coverage',
"     \  ],
"     \ 'errorformat': s:wrapper_errorformat,
"     \ }
