local status, dap = pcall(require, "dap")

if not status then
    print("dap plugin not found")
    return
end

local phpDebugPath = vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/php-debug-adapter"

if vim.fn.filereadable(phpDebugPath) == 0 then
    print("No PHP debug adapter found")
    return
end

dap.adapters.php = {
    type = "executable",
    args = { phpDebugPath },
    command = "bash",
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for xdebug",
        port = 9009,
        log = false,
        stopOnEntry = false,
        xdebugSettings = {
            max_children = 128,
            max_data = -1,
            max_depth = 3,
        },
        pathMappings = {
            -- 'server' = 'local'
            -- ["/var/basekit"] = "/var/basekit",
        },
    },
}
