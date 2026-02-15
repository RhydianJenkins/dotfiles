local status_dap_go, dap_go = pcall(require, "dap-go")
if not status_dap_go then
    -- No dap-go debug adapter installed
    return
end

dap_go.setup()
