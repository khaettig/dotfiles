nnoremap <leader>G :G<CR>

command Gp :G push
command Gpf :G push --force-with-lease

command Merge :G mergetool | :Gvdiffsplit! | :echo "Reminder: Use d2o and d3o, end with :only"
