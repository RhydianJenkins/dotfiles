local status, conform = pcall(require, "conform")
if not status then
    print("conform plugin not found")
    return
end

conform.setup({
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
        -- lua = { "stylua" },
        -- Use a sub-list to run only the first available formatter
        php = { { "easy-coding-standard" } },
        ["*"] = { "codespell" },
    },
})
