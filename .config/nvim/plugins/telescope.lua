require('telescope').setup{}
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<leader>ef', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eg', '<cmd>Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>Telescope live_grep cwd=~/.config/nvim<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>et', '<cmd>Telescope grep_string<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eb', '<cmd>Telescope git_branches<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ec', '<cmd>Telescope git_commits<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>es', '<cmd>Telescope git_stash<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eq', '<cmd>Telescope quickfix<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>em', '<cmd>Telescope marks<CR>', {})
