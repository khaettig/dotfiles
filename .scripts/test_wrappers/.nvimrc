autocmd FileType python :CoveragePy

autocmd BufWritePost *.py :Neomake! pytest
