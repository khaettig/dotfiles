local autocmd = vim.api.nvim_create_autocmd

autocmd(
    "FileType",
    { pattern = "markdown", callback = require("syntax.custom_markdown") }
)

-- Give qf and loclist always full width
autocmd(
    "FileType",
    { pattern = "qf", callback = function() vim.cmd("wincmd J") end }
)
