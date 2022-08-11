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
        pathMappings = {
            -- 'server' = 'local'
            ['/var/basekit'] = '/var/www/basekit',
        },
    },
}

local dapui_status, dapui = pcall(require, "dapui")
if (not dapui_status) then
    print('dap ui plugin not found')
    return
end

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

local dap_ghost_status, dap_ghost = pcall(require, "nvim-dap-virtual-text")
if (not dap_ghost_status) then
    print('dap ghost text plugin not found')
    return
end

dap_ghost.setup()
