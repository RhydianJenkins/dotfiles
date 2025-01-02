local status, oil = pcall(require, "oil")

if not status then
    print("oil plugin not found")
    return
end

oil.setup({
    keymaps = {
        ["<C-p>"] = false,
        ["<C-s>"] = false,
        ["<leader>y"] = {
            desc = "Yank the full path to the clipboard",
            callback = require("oil.actions").copy_entry_path.callback,
        },
    },
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "<C-b>", function()
    if vim.bo.filetype == "oil" then
        oil.close()
    else
        oil.open()
    end
end, { desc = "Toggle file explore at current buffer" })
