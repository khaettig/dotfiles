augroup autoformatting
    autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END

" GTD
autocmd BufNewFile */Projects/*.md 0r Templates/project.md
