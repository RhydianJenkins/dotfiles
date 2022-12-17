local opts = { noremap = true, silent = true }

-- Space <leader> key
vim.g.mapleader = " "

-- CTRL + a to select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- CTRL + s to save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)
vim.keymap.set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", opts)

-- CTRL + w to close current buffer
vim.keymap.set("n", "<C-w>", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- Shift + Y to yank to the end of the line
vim.keymap.set("n", "S-Y", "y$", opts)

-- Tab navigation of buffers
vim.keymap.set("n", "<Tab>", "<cmd>bn<CR>", opts)
vim.keymap.set("n", "<S-tab>", "<cmd>bprevious<CR>", opts)

-- Center after page up/down
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-W><C-h>", opts)
vim.keymap.set("n", "<leader>j", "<C-W><C-j>", opts)
vim.keymap.set("n", "<leader>k", "<C-W><C-k>", opts)
vim.keymap.set("n", "<leader>l", "<C-W><C-l>", opts)
vim.keymap.set("n", "<leader>ws", "<C-W><C-s>", opts)
vim.keymap.set("n", "<leader>wv", "<C-W><C-v>", opts)
vim.keymap.set("n", "<leader>wq", "<C-W><C-q>", opts)
vim.keymap.set("n", "<leader>wo", "<C-W><C-o>", opts)
vim.keymap.set("n", "<leader>wr", "<C-W><C-r>", opts)

-- Resize window
vim.keymap.set("n", "<leader>=", "<cmd>vertical resize +30<CR>", opts)
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -30<CR>", opts)

-- Replace line above/below
vim.keymap.set("n", "<A-j>", "<cmd>move +1<CR>==", opts)
vim.keymap.set("n", "<A-k>", "<cmd>move -2<CR>==", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- paste without replacing current register contents
vim.keymap.set("x", "<leader>p", '"_dP', opts)

-- Diagnostics
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- DAP
vim.keymap.set("n", "<F1>", "<cmd>lua require'dapui'.eval()<CR>")
vim.keymap.set("n", "<F4>", "<cmd>lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F9>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_out()<CR>")
