local present, lualine = pcall(require, "lualine")

if not present then
    print("lualine plugin not found")
    return
end

lualine.setup({
    sections = {
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
    },
})
