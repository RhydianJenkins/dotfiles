require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "php",
        "javascript",
        "typescript",
        "lua",
        "rust",
        "markdown",
        "markdown_inline",
        "vimdoc",
        "vim",
        "go",
        "html",
        "json",
        "make",
        "regex",
        "scss",
        "svelte",
        "twig",
        "yaml",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,  -- also highlight non-bracket delimiters
        max_file_lines = 5000, -- do not enable for files with more than n lines
        -- disable = { "jsx", "cmp" } -- list of languages you want to ignore
        -- colors = {} -- table of hex colours
        -- termcoors = {} -- table of color name strings
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "s",
            node_incremental = "s",
            node_decremental = "S",
        },
    },
})
