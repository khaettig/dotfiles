local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
  end,
},
mapping = cmp.mapping.preset.insert({
  ['<C-e>'] = cmp.mapping.abort(),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
}),

sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'ultisnips' },
}, {
  { name = 'buffer' },
})
})

cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' },
}, {
  { name = 'buffer' },
})
})

cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')["pylsp"].setup { capabilities = capabilities }
require('lspconfig')["tsserver"].setup { capabilities = capabilities }
require('lspconfig')["lua_ls"].setup { capabilities = capabilities }
