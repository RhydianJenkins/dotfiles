local telescope = require("telescope")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local opts = { noremap = true, silent = true }
local theme = "ivy"

pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "harpoon")

local largeFilesIgnoringPreviewer = function(filepath, bufnr, inputOpts)
    opts = inputOpts or {}

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
            return
        end

        if stat.size > 100000 then
            return
        else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
    end)
end


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
        grep_string = {
            theme = theme,
        },
        live_grep = {
            theme = theme,
        },
        find_files = {
            theme = theme,
            hidden = true,
        },
        command_history = { sorter = sorters.fuzzy_with_index_bias() },
    },
    defaults = {
        buffer_previewer_maker = largeFilesIgnoringPreviewer,
        layout_strategy = "vertical",
        file_ignore_patterns = {
            "%.a",
            "%.class",
            "%.mkv",
            "%.mp4",
            "%.o",
            "%.out",
            "%.pdf",
            "%.zip",
            ".git",
            ".github",
            ".min.js$",
            ".phar$",
            "CHANGELOG*",
            "assets/public/lib/*",
            "babel-cache",
            "cache",
            "control/public/js/*.js",
            "control/public/js/ext-3.3.0/**",
            "control/public/js/jquery-ui-1.10.3/**",
            "control/public/js/jquery-ui-1.12.1.custom/**",
            "node_modules",
            "tmp",
            "vendor",
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
    local word = vim.fn.expand("<cword>")
    require("telescope.builtin").grep_string({
        search = word,
        default_text = word,
    })
end, { desc = "Perform a global search for word under cursor" })

vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<CR>", opts)
