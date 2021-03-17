let test#strategy = 'neomake'

noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>
noremap <Leader>ts :TestSuite<CR>
noremap <Leader>tdp :TestNearest -strategy=pydebug<CR>

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'python3 ~/.scripts/test_wrappers/pytest_main.py'

function PyDebugStrategy(cmd)
    -tabnew
    let s:command = join(split(a:cmd)[2:], " ")
    call termopen('pytest --pdb ' . s:command)
    startinsert
endfunction

let g:test#custom_strategies = {'pydebug': function('PyDebugStrategy')}
