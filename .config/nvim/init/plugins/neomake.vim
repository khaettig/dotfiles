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
