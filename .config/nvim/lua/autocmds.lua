vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = "markdown", callback = require("syntax.custom_markdown") }
)
