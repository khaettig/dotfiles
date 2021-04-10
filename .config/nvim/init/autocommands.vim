augroup autoformatting
    autocmd BufWritePre *.py lua vim.lsp.buf.formatting()
    autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
augroup END

" GTD
autocmd BufNewFile */Projects/*.md 0r Templates/project.md
