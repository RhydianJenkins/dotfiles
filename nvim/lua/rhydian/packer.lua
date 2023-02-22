local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use({
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
        end,
    }) -- load plugins faster (caching)

    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }) -- floating box with text in

    use({ "wbthomason/packer.nvim" }) -- tell packer to manage itself

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- speed bonus for fzf file search

    use({ "preservim/nerdtree" }) -- left navigation panel

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- allow things to query the tree

    use({ "tami5/sqlite.lua" }) -- sqlite dependency

    use({ "rebelot/kanagawa.nvim" }) -- dark colorscheme

    use({ "scrooloose/nerdcommenter" }) -- comment blocks of code

    use({ "APZelos/blamer.nvim" }) -- git blame

    use({ "ntpeters/vim-better-whitespace" }) -- strip trailing whitespace

    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    }) -- bottom right updates on tasks

    use({ "lewis6991/gitsigns.nvim" }) -- git integration to show additions/etc

    use({ "p00f/nvim-ts-rainbow" }) -- ranbow parenthesis to help with scopes

    use({ "folke/which-key.nvim" }) -- help for keybindings

    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    }) -- adds icons and colors

    use({ "rrethy/vim-illuminate" }) -- highlight words on cursor over

    use({ "theprimeagen/git-worktree.nvim" }) -- manage git worktree

    use({ "onsails/lspkind.nvim" }) -- adds icons to completion list

    use({ "theprimeagen/harpoon" }) -- marks utility

    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    }) -- adds color display for colors

    use({
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({})
        end,
    }) -- adds scrollbar

    use({
        "SmiteshP/nvim-gps",
        config = function()
            require("nvim-gps").setup({})
        end,
    }) -- status line component to show cursor position

    use({ "feline-nvim/feline.nvim" }) -- bottom status line

    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("bufferline").setup({})
        end,
    }) -- top buffer tabs

    use({ "nelsyeung/twig.vim" }) -- twig support

    use({ "yuezk/vim-js" }) -- js(x} syntax highlighting

    use({ "varnishcache-friends/vim-varnish" }) -- varnish syntax highlighting

    use({ "mfussenegger/nvim-dap" }) -- main adapter

    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) -- tui for debugging

    use({ "theHamsta/nvim-dap-virtual-text" }) -- adds ghost text to be able to easier see values

    use({
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
    }) -- core test

    use({
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
    }) -- base completion engine

    use({ "L3MON4D3/LuaSnip", requires = {
        "rafamadriz/friendly-snippets",
    } }) -- snippet support

    use({ "leoluz/nvim-dap-go" }) -- go debugger (uses delve, needed in path)

    use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- AI code assistant

    use({ "jackMort/ChatGPT.nvim", requires = { "MunifTanjim/nui.nvim" } }) -- ChatGPT access

    use({ "neovim/nvim-lspconfig" }) -- base config

    use({ "folke/neodev.nvim" }) -- lua completion for nvim api

    use({
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
        },
    }) -- used to install language servers

    use({ "glepnir/lspsaga.nvim", branch = "main" })

    if packer_bootstrap then
        print("Packer is bootstrapping itself. You'll need to restart neovim once finished")
        require("packer").sync()
    end
end)
