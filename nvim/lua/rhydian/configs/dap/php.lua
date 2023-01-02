local dap = require("dap")
local phpDebugPath = os.getenv("HOME") .. "/Documents/vscode-php-debug/out/phpDebug.js"
local file = io.open(phpDebugPath, "r")

if file ~= nil then
    io.close(file)
else
    -- adapter can't be found
    -- see debug README for help installing the vscode php debugger
    return
end

dap.adapters.php = {
    type = "executable",
    args = { phpDebugPath },
    command = "nodejs",
}

dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for xdebug",
        port = 9009,
        log = false,
        stopOnEntry = false,
        pathMappings = {
            -- 'server' = 'local'
            ["/var/basekit"] = "/var/www/basekit",
        },
    },
}
