local telescope = require("telescope")
local themes = require("telescope.themes")
local opts = { noremap = true, silent = true }
local theme = "ivy"

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "harpoon")

vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "ignore_case",
        },
    },
    pickers = {
        help_tags = {
            theme = theme,
        },
        lsp_references = {
            theme = theme,
        },
        live_grep = {
            theme = theme,
        },
        find_files = {
            theme = theme,
            hidden = true,
        },
    },
    defaults = {
        layout_strategy = "vertical",
        file_ignore_patterns = {
            "%.o",
            "%.a",
            "%.out",
            "%.class",
            "%.pdf",
            "%.mkv",
            "%.mp4",
            "%.zip",
            ".git",
            ".github",
            "node_modules",
            "vendor",
            "cache",
            "babel-cache",
            "tmp",
            ".phar$",
            ".min.js$",
            "assets/public/lib/*",
            "CHANGELOG*",
        },
    },
})

vim.keymap.set("n", "<leader>dot", function()
    require("telescope.builtin").find_files({
        cwd = "~/dotfiles",
        prompt_title = "~ Search Dotfiles ~",
    })
end, { desc = "Search dotfiles" })

vim.keymap.set("n", "<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(themes.get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "Fuzzily search in current buffer" })
