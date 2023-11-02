local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd

keymap.set("n", "ß", ":wa<CR>", { desc = "Save all" })
keymap.set("n", "ẞ", ":q<CR>", { desc = "Quit" })
keymap.set("n", "Q", "@q", { desc = "Use q macro" })
keymap.set("n", "<PageUp>", "<C-u>zz")
keymap.set("n", "<PageDown>", "<C-d>zz")
keymap.set("n", "<C-y>", ":NvimTreeToggle<CR>", { silent = true })
keymap.set("n", "<leader><C-y>", ":NvimTreeFindFile<CR>", { silent = true })

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
keymap.set("n", "<leader>ü", ":colder<CR>", { desc = "Open older QF list" })
keymap.set("n", "<leader>ö", ":cnewer<CR>", { desc = "Open newer QF list" })
keymap.set("n", "<leader>Ü", ":lolder<CR>", { desc = "Open older LF list" })
keymap.set("n", "<leader>Ö", ":lnewer<CR>", { desc = "Open newer LF list" })
keymap.set("n", "ä", function() require("functions.toggle_list")("quickfix") end, { silent = true })
keymap.set("n", "Ä", function() require("functions.toggle_list")("loclist") end, { silent = true })

-- Diagnostics
keymap.set("n", "”", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostics", silent = true })
keymap.set("n", "—", vim.diagnostic.goto_next, { desc = "Go to next diagnostics", silent = true })
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
keymap.set("n", "<leader>el", require("telescope.builtin").highlights, { desc = "Find High[L]ights" })
keymap.set({ "n", "v" }, "<leader>es", require("telescope.builtin").grep_string, { desc = "Find [S]tring" })
keymap.set("n", "<leader>en", function() require("telescope.builtin").live_grep({ cwd = "~/.config/nvim" }) end,
{ desc = "Find [N]vim config" })
keymap.set('n', '<leader>e%',
function() require("telescope.builtin").live_grep({ default_text = vim.fn.expand("%:t") }) end,
{ desc = "Find [%]Current File" })

-- [N]
keymap.set("n", "<leader>no", ":noh<CR>", { desc = "[N][o] highlight", silent = true })
keymap.set("n", "<leader>nt", require("functions.md_add_note"), { desc = "Add [N]o[T]e", silent = true })

-- [R]efactoring
-- See "lua/plugins/lsp.lua"

-- [B]reakpoint
keymap.set("n", "<leader>b", require("dap").toggle_breakpoint, { desc = "[B]reakpoint", silent = true })
keymap.set("n", "<leader>B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = "Conditional [B]reakpoint", silent = true })


-- [T]est
local neotest = require("neotest")
keymap.set("n", "<leader>tn", neotest.run.run, { desc = "[T]est [N]earest", silent = true })
keymap.set("n", "<leader>tdn", require("dap-python").test_method, { desc = "[T]est [D]ebug [N]earest", silent = true })
keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "[T]est [F]ile", silent = true })
keymap.set("n", "<leader>tdn", require("dap-python").test_class, { desc = "[T]est [D]ebug [F]ile", silent = true })
keymap.set("n", "<leader>ta", function() neotest.run.run({ suite = true }) end, { desc = "[T]est [A]ll", silent = true })
keymap.set("n", "<leader>tda", function() print("Not supported") end, { desc = "[T]est [D]ebug [A]ll", silent = true })
keymap.set("n", "<leader>tl", neotest.run.run_last, { desc = "[T]est [L]ast", silent = true })
keymap.set("n", "<leader>tdl", function() print("Not supported") end, { desc = "[T]est [D]ebug [L]ast", silent = true })
keymap.set("n", "<leader>tx", neotest.run.stop, { desc = "[T]est Stop", silent = true })
keymap.set("n", "<leader>to", neotest.output_panel.toggle, { desc = "[T]est [O]utput", silent = true })
keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "[T]est [S]ummary", silent = true })
keymap.set("n", "Ü", function() neotest.jump.next({ status = "failed" }) end, { desc = "Jump to previous failing test" })
keymap.set("n", "Ö", function() neotest.jump.prev({ status = "failed" }) end, { desc = "Jump to next failing test" })

-- [Leader]
keymap.set("n", "<leader><space>s", ":source %<CR>", { desc = "[S]ource current file" })

-- Functional keys
keymap.set("n", "<F5>", require("dap").continue)
keymap.set("n", "<F6>", require("dap").step_into)
keymap.set("n", "<F7>", require("dap").step_over)
keymap.set("n", "<F8>", require("dap").step_out)
keymap.set("n", "<F9>", require("dap").terminate)
keymap.set("n", "<F10>", require("dap").disconnect)
keymap.set("n", "<F11>", require("dap").clear_breakpoints)
keymap.set("n", "<F12>", require("dapui").toggle)

-- Javascript
autocmd(
    "FileType",
    {
        pattern = "javascript",
        callback = function()
            local file_opts = { cmd = "cd frontend && jest -- $file" }
            keymap.set("n", "<leader>tn", require("jester").run, { buffer = true })
            keymap.set("n", "<leader>tdn", require("jester").debug, { buffer = true })
            keymap.set("n", "<leader>tf", function() require("jester").run_file(file_opts) end, { buffer = true })
            keymap.set("n", "<leader>tdf", function() require("jester").debug_file(file_opts) end, { buffer = true })
            keymap.set("n", "<leader>tl", require("jester").run_last, { buffer = true })
            keymap.set("n", "<leader>tdl", require("jester").debug_last, { buffer = true })
        end
    }
)

-- Markdown
autocmd(
    "FileType",
    {
        pattern = "markdown",
        callback = function()
            local opts = { silent = true, buffer = true }
            keymap.set("n", "✔", "A ✔<ESC>", opts)
            keymap.set("n", "<enter>", require("functions.md_goto_link"), opts)
            keymap.set("n", "<leader><enter>", require("functions.md_add_todo"), opts)
        end
    }
)
