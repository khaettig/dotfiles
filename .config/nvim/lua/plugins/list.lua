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
  "lewis6991/gitsigns.nvim",

  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-repeat" ,
  "tpope/vim-surround" ,
  "tpope/vim-commentary",
  "tpope/vim-abolish",
  "szw/vim-maximizer",

  "ThePrimeagen/vim-be-good",
  -- "ap/vim-css-color",
  "guns/xterm-color-table.vim",

  -- Python specific
  { "kalekseev/vim-coverage.py", build=":UpdateRemotePlugins" },
  "python-rope/ropevim",

  -- Javascript specific
  "retorillo/istanbul.vim",
})

require "plugins._nvim-treesitter"
require "plugins._nvim-lspconfig"
require "plugins._telescope"
require "plugins._harpoon"
require "plugins._nvim-cmp"
require "plugins._luasnip"
require "plugins._nvim-dap"
require "plugins._nerdtree"
require "plugins._lualine"
require "plugins._gitsigns"
require "plugins._vim-fugitive"
require "plugins._ropevim"
