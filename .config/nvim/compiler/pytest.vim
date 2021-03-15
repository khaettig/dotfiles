" Vim compiler file
" Compiler:	Unit testing tool for Python

if exists("current_compiler")
  finish
endif
let current_compiler = "pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" " _______ ERROR collecting apps/membership/tests/test_account_creation.py ________
CompilerSet efm=%E_%#\ ERROR\ %.%#

" E     File "<filename>", line 10
CompilerSet efm+=%CE\ \ \ \ \ File\ \"%f\"\\,\ line\ %l

" E       nonsense
CompilerSet efm+=%CE\ \ \ \ %.%#

" E   SyntaxError: invalid syntax
CompilerSet efm+=%ZE\ \ \ %m

" Empty lines
CompilerSet efm+=%C\\s%#

" Everything else in a multiline error
CompilerSet efm+=%C%.%#

" Normal failures will stay in one line with the --tb=line argument
" <absolute_path>:10: AssertionError: assert 1 == 2
CompilerSet efm+=%f:%l:\ %m

" Do not print anything else
CompilerSet efm+=%-G%.%#
