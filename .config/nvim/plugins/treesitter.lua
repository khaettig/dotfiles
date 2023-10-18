require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "rust", "vim" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

   incremental_selection = {
     enable = true,
     keymaps = {
       node_incremental = "v",
       node_decremental = "V",
     },
  },
}
