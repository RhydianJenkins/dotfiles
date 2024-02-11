local telescope_present, telescope_config = pcall(require, "telescope.config")
local harpoon_present, harpoon = pcall(require, "harpoon")

if not telescope_present then
    print("Telescope plugin required for harpoon")
    return
end

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


---@param harpoon_files table
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = telescope_config.file_previewer({}),
        sorter = telescope_config.generic_sorter({}),
    }):find()
end


harpoon.setup({})

map("<leader>m", function() harpoon:list():append() end, "Add mark")
map("<leader>h", function() toggle_telescope(harpoon:list()) end, "Toggle quick menu")
map("<leader>1", function() harpoon:list():select(1) end, "Navigate to mark 1")
map("<leader>2", function() harpoon:list():select(2) end, "Navigate to mark 2")
map("<leader>3", function() harpoon:list():select(3) end, "Navigate to mark 3")
map("<leader>4", function() harpoon:list():select(4) end, "Navigate to mark 4")
map("<leader>5", function() harpoon:list():select(5) end, "Navigate to mark 5")
