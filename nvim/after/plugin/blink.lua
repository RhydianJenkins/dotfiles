local present, blink = pcall(require, "blink.cmp")

if not present then
    print("blink.cmp plugin not found")
    return
end

blink.build():wait(60000)

blink.setup({
    keymap = {
        preset = "default", -- C-n, C-p, C-y are all set by default
        ["<Tab>"] = { "fallback" },
        ["<S-Tab>"] = { "fallback" },
        ["<CR>"] = { "fallback" },
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
