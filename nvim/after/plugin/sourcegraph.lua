local present, sg = pcall(require, "sg")

if not present then
    print("Sourcegraph plugin not found")
    return
end

sg.setup({
    enable = true,
    accept_tos = true,
})

vim.api.nvim_set_keymap(
    "n",
    "<leader>sg",
    "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
    { noremap = true, silent = true }
)
