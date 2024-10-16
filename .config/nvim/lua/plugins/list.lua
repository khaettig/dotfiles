require("lazy").setup({
    "nvim-lua/plenary.nvim",
    { "nvim-treesitter/nvim-treesitter", build=":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
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

    "vim-test/vim-test",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "David-Kunz/jester",

    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    "lewis6991/gitsigns.nvim",

    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "tpope/vim-repeat" ,
    "tpope/vim-surround" ,
    "tpope/vim-commentary",
    "tpope/vim-abolish",
    "szw/vim-maximizer",
    "justinmk/vim-sneak",

    "ThePrimeagen/vim-be-good",
    "ap/vim-css-color",
    "guns/xterm-color-table.vim",

    -- Python specific
    { "kalekseev/vim-coverage.py", build=":UpdateRemotePlugins" },
    "python-rope/ropevim",

    -- Javascript specific
    "retorillo/istanbul.vim",
})

-- load before other plugins to take effect
require("plugins._nvim-web-devicons")

require("plugins._nvim-treesitter")
require("plugins._nvim-treesitter-context")
require("plugins._nvim-lspconfig")
require("plugins._telescope")
require("plugins._harpoon")
require("plugins._nvim-cmp")
require("plugins._luasnip")
require("plugins._nvim-neotest")
require("plugins._nvim-dap")
require("plugins._nvim-tree")
require("plugins._lualine")
require("plugins._gitsigns")
require("plugins._vim-fugitive")
require("plugins._ropevim")
require("plugins._istanbul")
require("plugins._vim-coverage")
