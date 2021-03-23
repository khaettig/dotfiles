nnoremap <leader>G :G<CR>

command Merge :G mergetool | :Gvdiffsplit! | :echo "Reminder: Use d2o and d3o, end with :only"
