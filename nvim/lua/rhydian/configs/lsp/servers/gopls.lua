vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = true,
            completeUnimported = true,
            -- Disable built-in linting, rely on .golangci.yaml instead
            staticcheck = false,
            semanticTokens = true,
            -- Disable specific analyses
            analyses = {
                shadow = false,
                ST1000 = false, -- Package comment
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
        }
    }
})
