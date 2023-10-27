let g:lightline = {
\   'colorscheme': 'default',
\   'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\     'right': [ [], [ 'lineinfo' ] , [ 'filetype' ]],
\   },
\   'inactive': {
\     'left': [ [ 'readonly', 'filename', 'modified' ] ],
\     'right': [ ],
\   },
\   'component_function': {
\     'gitbranch': 'FugitiveHead',
\   },
\ }
