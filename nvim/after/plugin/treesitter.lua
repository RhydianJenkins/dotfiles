local present, treesitter = pcall(require, "nvim-treesitter")

if not present then
    print("treesitter plugin not found")
    return
end

local filetypes = { "twig" }

treesitter.install(filetypes)

vim.api.nvim_create_autocmd("FileType", {
    pattern = filetypes,
    callback = function()
        vim.treesitter.start()
    end,
})
