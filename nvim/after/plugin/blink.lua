local present, blink = pcall(require, "blink.cmp")

if not present then
    print("blink.cmp plugin not found")
    return
end

blink.build():wait(60000)

blink.setup({
    keymap = {
        preset = "none",
        ["<C-n>"] = {
            function(cmp)
                if cmp.is_visible() then
                    return cmp.select_next()
                end
                return cmp.show()
            end,
            "fallback_to_mappings",
        },
        ["<C-p>"] = {
            function(cmp)
                if cmp.is_visible() then
                    return cmp.select_prev()
                end
                return cmp.show()
            end,
            "fallback_to_mappings",
        },
        ["<C-y>"] = { "select_and_accept" },
    },
    completion = {
        documentation = { auto_show = true },
    },
    cmdline = {
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
    },
    signature = { enabled = true },
})
