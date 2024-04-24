local keymap = vim.keymap.set

-- CTRL + a to select all
keymap("n", "<C-a>", "ggVG", { desc = "Select all" })

-- CTRL + s to save
keymap("n", "<C-s>", "<cmd>w<CR>", { desc = "[S]ave buffer" })
keymap({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "[S]ave buffer" })

-- CTRL + w to close current buffer
keymap("n", "<C-w>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer" })

-- Shift + Y to yank to the end of the line
keymap("n", "S-Y", "y$", { desc = "[Y]ank to end of line" })

-- Tab navigation of buffers
keymap("n", "<Tab>", "<cmd>bn<CR>", { desc = "Navigate tab right" })
keymap("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Navigate tab left" })

-- Center after page up/down
keymap("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Page down" })

-- Window manipulation
keymap("n", '<leader>"', "<C-W><C-s>", { desc = "[W]indow horizontal [s]plit" })
keymap("n", "<leader>%", "<C-W><C-v>", { desc = "[W]indow [v]ertical split" })
keymap("n", "<leader>wo", "<C-W><C-o>", { desc = "Close all other windows" })
keymap("n", "<leader>wr", "<C-W><C-r>", { desc = "[W]indow [r]otate" })

-- Resize window
keymap("n", "<leader>=", "<cmd>vertical resize +30<CR>", { desc = "Increase window horizontal size" })
keymap("n", "<leader>-", "<cmd>vertical resize -30<CR>", { desc = "Decrease window horizontal size" })

-- Replace line above/below
keymap("n", "<A-j>", "<cmd>move +1<CR>==", { desc = "Move block down" })
keymap("n", "<A-k>", "<cmd>move -2<CR>==", { desc = "Move block up" })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- paste without replacing current register contents
keymap("x", "<leader>p", '"_dP', { desc = "[P]aste without replacing current register contents" })

-- Diagnostics
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Next diagnostic" })
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Previous diagnostic" })

-- DAP
keymap("n", "<F1>", "<cmd>lua require'dapui'.eval()<CR>", { desc = "Debug evaluate" })
keymap("n", "<F4>", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Debug toggle" })
keymap("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debug toggle breakpoint" })
keymap("n", "<F6>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debug continue" })
keymap("n", "<F9>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debug step over" })
keymap("n", "<F10>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debug step into" })
keymap("n", "<F11>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debug step out" })

-- Delete, don't cut
keymap("n", "x", '"_x', { desc = "Remove char without copying to clipboard" })
