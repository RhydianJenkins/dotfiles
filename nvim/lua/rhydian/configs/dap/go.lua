local status, dap_go = pcall(require, "dap-go")
if (not status) then
    print('dap go debug adapter plugin not found')
    return
end

dap_go.setup()
