local dapui_status, dapui = pcall(require, "dapui")

if not dapui_status then
    print("dap ui plugin not found")
    return
end

dapui.setup()

require("rhydian.configs.dap.adapters")
