nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nmap <leader>dc <Plug>VimspectorContinue
nmap <leader>dr <Plug>VimspectorRunToCursor

nmap <F5> <Plug>VimspectorStepOver
nmap <F6> <Plug>VimspectorStepInto
nmap <F7> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorRestart

nmap <leader>b <Plug>VimspectorToggleBreakpoint

command Clear :call vimspector#ClearBreakpoints()
