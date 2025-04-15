local status, dap_go = pcall(require, "dap-go")
if not status then
    -- No dap-go debug adapter installed
    return
end

dap_go.setup()
