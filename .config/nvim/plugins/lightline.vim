let g:lightline = {
\   'colorscheme': 'default',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\     'right': [ ],
\   },
\   'inactive': {
\     'left': [ [ 'readonly', 'filename', 'modified' ] ],
\     'right': [ ],
\   },
\   'component_function': {
\     'gitbranch': 'FugitiveHead',
\   },
\ }
