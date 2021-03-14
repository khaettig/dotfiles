" Vim compiler file

if exists("current_compiler")
  finish
endif
let current_compiler = "wrapper"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet efm=%t:%f:%l:%m,%-GSUMMARY%.%#
