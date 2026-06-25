local status_dap_go, dap_go = pcall(require, "dap-go")
if not status_dap_go then
    -- No dap-go debug adapter installed
    return
end

dap_go.setup()

vim.keymap.set("n", "<F7>", function()
    if vim.fn.expand("%"):match("_test%.go$") then
        dap_go.debug_test()
    else
        dap_go.debug_last_test()
    end
end, { desc = "Debug test under cursor / last test" })
