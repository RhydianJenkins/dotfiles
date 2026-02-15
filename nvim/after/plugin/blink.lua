local status, blink = pcall(require, "blink.cmp")

if not status then
    print("blink.cmp plugin not found")
    return
end

blink.setup({
    keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept", "fallback" },
    },
    snippets = { preset = "luasnip" },
    completion = {
        documentation = {
            auto_show = true,
            window = { border = "rounded" },
        },
        menu = {
            border = "rounded",
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust" },
})
