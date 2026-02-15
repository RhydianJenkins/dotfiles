local dap_status, dap = pcall(require, "dap")
local dapui_status, dapui = pcall(require, "dapui")

if not dap_status then
    print("dap plugin not found")
    return
end

if not dapui_status then
    print("dap ui plugin not found")
    return
end

return {
    dap = dap,
    dapui = dapui,
}
