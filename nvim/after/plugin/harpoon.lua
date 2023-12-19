local present, harpoon = pcall(require, "harpoon")

if not present then
    print("harpoon plugin not found")
    return
end

---@param mode "n" | "i" | "v"
---@param key string
---@param operation string
---@param desc string
local function map(mode, key, operation, desc)
    local opts = { noremap = true, silent = true, desc = desc }
    vim.api.nvim_set_keymap(mode, key, operation, opts)
end

map("n", "<leader>m", '<cmd>lua require("harpoon.mark").add_file()<CR>', "Add mark")
map("n", "<leader>h", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', "Toggle quick menu")
map("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', "Navigate to mark 1")
map("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', "Navigate to mark 2")
map("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', "Navigate to mark 3")
map("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', "Navigate to mark 4")
map("n", "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', "Navigate to mark 5")

harpoon.setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 5,
    },
})
