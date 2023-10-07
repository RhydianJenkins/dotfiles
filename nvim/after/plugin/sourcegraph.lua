local present, sg = pcall(require, "sg")

if not present then
    print("sourcegraph plugin not found")
    return
end

if not require("sg.auth").valid() then
    vim.print("Sourcegraph auth not valid. Try :SourcegraphLogin")
    return
end

sg.setup({})

-- requires telescope to be installed
vim.api.nvim_set_keymap(
    "n",
    "<leader>sg",
    "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
    { noremap = true, silent = true }
)
