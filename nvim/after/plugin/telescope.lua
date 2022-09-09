local telescope = require('telescope')
local themes = require('telescope.themes')

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>Telescope help_tags<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "ignore_case", -- or "smart_case" or "respect_case"
        },
        harpoon = {
            file_browser = {
                theme = themes.get_dropdown()
            }
        }
    },
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        file_ignore_patterns = {
            "^node_modules$",
            "^vendor$",
            "^.git$",
            "^cache$",
            "^babel-cache$",
            "^tmp$",
            ".phar$",
        },
    }
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')
