require("nvim-treesitter.configs").setup({
    ensure_installed = { "php", "javascript", "typescript", "lua", "rust", "help" },
    auto_install = true,
    highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- also highlight non-bracket delimiters
        max_file_lines = 5000, -- do not enable for files with more than n lines
        -- disable = { "jsx", "cmp" } -- list of languages you want to ignore
        -- colors = {} -- table of hex colours
        -- termcoors = {} -- table of color name strings
    },
})
