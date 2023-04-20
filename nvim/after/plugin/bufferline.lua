local bufferline_present, bufferline = pcall(require, "bufferline")

if not bufferline_present then
    print("bufferline plugin not found")
    return
end

local options = {
    hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
    },
}

bufferline.setup({
    options = options,
})
