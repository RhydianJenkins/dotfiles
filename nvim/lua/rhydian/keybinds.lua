local set = vim.keymap.set

set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })
set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
set("n", "<C-w><C-d>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer while keeping window" })
set("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Navigate tab left" })
set("n", "<Tab>", "<cmd>bn<CR>", { desc = "Navigate tab right" })
set("n", "<leader>%", "<C-W><C-v>", { desc = "[W]indow [v]ertical split" })
set("n", "<leader>-", "<cmd>vertical resize -30<CR>", { desc = "Decrease window horizontal size" })
set("n", "<leader>=", "<cmd>vertical resize +30<CR>", { desc = "Increase window horizontal size" })
set("n", "<leader>a", "ggVG", { desc = "Select all" })
set("n", "<leader>bt", function()
    require("gitsigns").toggle_current_line_blame()
end, { desc = "[B]lame [T]oggle" })
set("n", "<leader>wd", "<cmd>w<bar>%bd<bar>e#<bar>bd#<CR>", { desc = "Close all buffers except current one" })
set("n", "<leader>wr", "<C-W><C-r>", { desc = "[W]indow [r]otate" })
set("n", "<leader>ds", function()
    local wanted_kinds = { Function = true, Method = true }

    vim.lsp.buf.document_symbol({
        on_list = function(list)
            local items = vim.tbl_filter(function(item)
                return wanted_kinds[item.kind]
            end, list.items)

            if vim.tbl_isempty(items) then
                vim.notify("No functions or methods found", vim.log.levels.INFO)
                return
            end

            vim.fn.setloclist(0, {}, " ", { title = list.title, items = items })
            vim.cmd.lopen()

            local buf = vim.api.nvim_get_current_buf()
            local select_and_close = function()
                local idx = vim.fn.line(".")
                vim.cmd(idx .. "ll")
                vim.cmd.lclose()
            end
            vim.keymap.set("n", "<CR>", select_and_close, { buffer = buf, silent = true })
            vim.keymap.set("n", "<C-y>", select_and_close, { buffer = buf, silent = true })
        end,
    })
end, { desc = "Show [D]ocument [S]ymbols (functions/methods only)" })
set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
set(
    "n",
    "grd",
    vim.lsp.buf.definition,
    { desc = "[G]oto [D]efinition; a gd alias for consistency with other gr commands" }
)
set("n", "x", '"_x', { desc = "Remove char without copying to clipboard" })
set("n", '<leader>"', "<C-W><C-s>", { desc = "[W]indow horizontal [s]plit" })
set("x", "<leader>p", '"_dP', { desc = "[P]aste without replacing current register contents" })
set({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "[S]ave buffer" })
set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
