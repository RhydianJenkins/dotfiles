if vim.loader then
    vim.loader.enable()
end

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
    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })

    use({ "wbthomason/packer.nvim" })

    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    use({
        "nvim-tree/nvim-tree.lua",
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

    use({ "j-hui/fidget.nvim" })

    use({ "lewis6991/gitsigns.nvim" })

    use({ "folke/which-key.nvim" })

    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    })

    use({ "rrethy/vim-illuminate" })

    use({ "onsails/lspkind.nvim" })

    use({ "theprimeagen/harpoon" })

    use({ "norcalli/nvim-colorizer.lua" })

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

    use({
        "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
        },
    })

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

    use({ "tzachar/cmp-tabnine", run = "./install.sh" })

    use({ "folke/neodev.nvim" })

    use({
        "williamboman/mason.nvim",
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
            "jay-babu/mason-null-ls.nvim",
            "neovim/nvim-lspconfig",
        },
    })

    use({ "nvimdev/lspsaga.nvim" })

    use({ "mrjones2014/smart-splits.nvim", build = "./kitty/install-kittens.bash" })

    use({ "rhydianjenkins/symfonyutils" })

    if packer_bootstrap then
        print("Packer is bootstrapping itself. You'll need to restart neovim once finished")
        require("packer").sync()
    end
end)
