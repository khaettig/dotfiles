let g:ale_python_pylint_options = '--load-plugins pylint_django'

let test#python#pytest#options = '--testmon-noselect'

let test#javascript#runner = 'jest'
let test#javascript#jest#executable = 'python3 ~/.scripts/test_wrappers/jest_main.py --cwd ./frontend --executable ./node_modules/jest/bin/jest.js'
let test#javascript#jest#file_pattern = 'test_.*\.js'

autocmd FileType python :CoveragePy

autocmd BufWritePost *.py :Neomake! testmon
autocmd BufWritePost *.js :Neomake! jest
let g:coverage_timer = timer_start(30000, 'RunPytestCoverage', {'repeat': '-1'})
