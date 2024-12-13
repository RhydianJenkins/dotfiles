local status = pcall(require, "dap")
if not status then
    print("dap plugin not found")
    return
end

local dap_configs = "rhydian.configs.dap."
require(dap_configs .. "php")
require(dap_configs .. "go")
require(dap_configs .. "rust")

local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
    print("dap ui plugin not found")
    return
end

dapui.setup()
