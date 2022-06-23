:source ~/.scripts/js_rename.py
:command! -nargs=* JSRename :py3 js_rename(<f-args>) 

:source ~/.scripts/gtd.py
:command! Archive :py3 gtd_archive()
:command! Arch :py3 gtd_archive()
:command! Project :py3 gtd_project()
:command! Proj :py3 gtd_project()
:command! Someday :py3 gtd_someday()
:command! Some :py3 gtd_someday()
:command! Waiting :py3 gtd_waiting()
:command! Wait :py3 gtd_waiting()

nnoremap <silent> <leader>pp :py3 open_protocol()<CR>
