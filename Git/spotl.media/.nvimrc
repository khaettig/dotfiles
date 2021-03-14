let g:ale_python_pylint_options = '--load-plugins pylint_django'

let test#python#runner = 'pytest'
let test#python#pytest#executable = 'python3 ~/.scripts/pytest_wrapper.py'
let test#python#pytest#options = '~/.scripts/pytest_wrapper.py --cov=. --cov-report='

let test#javascript#runner = 'karma'
let test#javascript#karma#executable = './.karma'
let test#javascript#karma#option = '--no-colors'
let test#javascript#karma#file_pattern = 'test_.*\.js'

let g:coverage_json_report_path = 'frontend/.coverage/coverage-final.json'

" nnoremap <silent> <F5> :Dispatch .venv/bin/python3 -m coverage run --parallel-mode --concurrency=multiprocessing manage.py test --parallel --keepdb -v 0 && .venv/bin/python3 -m coverage combine<CR>:CoveragePy<CR>
" nnoremap <silent> <F6> :Dispatch ./.karma --single-run --no-auto-watch --log-level=disable<CR>
" nnoremap <silent> <F7> :Dispatch .venv/bin/python3 run_functional_tests.py --python_executable .venv/bin/python3<CR>

autocmd FileType python :CoveragePy

autocmd BufWritePost *.py :Neomake! testmon
