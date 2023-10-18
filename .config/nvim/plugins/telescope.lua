require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"locale"}
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('harpoon')

vim.api.nvim_set_keymap('n', '<leader>ee', '<cmd>Telescope resume<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ef', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eg', '<cmd>Telescope live_grep<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>Telescope live_grep cwd=~/.config/nvim<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>et', '<cmd>Telescope grep_string<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eb', '<cmd>Telescope git_branches<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>ec', '<cmd>Telescope git_commits<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>es', '<cmd>Telescope git_stash<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eq', '<cmd>Telescope quickfix<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>em', '<cmd>Telescope marks<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eh', '<cmd>Telescope harpoon marks<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>eu', '<cmd>lua require("telescope.builtin").live_grep({ default_text=vim.fn.expand("%:t") })<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>eg', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', {})
