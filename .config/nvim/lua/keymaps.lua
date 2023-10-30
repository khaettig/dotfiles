local keymap = vim.keymap

keymap.set("n", "ß", ":wa<CR>", { desc = "Save all" })
keymap.set("n", "ẞ", ":q<CR>", { desc = "Quit" })
keymap.set("n", "Q", "@q", { desc = "Use q macro" })

-- Split navigation
keymap.set("n", "<S-Up>", "<C-w><Up>", { desc = "Go [Up]" })
keymap.set("n", "<S-Down>", "<C-w><Down>", { desc = "Go [Down]" })
keymap.set("n", "<S-Left>", "<C-w><Left>", { desc = "Go [Left]" })
keymap.set("n", "<S-Right>", "<C-w><Right>", { desc = "Go [Right]" })
keymap.set("n", "¡", "<C-w><Up><C-w>_", { desc = "Maximize upper pane" })
keymap.set("n", "¿", "<C-w><Down><C-w>_", { desc = "Maximize lower pane" })

-- Move lines
keymap.set("n", "<A-l>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("n", "<A-a>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("i", "<A-l>", "<ESC>:m .-2<CR>==gi", { desc = "Move line up" })
keymap.set("i", "<A-a>", "<ESC>:m .+1<CR>==gi", { desc = "Move line down" })
keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })
keymap.set("v", "<A-a>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })

-- Quickfix
keymap.set("n", "ü", ":cprevious<CR>zz", { desc = "Go to previous QF item" })
keymap.set("n", "ö", ":cnext<CR>zz", { desc = "Go to next QF item" })
keymap.set("n", "Ü", ":lprevious<CR>zz", { desc = "Go to next LF item" })
keymap.set("n", "Ö", ":lnext<CR>zz", { desc = "Go to next LF item" })
keymap.set("n", "<leader>ü", ":colder<CR>", { desc = "Open older QF list"})
keymap.set("n", "<leader>ö", ":cnewer<CR>", { desc = "Open newer QF list"})
keymap.set("n", "<leader>Ü", ":lolder<CR>", { desc = "Open older LF list"})
keymap.set("n", "<leader>Ö", ":lnewer<CR>", { desc = "Open newer LF list"})
keymap.set("n", "ä", ":lua require'functions.toggle_qf.toggle_qf'()<CR>", { silent = true }) -- TODO
keymap.set("n", "Ä", ":lua require'functions.toggle_lf.toggle_qf'()<CR>", { silent = true }) -- TODO

-- Diagnostics
keymap.set("n", "”", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostics" , silent = true })
keymap.set("n", "—", vim.diagnostic.goto_next, { desc = "Go to next diagnostics" , silent = true })
keymap.set('n', '„', vim.diagnostic.open_float, { desc = "Open diagnostics" })

-- [C]overage
-- TODO

-- [H]arpoon
keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu, { desc = "Open [H]arpoon marks" })
keymap.set("n", "°", require("harpoon.ui").nav_next, { desc = "Go to next harpoon mark" })
keymap.set("n", "§", require("harpoon.ui").nav_prev, { desc = "Go to previous harpoon mark" })
keymap.set("n", "ℓ", require("harpoon.mark").add_file, { desc = "Add harpoon mark" })
keymap.set("n", "»", require("harpoon.mark").rm_file, { desc = "Remove harpoon mark" })
keymap.set("n", "«", require("harpoon.mark").clear_all, { desc = "Clear all harpoon marks" })
keymap.set("n", "¹", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to first harpoon mark" })
keymap.set("n", "²", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to second harpoon mark" })
keymap.set("n", "³", function() require("harpoon.ui").nav_file(3) end, { desc = "Go to third harpoon mark" })
keymap.set("n", "›", function() require("harpoon.ui").nav_file(4) end, { desc = "Go to fourth harpoon mark" })

-- [E]
keymap.set("n", "<leader>eh", require("telescope.builtin").help_tags, { desc = "Find [H]elp" })
keymap.set("n", "<leader>ek", require("telescope.builtin").keymaps, { desc = "Find [K]eymaps" })
keymap.set("n", "<leader>es", require("telescope.builtin").resume, { desc = "Find [R]esume" })
keymap.set("n", "<leader>ef", require("telescope.builtin").find_files, { desc = "Find [F]iles" })
keymap.set("n", "<leader>eo", require("telescope.builtin").oldfiles, { desc = "Find recently [O]pened files" })
keymap.set("n", "<leader>eg", require("telescope.builtin").live_grep, { desc = "Find with [G]rep" })
keymap.set("n", "<leader>eb", require("telescope.builtin").git_branches, { desc = "Find [B]ranches" })
keymap.set("n", "<leader>ec", require("telescope.builtin").git_commits, { desc = "Find [C]ommits" })
keymap.set("n", "<leader>eq", require("telescope.builtin").quickfix, { desc = "Find [Q]uickfix" })
keymap.set("n", "<leader>em", require("telescope.builtin").marks, { desc = "Find [M]arks" })
keymap.set("n", "<leader>ed", require("telescope.builtin").diagnostics, { desc = "Find [D]iagnostics" })
keymap.set({ "n", "v" }, "<leader>es", require("telescope.builtin").grep_string, { desc = "Find [S]tring" })
keymap.set("n", "<leader>en", function() require("telescope.builtin").live_grep({ cwd = "~/.config/nvim" }) end, { desc = "Find [N]vim config" })
keymap.set('n', '<leader>e%', function() require("telescope.builtin").live_grep({ default_text = vim.fn.expand("%:t") }) end, { desc = "Find [%]Current File" })

-- [N]
keymap.set("n", "<leader>no", ":noh<CR>", { desc = "[N][o] highlight", silent = true })

-- [R]efactoring
-- See "lua/plugins/lsp.lua"

-- [B]reakpoint
keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "[B]reakpoint", silent = true })
keymap.set("n", "<leader>B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
{ desc = "Conditional [B]reakpoint", silent = true })


-- TODO Use neotest:
-- autocmd FileType python nnoremap <buffer> <Leader>dn :lua require("dap-python").test_method()<CR>
-- autocmd FileType python nnoremap <buffer> <Leader>df :lua require("dap-python").test_class()<CR>
-- autocmd FileType python vnoremap <buffer> <Leader>ds <ESC>:lua require("dap-python").debug_selection()<CR>

-- autocmd FileType javascript nnoremap <buffer> <leader>tn :lua require"jester".run()<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>tf :lua require"jester".run_file()<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>tl :lua require"jester".run_last()<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>dn :lua require"jester".debug()<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>df :lua require"jester".debug_file()<CR>
-- autocmd FileType javascript nnoremap <buffer> <leader>dl :lua require"jester".debug_last()<CR>

-- Markdown
-- autocmd FileType markdown nnoremap <silent> <buffer> <enter> :GoToLink<CR>
-- autocmd FileType markdown nnoremap <silent> <buffer> <leader><enter> :AddTodoistTodo<CR>
-- autocmd FileType markdown nnoremap <silent> <buffer> ✔ A ✔<ESC>

-- [Leader]
keymap.set("n", "<leader><space>s", ":source %<CR>", { desc = "[S]ource current file" })
