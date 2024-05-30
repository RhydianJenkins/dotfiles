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

for i = 1, 5 do
    map("<leader>" .. i, function() harpoon:list():select(i) end, "Navigate to mark " .. i)
end
