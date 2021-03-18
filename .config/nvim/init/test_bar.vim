let s:test_green = ['#ffffff', '#005f00', 15, 22]
let s:test_red = ['#ffffff', '#800000', 15, 1]
let s:test_orange = ['#ffffff', '#df5f00', 15, 166]

let g:test_status = ''
let g:test_bar_width = 40

function SetTestBarToColor(color)
    let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
    let s:palette.normal.right = [a:color]
    call lightline#colorscheme()
endfunction

function GetTestStatus()
    if g:test_status == ''
        return ''
    endif
    let s:padding_length = (g:test_bar_width - strchars(g:test_status)) / 2.0
    return repeat(" ", float2nr(ceil(s:padding_length))) . g:test_status . repeat(" ", float2nr(floor(s:padding_length)))
endfunction

function! TestStarted() abort
    let g:test_status = 'PENDING'
    call SetTestBarToColor(s:test_orange)
endfunction

function! TestFinished() abort
    let s:jobinfo = g:neomake_hook_context.jobinfo

    let s:stdout = s:jobinfo.jobstart_opts.stdout
    let s:stderr = s:jobinfo.jobstart_opts.stderr

    if s:stderr != ['']
        echo s:stderr
        return
    endif

    if s:stdout[-1] == ''
        let s:raw = s:stdout[-2]
    else
        let s:raw = s:stdout[-1]
    endif

    let g:test_status = substitute(s:raw, "SUMMARY: ", "", "g")

    if s:jobinfo.exit_code == 1 || s:jobinfo.exit_code == 2
        call SetTestBarToColor(s:test_red)
    else
        call SetTestBarToColor(s:test_green)
    endif
endfunction

augroup neomake_hook
  au!
  autocmd User NeomakeJobStarted call TestStarted()
  autocmd User NeomakeJobFinished call TestFinished()
augroup END
