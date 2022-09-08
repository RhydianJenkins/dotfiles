local status, dap = pcall(require, "dap")
if (not status) then
    print('dap plugin not found')
    return
end

local phpDebugPath = os.getenv('HOME') .. '/Documents/vscode-php-debug/out/phpDebug.js'
local file = io.open(phpDebugPath, 'r')
if file ~= nil then
    io.close(file)
else
    print('cannot find php debug adapter ' .. phpDebugPath)
    return
end

dap.adapters.php = {
    type = 'executable',
    args = {phpDebugPath},
    command = 'nodejs',
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = 9009,
        log = true,
        stopOnEntry = false,
        pathMappings = {
            -- 'server' = 'local'
            ['/var/basekit'] = '/var/www/basekit',
        },
    },
}

