local present, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not present then
    print("treesitter plugin not found")
    return
end

treesitter_configs.setup({
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
        "jsdoc",
    },
    ignore_install = {},
    auto_install = true,
    sync_install = false,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 3000,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "s",
            node_incremental = "s",
            node_decremental = "S",
        },
    },
    modules = {},
})

vim.treesitter.language.register("twig", "html.twig.js.css")
