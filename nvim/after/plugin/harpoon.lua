local harpoon_present, harpoon = pcall(require, "harpoon")

if not harpoon_present then
    print("Harpoon plugin not found")
    return
end

---@param key string
---@param operation string|function
---@param desc string
local function map(key, operation, desc)
    local opts = { noremap = true, silent = true, desc = desc }
    vim.keymap.set("n", key, operation, opts)
end

harpoon.setup({})

map("<leader>m", function() harpoon:list():append() end, "Add mark")
map("<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle quick menu")
map("<leader>1", function() harpoon:list():select(1) end, "Navigate to mark 1")
map("<leader>2", function() harpoon:list():select(2) end, "Navigate to mark 2")
map("<leader>3", function() harpoon:list():select(3) end, "Navigate to mark 3")
map("<leader>4", function() harpoon:list():select(4) end, "Navigate to mark 4")
map("<leader>5", function() harpoon:list():select(5) end, "Navigate to mark 5")
