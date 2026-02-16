local present, treesitter = pcall(require, "nvim-treesitter")

if not present then
    print("treesitter plugin not found")
    return
end

treesitter.install({
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
    "twig",
    "yaml",
    "jsdoc",
})
