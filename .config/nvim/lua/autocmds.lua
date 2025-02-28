local autocmd = vim.api.nvim_create_autocmd

autocmd(
    "FileType",
    { pattern = "markdown", callback = function()
        require("syntax.custom_markdown")()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end }
)

-- Give qf and loclist always full width
autocmd(
    "FileType",
    { pattern = "qf", callback = function() vim.cmd("wincmd J") end }
)

autocmd(
    "FileType",
    { pattern = "javascript", callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end }
)
