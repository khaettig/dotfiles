require('harpoon').setup({})

vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>hc", "<cmd>lua require('harpoon.mark').clear_all()<CR>", {})
vim.api.nvim_set_keymap("n", "Ö", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})
vim.api.nvim_set_keymap("n", "Ü", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
