local status, supermaven = pcall(require, "supermaven-nvim")
if not status then
    print("supermaven plugin not found")
    return
end

supermaven.setup({
    disable_inline_completion = true,
    disable_keymaps = true,
    binary_path = "~/.supermaven",
})
