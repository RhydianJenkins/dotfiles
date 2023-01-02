local present, dap_go = pcall(require, "dap-go")

if not present then
    print("dap go debug adapter plugin not found")
    return
end

dap_go.setup()
