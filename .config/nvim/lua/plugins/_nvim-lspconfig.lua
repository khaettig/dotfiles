local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.pylsp.setup { capabilities = capabilities }
lspconfig.ts_ls.setup { capabilities = capabilities }
lspconfig.lua_ls.setup({
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
    capabilities = capabilities
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        local buf = vim.lsp.buf
        vim.keymap.set("n", "gD", buf.declaration, opts)
        vim.keymap.set("n", "gd", buf.definition, opts)
        vim.keymap.set("n", "gr", buf.references, opts)
        vim.keymap.set("n", "K", buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", buf.rename, opts)
        vim.keymap.set("n", "<leader>rf", function() buf.format { async = true } end, opts)
        vim.keymap.set({ "n", "v" }, "<space>ra", buf.code_action, opts)
    end,
})
