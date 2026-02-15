return {
    "nvim-telescope/telescope.nvim",

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    "stevearc/oil.nvim",

    "rebelot/kanagawa.nvim",

    "APZelos/blamer.nvim",

    "ntpeters/vim-better-whitespace",

    "lewis6991/gitsigns.nvim",

    "folke/which-key.nvim",

    "folke/trouble.nvim",

    "nvim-tree/nvim-web-devicons",

    "echasnovski/mini.icons",

    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    "norcalli/nvim-colorizer.lua",

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
        "saghen/blink.cmp",
        version = "1.*",
        build = "nix run .#build-plugin",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "neovim/nvim-lspconfig",
        },
    },

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

    "rhydianjenkins/nvim-highlight",
}
