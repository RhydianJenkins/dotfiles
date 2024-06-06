local set = vim.keymap.set
local del = vim.keymap.del

-- CTRL + a to select all
set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- CTRL + s to save
set("n", "<C-s>", "<cmd>w<CR>", { desc = "[S]ave buffer" })
set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "[S]ave buffer" })

-- Shift + Y to yank to the end of the line
set("n", "S-Y", "y$", { desc = "[Y]ank to end of line" })

-- Tab navigation of buffers
set("n", "<Tab>", "<cmd>bn<CR>", { desc = "Navigate tab right" })
set("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Navigate tab left" })

-- Center after page up/down
set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })

-- Window manipulation
set("n", '<leader>"', "<C-W><C-s>", { desc = "[W]indow horizontal [s]plit" })
set("n", "<leader>%", "<C-W><C-v>", { desc = "[W]indow [v]ertical split" })
set("n", "<leader>wo", "<C-W><C-o>", { desc = "Close all other windows" })
set("n", "<leader>wr", "<C-W><C-r>", { desc = "[W]indow [r]otate" })
set("n", "<leader>wd", "<cmd>w<bar>%bd<bar>e#<bar>bd#<CR>", { desc = "Close all buffers except current one" })
set("n", "<C-w>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer" })
del("n", "<C-w><C-d>")
del("n", "<C-w>d")

-- Resize window
set("n", "<leader>=", "<cmd>vertical resize +30<CR>", { desc = "Increase window horizontal size" })
set("n", "<leader>-", "<cmd>vertical resize -30<CR>", { desc = "Decrease window horizontal size" })

-- Replace line above/below
set("n", "<A-j>", "<cmd>move +1<CR>==", { desc = "Move block down" })
set("n", "<A-k>", "<cmd>move -2<CR>==", { desc = "Move block up" })
set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- paste without replacing current register contents
set("x", "<leader>p", '"_dP', { desc = "[P]aste without replacing current register contents" })

-- Diagnostics
set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Next diagnostic" })
set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Previous diagnostic" })

-- DAP
set("n", "<F1>", "<cmd>lua require'dapui'.eval()<CR>", { desc = "Debug evaluate" })
set("n", "<F4>", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Debug toggle" })
set("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debug toggle breakpoint" })
set("n", "<F6>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debug continue" })
set("n", "<F9>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debug step over" })
set("n", "<F10>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debug step into" })
set("n", "<F11>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debug step out" })

-- Delete, don't cut
set("n", "x", '"_x', { desc = "Remove char without copying to clipboard" })
