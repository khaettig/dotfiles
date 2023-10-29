local keymap = vim.keymap

keymap.set("n", "<F2>", ":e ~/.config/nvim/cheat_sheet.md<CR>", { silent = true })
keymap.set("n", "<leader>no", ":noh<CR>", { silent = true })

keymap.set("n", "<leader>qq", ":q<CR>", { silent = true })
keymap.set("n", "<leader>qa", ":wqa<CR>", { silent = true })
keymap.set("n", "<leader>ww", ":w<CR>", { silent = true })
keymap.set("n", "<leader>wq", ":wq<CR>", { silent = true })
keymap.set("n", "<leader>wa", ":wa<CR>", { silent = true })

keymap.set("n", "<leader>ff", ":Gg %:t -- ':!*.po'<CR><CR>", { silent = true })

-- Move lines
keymap.set("n", "<A-a>", ":m .+1<CR>==")
keymap.set("n", "<A-l>", ":m .-2<CR>==")
keymap.set("i", "<A-a>", "<ESC>:m .+1<CR>==gi")
keymap.set("i", "<A-l>", "<ESC>:m .-2<CR>==gi")
keymap.set("v", "<A-a>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-l>", ":m '<-2<CR>gv=gv")

-- Split navigation
keymap.set("n", "<S-Up>", "<C-w><Up>")
keymap.set("n", "<S-Down>", "<C-w><Down>")
keymap.set("n", "<S-Left>", "<C-w><Left>")
keymap.set("n", "<S-Right>", "<C-w><Right>")

-- Quickfix
keymap.set("n", "ü", ":cprevious<CR>zz")
keymap.set("n", "ö", ":cnext<CR>zz")

keymap.set("n", "ν", ":CodeReviewPrevious<CR>")
keymap.set("n", "τ", ":CodeReviewNext<CR>")

keymap.set("n", "<leader>ü", ":colder<CR>")
keymap.set("n", "<leader>ö", ":cnewer<CR>")
keymap.set("n", "<leader>Ü", ":lolder<CR>")
keymap.set("n", "<leader>Ö", ":lnewer<CR>")

keymap.set("n", "ä", ":lua require'functions.toggle_qf.toggle_qf'()<CR>", { silent = true })

keymap.set("n", "¡", "<C-w><Up><C-w>_")
keymap.set("n", "¿", "<C-w><Down><C-w>_")

keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true })

-- Use neotest:
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
