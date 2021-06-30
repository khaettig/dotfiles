set path +=templates

nnoremap <F9> :sp<CR>:terminal python3 run_unittests.py --only_js<CR>

let test#python#pytest#options = '--testmon-noselect'

let test#javascript#runner = 'jest'
let test#javascript#jest#executable = 'python3 ~/.scripts/test_wrappers/jest_main.py --cwd ./frontend'
let test#javascript#jest#file_pattern = 'test_.*\.js'

let g:coverage_json_report_path = 'frontend/.coverage/coverage-final.json'
