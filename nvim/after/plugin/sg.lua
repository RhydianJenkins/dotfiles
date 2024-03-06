local present, sg = pcall(require, "sg")

if not present then
    print("sg plugin not found")
    return
end

sg.setup({})

vim.keymap.set("n", "<leader>sg", function()
    require("sg.extensions.telescope").fuzzy_search_results()
end, { desc = "[S]ource [G]raph search" })
