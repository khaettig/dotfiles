function ConfigureCoveragePy()
    sign define coverageOk text=░░ texthl=MyCoverageOk
    sign define coverageWarn text=░░ texthl=MyCoveragePyWarn
    sign define coverageErr text=░░ texthl=MyCoveragePyError

    nmap <silent> <leader>c :CoveragePy<CR>
endfunction

function RerunCoveragePy(...)
    :doautoall FileType
endfunction

function RunPytestCoverage(...)
    call jobstart(
    \ "pytest -n auto --cov=. --cov-report=",
    \ {"on_exit": function("RerunCoveragePy")})
endfunction

autocmd FileType python call ConfigureCoveragePy()
