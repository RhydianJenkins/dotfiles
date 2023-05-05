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
    })

    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })

    use({ "wbthomason/packer.nvim" })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({})
        end,
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
    })

    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    use({ "tami5/sqlite.lua" })

    use({ "rebelot/kanagawa.nvim" })

    use({ "scrooloose/nerdcommenter" })

    use({ "APZelos/blamer.nvim" })

    use({ "ntpeters/vim-better-whitespace" })

    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    })

    use({ "lewis6991/gitsigns.nvim" })

    use({ "p00f/nvim-ts-rainbow" })

    use({ "folke/which-key.nvim" })

    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    })

    use({ "rrethy/vim-illuminate" })

    use({ "theprimeagen/git-worktree.nvim" })

    use({ "onsails/lspkind.nvim" })

    use({ "theprimeagen/harpoon" })

    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({})
        end,
    })

    use({
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({})
        end,
    })

    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    })

    use({ "feline-nvim/feline.nvim" })

    use({
        "akinsho/bufferline.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })

    use({ "nelsyeung/twig.vim" })

    use({ "yuezk/vim-js" })

    use({ "varnishcache-friends/vim-varnish" })

    use({ "mfussenegger/nvim-dap" })

    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    use({ "theHamsta/nvim-dap-virtual-text" })

    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "vim-test/vim-test",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-plenary",
            "haydenmeade/neotest-jest",
            "olimorris/neotest-phpunit",
            "rouge8/neotest-rust",
        },
    })

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
    })

    use({
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
    })

    use({ "leoluz/nvim-dap-go" })

    use({ "tzachar/cmp-tabnine", run = "./install.sh" })

    use({ "jackMort/ChatGPT.nvim", requires = { "MunifTanjim/nui.nvim" } })

    use({ "folke/neodev.nvim" })

    use({
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "neovim/nvim-lspconfig",
        },
    })

    use({ "glepnir/lspsaga.nvim", branch = "main" })

    if packer_bootstrap then
        print("Packer is bootstrapping itself. You'll need to restart neovim once finished")
        require("packer").sync()
    end
end)
