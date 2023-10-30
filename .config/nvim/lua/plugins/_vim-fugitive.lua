vim.api.nvim_create_user_command("Gpf", ":G push --force-with-lease", {})
vim.api.nvim_create_user_command("Merge", ":G mergetool | :Gvdiffsplit! | :echo 'Reminder: Use d2o and d3o, end with :only'", {})
