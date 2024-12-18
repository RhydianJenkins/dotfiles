local status, oil = pcall(require, "oil")

if not status then
    print("oil plugin not found")
    return
end

oil.setup({
    keymaps = {
        ["<C-p>"] = false,
        ["<C-s>"] = false,
    },
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "<C-b>", oil.toggle_float, { desc = "Toggle file explore at current buffer" })
