local dap_status, dap = pcall(require, "dap")
local dapui_status, dapui = pcall(require, "dapui")

if not dap_status then
    print("dap plugin not found")
    return
end

require("rhydian.configs.dap.adapters")

vim.keymap.set("n", "<F5>", dap.toggle_breakpoint, { desc = "Debug toggle breakpoint" })
vim.keymap.set("n", "<F6>", dap.continue, { desc = "Debug continue" })
vim.keymap.set("n", "<F9>", dap.step_over, { desc = "Debug step over" })
vim.keymap.set("n", "<F10>", dap.step_into, { desc = "Debug step into" })
vim.keymap.set("n", "<F11>", dap.step_out, { desc = "Debug step out" })

if not dapui_status then
    print("dap ui plugin not found")
    return
end

dapui.setup()

vim.keymap.set("n", "<F1>", dapui.eval, { desc = "Debug evaluate" })
vim.keymap.set("n", "<F4>", dapui.toggle, { desc = "Debug toggle" })
