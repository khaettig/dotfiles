let g:ropevim_guess_project=1
let g:ropevim_enable_autoimport=1
let g:ropevim_autoimport_modules=["django.*"]
let g:ropevim_local_prefix="<leader>ro"
let g:ropevim_global_prefix="<leader>rp"

nmap <leader>roz :call RopeAutoImport()<CR>
