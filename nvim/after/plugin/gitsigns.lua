local gitsigns_present, gitsigns = pcall(require, "gitsigns")

if not gitsigns_present then
    print("gitsigns plugin not found")
    return
end

gitsigns.setup({
    current_line_blame_opts = {
        delay = 100,
    },
})
