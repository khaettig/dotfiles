let g:lightline = {
\   'colorscheme': 'default',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\     'right': [ [ 'teststatus' ] ],
\   },
\   'inactive': {
\     'left': [ [ 'readonly', 'filename', 'modified' ] ],
\     'right': [ [ 'teststatus' ] ],
\   },
\   'component_function': {
\     'gitbranch': 'FugitiveHead',
\     'teststatus': 'GetTestStatus',
\   },
\ }
