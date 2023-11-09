local present, smart_splits = pcall(require, "smart-splits")

if not present then
    print("smart splits plugin not found")
    return
end

smart_splits.setup({
    at_edge = "stop",
    cursor_follows_swapped_bufs = true,
})

-- moving between splits
vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)

-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", smart_splits.swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", smart_splits.swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", smart_splits.swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", smart_splits.swap_buf_right)
