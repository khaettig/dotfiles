" Vim compiler file
" Compiler:	Unit testing tool for Python

if exists("current_compiler")
  finish
endif
let current_compiler = "python3"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" ignore empty lines in multiline errors
CompilerSet efm=%C\\s%#

" Using test_settings.py (overwritten in manage.py).
CompilerSet efm+=%-GUsing%.%#

" System check identified no issues (0 silenced).
CompilerSet efm+=%-GSystem%.%#

" ======================================================================
CompilerSet efm+=%-G=%#

" ERROR: test_valid_post_returns_ok (apps.user.tests.test_avatar.PostAvatarAsMemberTest)
" FAIL: ...
" During handling ...
CompilerSet efm+=%EERROR:\ %o\ %.%#
CompilerSet efm+=%EFAIL:\ %o\ %.%#
CompilerSet efm+=%EDuring\ handling\ of\ the\ above\ exception\\,\ %o:

" " ----------------------------------------------------------------------
CompilerSet efm+=%C-%#

" Traceback (most recent call last):
CompilerSet efm+=%CTraceback\ %.%#
CompilerSet efm+=%ETraceback\ %.%#

"     yield
CompilerSet efm+=%C\ \ \ \ %.%#

"   File "/usr/lib/python3.8/unittest/case.py", line 60, in testPartExecutor
" CompilerSet efm+=%C\ \ File\ \"%.%#lib/python3%.%#
CompilerSet efm+=%C\ \ File\ \"%f\"\\,\ line\ %l%.%#

" " KeyError: 'usr'
CompilerSet efm+=%Z%m

" " ----------------------------------------------------------------------
CompilerSet efm+=%-G-%#

" Ran 177 tests in 2.429s
CompilerSet efm+=%+GRan\ %.%#

" FAILED (errors=1, skipped=1)
CompilerSet efm+=%+GFAILED\ %.%#

" OK
CompilerSet efm+=%+GOK
