augroup autoformatting
    autocmd BufWritePre *.py lua vim.lsp.buf.format()
    autocmd BufWritePre *.js lua vim.lsp.buf.format()
    autocmd BufWritePre *.rs lua vim.lsp.buf.format()
augroup END
