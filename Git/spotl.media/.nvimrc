let g:ale_python_pylint_options = '--load-plugins pylint_django'

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'python3 ~/.scripts/pytest_wrapper.py'
let test#python#pytest#options = '--testmon-noselect'

let test#javascript#runner = 'jest'
let test#javascript#jest#executable = 'python3 ~/.scripts/jest_wrapper.py'
let test#javascript#jest#file_pattern = 'test_.*\.js'

autocmd FileType python :CoveragePy

autocmd BufWritePost *.py :Neomake! testmon
" let g:coverage_timer = timer_start(30000, 'RunPytestCoverage', {'repeat': '-1'})
