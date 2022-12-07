local status, dap = pcall(require, "dap")
if not status then
    print("dap plugin not found")
    return
end

local dap_configs = "rhydian.configs.dap."
require(dap_configs .. "php")
require(dap_configs .. "go")

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
    print("dap ui plugin not found")
    return
end

dapui.setup()

local dap_ghost_status, dap_ghost = pcall(require, "nvim-dap-virtual-text")
if not dap_ghost_status then
    print("dap ghost text plugin not found")
    return
end

dap_ghost.setup()
