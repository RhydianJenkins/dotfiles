local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "lewis6991/impatient.nvim",
    }, -- load plugins faster (caching)

    {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim",
    }, -- floating box with text in

    {
        "wbthomason/packer.nvim",
    }, -- tell packer to manage itself

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    }, -- speed bonus for fzf file search

    {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
    },                                     -- left navigation panel

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    }, -- allow things to query the tree

    {
        "tami5/sqlite.lua",
    }, -- sqlite dependency

    {
        "rebelot/kanagawa.nvim",
    }, -- dark colorscheme

    {
        "scrooloose/nerdcommenter",
    }, -- comment blocks of code

    {
        "APZelos/blamer.nvim",
    }, -- git blame

    {
        "ntpeters/vim-better-whitespace",
    }, -- strip trailing whitespace

    {
        "j-hui/fidget.nvim",
    }, -- bottom right updates on tasks

    {
        "lewis6991/gitsigns.nvim",
    }, -- git integration to show additions/etc

    {
        "p00f/nvim-ts-rainbow",
    }, -- ranbow parenthesis to help with scopes

    {
        "folke/which-key.nvim",
    }, -- help for keybindings

    {
        "kyazdani42/nvim-web-devicons",
    }, -- adds icons and colors

    {
        "rrethy/vim-illuminate",
    }, -- highlight words on cursor over

    {
        "theprimeagen/git-worktree.nvim",
    }, -- manage git worktree

    {
        "onsails/lspkind.nvim",
    }, -- adds icons to completion list

    {
        "theprimeagen/harpoon",
    }, -- marks utility

    {
        "norcalli/nvim-colorizer.lua",
    }, -- adds color display for colors

    {
        "petertriho/nvim-scrollbar",
    }, -- adds scrollbar

    {
        "SmiteshP/nvim-gps",
    }, -- status line component to show cursor position

    {
        "feline-nvim/feline.nvim",
    }, -- bottom status line

    {
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }, -- top buffer tabs

    {
        "nelsyeung/twig.vim",
    }, -- twig support

    {
        "yuezk/vim-js",
    }, -- js(x} syntax highlighting

    {
        "varnishcache-friends/vim-varnish",
    }, -- varnish syntax highlighting

    {
        "mfussenegger/nvim-dap",
    }, -- main adapter

    {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
        },
    }, -- tui for debugging

    {
        "theHamsta/nvim-dap-virtual-text",
    }, -- adds ghost text to be able to easier see values

    {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-plenary",

            -- individual runners
            "haydenmeade/neotest-jest",
            "olimorris/neotest-phpunit",
        },
    }, -- core test

    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",

            "zbirenbaum/copilot.lua",
            "zbirenbaum/copilot-cmp",
        },
    }, -- base completion engine

    {
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
    }, -- snippet support

    {
        "leoluz/nvim-dap-go",
    }, -- go debugger (uses delve, needed in path)

    {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
    }, -- AI code assistant

    {
        "folke/neodev.nvim",
    }, -- lua completion for nvim api

    {
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "neovim/nvim-lspconfig",
        },
    }, -- used to install language servers

    {
        "glepnir/lspsaga.nvim",
        branch = "main",
    },
}

require("lazy").setup(plugins)
