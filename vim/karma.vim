" Vim compiler file
" Compiler: Karma runner for javascript

" TODO: Autoinstall

if exists("current_compiler")
  finish
endif
let current_compiler = "karma"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif


" Chrome Headless 87.0.4280.141 (Linux x86_64): Executed 314 of 314 (2 FAILED) (1.133 secs / 0.861 secs)
CompilerSet efm=%-GChrome%.%#:

" Chrome Headless 87.0.4280.141 (Linux x86_64) <error name> FAILED
CompilerSet efm+=%E%.%#Chrome%.%#\)\ %oFAILED

"           at UserContext.<anonymous> (webpack:///filename.js:33:42 <- filename.js:11860:42)
CompilerSet efm+=%Z%.%#\ at\ %.%#webpack\:////%f:%l:%.%#

" Error: <error message>
CompilerSet efm+=%C%.%#Error\:\ %m

"           at <Jasmine>
CompilerSet efm+=%C%.%#

" ................................................................
"           at <Jasmine>
CompilerSet efm+=%-G%.%.%#
