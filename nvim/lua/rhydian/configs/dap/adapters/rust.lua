local dap = require("dap")
local codeLldbPath = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb"

if vim.fn.filereadable(codeLldbPath) == 0 then
    -- No codelldb adapter installed
    return
end

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = codeLldbPath,
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
    },
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
