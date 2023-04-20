local bufferline_present, bufferline = pcall(require, "bufferline")

if not bufferline_present then
    print("bufferline plugin not found")
    return
end

local options = {
    diagnostics = "nvim_lsp",
    hover = {
        enabled = true,
        reveal = { "close" },
    },
}

bufferline.setup({
    options = options,
})
