return {
    "nvim-telescope/telescope.nvim",

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    "tami5/sqlite.lua",

    "rebelot/kanagawa.nvim",

    "numToStr/Comment.nvim",

    "APZelos/blamer.nvim",

    "ntpeters/vim-better-whitespace",

    "j-hui/fidget.nvim",

    "lewis6991/gitsigns.nvim",

    "folke/which-key.nvim",

    "folke/trouble.nvim",

    "kyazdani42/nvim-web-devicons",

    "echasnovski/mini.icons",

    "rrethy/vim-illuminate",

    "onsails/lspkind.nvim",

    "theprimeagen/harpoon",

    "norcalli/nvim-colorizer.lua",

    "petertriho/nvim-scrollbar",

    "nvim-lualine/lualine.nvim",

    "akinsho/bufferline.nvim",

    "nelsyeung/twig.vim",

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
        },
    },

    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-plenary",
            "haydenmeade/neotest-jest",
            "olimorris/neotest-phpunit",
            "rouge8/neotest-rust",
            "nvim-neotest/neotest-go",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "zbirenbaum/copilot.lua",
            "zbirenbaum/copilot-cmp",
            "tamago324/cmp-zsh",
        },
    },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        build = "make install_jsregexp",
    },

    "folke/neodev.nvim",

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "neovim/nvim-lspconfig",
        },
    },

    "nvimdev/lspsaga.nvim",

    {
        "mrjones2014/smart-splits.nvim",
        build = "./kitty/install-kittens.bash",
    },

    "rhydianjenkins/symfonyutils",

    {
        "kevinhwang91/nvim-bqf",
        dependencies = {
            { "junegunn/fzf", run = "fzf#install" },
        },
    },
}
