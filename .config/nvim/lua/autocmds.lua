vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = "markdown", callback = require("syntax.custom_markdown") }
)

-- Give qf and loclist always full width
vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = "qf", callback = function() vim.cmd("wincmd J") end }
)
