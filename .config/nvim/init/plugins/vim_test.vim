let test#strategy = 'neomake'

noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>
noremap <Leader>ts :TestSuite<CR>
noremap <Leader>tdp :TestNearest -strategy=pydebug<CR>

function PyDebugStrategy(cmd)
    -tabnew
    call termopen('pytest --pdb' . a:cmd[36:])
    startinsert
endfunction

let g:test#custom_strategies = {'pydebug': function('PyDebugStrategy')}
