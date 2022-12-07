local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

return require("packer").startup(function(use)
    use({ "lewis6991/impatient.nvim" }) -- load plugins faster (caching)
    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" }) -- floating box with text in
    use({ "wbthomason/packer.nvim" }) -- tell packer to manage itself
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- speed bonus for fzf file search
    use({ "preservim/nerdtree" }) -- left navigation panel
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- allow things to query the tree
    use({ "tami5/sqlite.lua" }) -- sqlite dependency
    use({ "scrooloose/nerdcommenter" }) -- comment blocks of code
    use({ "kqito/vim-easy-replace" }) -- <leader>ra - find and replace all
    use({ "APZelos/blamer.nvim" }) -- git blame
    use({ "ntpeters/vim-better-whitespace" }) -- strip trailing whitespace
    use({ "j-hui/fidget.nvim" }) -- bottom right updates on tasks
    use({ "lewis6991/gitsigns.nvim" }) -- git integration to show additions/etc
    use({ "p00f/nvim-ts-rainbow" }) -- ranbow parenthesis to help with scopes
    use({ "folke/which-key.nvim" }) -- help for keybindings
    use({ "tzachar/cmp-tabnine", run = "./install.sh" }) -- AI code assistant
    use({ "kyazdani42/nvim-web-devicons" }) -- adds icons and colors
    use({ "lumiliet/vim-twig" }) -- twig syntax highlighting
    use({ "yuezk/vim-js" }) -- js(x} syntax highlighting
    use({ "fgsch/vim-varnish" }) -- varnish syntax highlighting
    use({ "morhetz/gruvbox" }) -- color theme
    use({ "rrethy/vim-illuminate" }) -- highlight words on cursor over
    use({ "theprimeagen/git-worktree.nvim" }) -- manage git worktree
    use({ "onsails/lspkind.nvim" }) -- adds icons to completion list
    use({ "theprimeagen/harpoon" }) -- marks utility
    use({ "norcalli/nvim-colorizer.lua" }) -- adds color display for colors
    use({ "petertriho/nvim-scrollbar" }) -- adds scrollbar
    use({ "SmiteshP/nvim-gps" }) -- status line component to show cursor position
    use({ "feline-nvim/feline.nvim" }) -- status line
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
    }) -- status line
    use({ "RishabhRD/popfix" }) -- requirement for Rishabh plugins
    use({ "nelsyeung/twig.vim" }) -- twig support

    -- Debugging
    use({ "mfussenegger/nvim-dap" }) -- main adapter
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }) -- tui for debugging
    use({ "theHamsta/nvim-dap-virtual-text" }) -- adds ghost text to be able to easier see values

    -- Testing
    use({ "antoinemadec/FixCursorHold.nvim" }) -- Recomended for neotest
    use({ "vim-test/vim-test" }) -- fills gaps that neotest doesn't
    use({ "nvim-neotest/neotest" }) -- core test
    use({ "nvim-neotest/neotest-plenary" }) -- most tests use plenary, so the adapter is needed
    use({ "nvim-neotest/neotest-vim-test" }) -- enables use of vim test from within neotest
    use({ "haydenmeade/neotest-jest" }) -- javascipt

    -- Cmp
    use({ "hrsh7th/nvim-cmp" }) -- base completion engine
    use({ "hrsh7th/cmp-nvim-lsp" }) -- adds lsp completion
    use({ "hrsh7th/cmp-nvim-lua" }) -- adds lua to lsp completion
    use({ "hrsh7th/cmp-buffer" }) -- adds buffer text to lsp completion
    use({ "hrsh7th/cmp-path" }) -- adds path to lsp completion
    use({ "hrsh7th/cmp-cmdline" }) -- adds cmdline lsp completion
    use({ "hrsh7th/vim-vsnip" }) -- snippet engine required for cmp
    use({ "hrsh7th/vim-vsnip-integ" }) -- allows plugin integration with snippet engine

    -- Copilot
    use({ "zbirenbaum/copilot.lua" }) -- lua server for copilot
    use({ "zbirenbaum/copilot-cmp" }) -- Turns copilot into a cmp source
    use({ "leoluz/nvim-dap-go" }) -- go debugger (uses delve, needed in path)

    -- LSP
    use({ "neovim/nvim-lspconfig" }) -- base config
    use({ "folke/neodev.nvim" }) -- lua completion for nvim api
    use({ "williamboman/mason.nvim" }) -- used to install langage servers
    use({ "williamboman/mason-lspconfig.nvim" }) -- bridges the gap between mason and lspconfig
    use({ "glepnir/lspsaga.nvim", branch = "main" })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end aftr all plugins
    if Packer_bootstrap then
        require("packer").sync()
    end
end)
