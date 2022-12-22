local present, whichkey = pcall(require, "which-key")

if not present then
    print("whichkey plugin not found")
    return
end

whichkey.setup({})

whichkey.register({
    ["<leader>"] = {
        t = { "Telescope/Test" },
        r = { "Replace/Rename" },
        w = { "Window controls" },
        m = { "Add harpoon mark" },
    },
})
