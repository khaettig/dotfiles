require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "rust", "vim" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
