local telescope = require('telescope')

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>lua require(\'telescope\').extensions.frecency.frecency()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Telescope lsp_code_actions<CR>', opts)

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "ignore_case", -- or "smart_case" or "respect_case"
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        file_ignore_patterns = {
            "^node_modules/",
            "^.git/",
            "^.vender/"
        },
    }
}

telescope.load_extension('fzf')
