require"lazy".setup({
  "nvim-lua/plenary.nvim",
  { "nvim-treesitter/nvim-treesitter", build="TSUpdate" },
  "neovim/nvim-lspconfig",

  "nvim-telescope/telescope.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build="make" },
  "ThePrimeagen/harpoon",

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  { "L3MON4D3/LuaSnip", build="make install_jsregexp", version="v2.*" },
  "saadparwaiz1/cmp_luasnip",

  "janko/vim-test",
  "David-Kunz/jester",

  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "mfussenegger/nvim-dap-python",

  "preservim/nerdtree",
  "nvim-lualine/lualine.nvim",
  "airblade/vim-gitgutter",

  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-repeat" ,
  "tpope/vim-surround" ,
  "tpope/vim-commentary",
  "tpope/vim-abolish",
  "szw/vim-maximizer",

  "ThePrimeagen/vim-be-good",
  "ap/vim-css-color",
  "guns/xterm-color-table.vim",

  -- Python specific
  { "kalekseev/vim-coverage.py", build=":UpdateRemotePlugins" },
  "python-rope/ropevim",

  -- Javascript specific
  "retorillo/istanbul.vim",
})

require "plugins.treesitter"
require "plugins.lsp"
require "plugins.telescope"
require "plugins.harpoon"
require "plugins.cmp"
require "plugins.luasnip"
require "plugins.dap"
require "plugins.nerdtree"
require "plugins.lualine"
require "plugins.fugitive"
require "plugins.ropevim"
