let test#strategy = 'neomake'

noremap <Leader>tn :TestNearest<CR>
noremap <Leader>tf :TestFile<CR>
noremap <Leader>tl :TestLast<CR>
noremap <Leader>tv :TestVisit<CR>
noremap <Leader>ts :TestSuite<CR>
autocmd FileType python nnoremap <buffer> <Leader>td :TestNearest -strategy=pydebug<CR>
autocmd FileType javascript nnoremap <buffer> <Leader>td :TestNearest -strategy=jsdebug<CR>

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'python3 ~/.scripts/test_wrappers/pytest_main.py'

function! PyDebugStrategy(cmd)
    -tabnew
    let s:command = join(split(a:cmd)[2:], " ")
    call termopen('pytest --pdb ' . s:command)
    startinsert
endfunction

function! JsDebugStrategy(cmd)
    call jobstart("kill -9 $(lsof -t -i:9229)")

    let s:split = split(a:cmd)
    let s:command = join(s:split[0:2], " ") .
    \ " --executable \"node --inspect node_modules/jest/bin/jest.js -i\" " .
    \ join(s:split[2:], " ")

    call jobstart(s:command)
    call vimspector#Launch()
endfunction


let g:test#custom_strategies = {
\ 'pydebug': function('PyDebugStrategy'),
\ 'jsdebug': function('JsDebugStrategy')
\ }
