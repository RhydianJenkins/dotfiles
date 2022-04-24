local telescope = require('telescope')

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
    }
}

telescope.load_extension('fzf')
