local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    print("NvimTree not found")
    return
end

local on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local map = function(key, fn, desc)
        vim.keymap.set("n", key, fn, {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        })
    end

    map("<CR>", api.node.open.no_window_picker, "Open: No window Picker")
    map("<Tab>", api.node.open.preview, "Open Preview")
    map("-", api.node.navigate.parent_close, "Close Directory")
    map("a", api.fs.create, "Add/Create")
    map("c", api.fs.copy.node, "Copy")
    map("d", api.fs.remove, "Delete")
    map("E", api.tree.expand_all, "Expand All")
    map("e", api.fs.rename_basename, "Rename: Basename")
    map("?", api.tree.toggle_help, "Help")
    map("gy", api.fs.copy.absolute_path, "Copy Absolute Path")
    map("H", api.tree.toggle_hidden_filter, "Toggle Dotfiles")
    map("I", api.tree.toggle_gitignore_filter, "Toggle Git Ignore")
    map("J", api.node.navigate.sibling.last, "Last Sibling")
    map("K", api.node.navigate.sibling.first, "First Sibling")
    map("o", api.node.open.no_window_picker, "Open: No Window Picker")
    map("O", api.node.open.no_window_picker, "Open: No Window Picker")
    map("p", api.fs.paste, "Paste")
    map("P", api.node.navigate.parent, "Parent Directory")
    map("q", api.tree.close, "Close")
    map("r", api.fs.rename, "Rename")
    map("R", api.tree.reload, "Refresh")
    map("U", api.tree.toggle_custom_filter, "Toggle Hidden")
    map("W", api.tree.collapse_all, "Collapse")
    map("x", api.fs.cut, "Cut")
    map("y", api.fs.copy.filename, "Copy Name")
    map("Y", api.fs.copy.relative_path, "Copy Relative Path")
    map("<2-LeftMouse>", api.node.open.no_window_picker, "Open: No Window Picker")
    map("<2-RightMouse>", api.tree.change_root_to_node, "CD")
end

nvimtree.setup({
    on_attach = on_attach,
    disable_netrw = true,
    view = {
        width = 70,
    },
    renderer = {
        group_empty = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            resize_window = true,
        },
    },
})

vim.keymap.set("n", "<C-b>", function()
    vim.cmd("NvimTreeFindFileToggle")
end, { desc = "Toggle nvim tree at buffer location" })
