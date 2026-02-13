local present, harpoon = pcall(require, "harpoon")

if not present then
    print("harpoon plugin not found")
    return
end

harpoon:setup()

vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end, { desc = "Add mark" })
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle quick menu" })
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Navigate to mark 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Navigate to mark 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Navigate to mark 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Navigate to mark 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Navigate to mark 5" })
