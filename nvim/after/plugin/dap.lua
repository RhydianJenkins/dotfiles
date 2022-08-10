local status, dap = pcall(require, "dap")
if (not status) then
    print('dap plugin not found')
    return
end

dap.adapters.php = {
    type = 'executable',
    command = 'nodejs',
    args = {"/home/rhydian/Documents/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9009',
        log = true,
        serverSourceRoot = '/var/basekit',
        localSourceRoot = '/var/www/basekit',
    },
}

local dapui_status, dapui = pcall(require, "dapui")
if (not dapui_status) then
    print('dap ui plugin not found')
    return
end

dapui.setup()
