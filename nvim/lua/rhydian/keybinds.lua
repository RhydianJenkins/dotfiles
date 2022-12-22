vim.g.mapleader = " "

-- CTRL + a to select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- CTRL + s to save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "[S]ave buffer" })
vim.keymap.set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", { desc = "[S]ave buffer" })

-- CTRL + w to close current buffer
vim.keymap.set("n", "<C-w>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current buffer" })

-- Shift + Y to yank to the end of the line
vim.keymap.set("n", "S-Y", "y$", { desc = "[Y]ank to end of line" })

-- Tab navigation of buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<CR>", { desc = "Navigate tab right" })
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<CR>", { desc = "Navigate tab left" })

-- Center after page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down" })

-- Window manipulation
vim.keymap.set("n", "<leader>h", "<C-W><C-h>", { desc = "Navigate window left" })
vim.keymap.set("n", "<leader>j", "<C-W><C-j>", { desc = "Navigate window down" })
vim.keymap.set("n", "<leader>k", "<C-W><C-k>", { desc = "Navigate window up" })
vim.keymap.set("n", "<leader>l", "<C-W><C-l>", { desc = "Navigate window right" })
vim.keymap.set("n", "<leader>ws", "<C-W><C-s>", { desc = "[W]indow horizontal [s]plit" })
vim.keymap.set("n", "<leader>wv", "<C-W><C-v>", { desc = "[W]indow [v]ertical split" })
vim.keymap.set("n", "<leader>wq", "<C-W><C-q>", { desc = "[W]indow [q]uit" })
vim.keymap.set("n", "<leader>wo", "<C-W><C-o>", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wr", "<C-W><C-r>", { desc = "[W]indow [r]otate" })

-- Resize window
vim.keymap.set("n", "<leader>=", "<cmd>vertical resize +30<CR>", { desc = "Increase window horizontal size" })
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -30<CR>", { desc = "Decrease window horizontal size" })

-- Replace line above/below
vim.keymap.set("n", "<A-j>", "<cmd>move +1<CR>==", { desc = "Move block down" })
vim.keymap.set("n", "<A-k>", "<cmd>move -2<CR>==", { desc = "Move block up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- paste without replacing current register contents
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "[P]aste without replacing current register contents" })

-- Diagnostics
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Next diagnostic" })
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Previous diagnostic" })

-- DAP
vim.keymap.set("n", "<F1>", "<cmd>lua require'dapui'.eval()<CR>", { desc = "Debug evaluate" })
vim.keymap.set("n", "<F4>", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Debug toggle" })
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debug toggle breakpoint" })
vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debug continue" })
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debug step over" })
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debug step into" })
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debug step out" })
