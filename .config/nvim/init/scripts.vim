:source ~/.scripts/js_rename.py
:command! -nargs=* JSRename :py3 js_rename(<f-args>) 

:source ~/.scripts/gtd.py
:command! Archive :py3 gtd_archive()
:command! Arc :py3 gtd_archive()
:command! Project :py3 gtd_project()
:command! Pro :py3 gtd_project()
:command! Someday :py3 gtd_someday()
:command! Som :py3 gtd_someday()

:command! -nargs=1 Rebase :!python3 ~/.scripts/rebase.py <f-args>
