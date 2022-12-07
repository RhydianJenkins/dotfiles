local present, bufferline = pcall(require, "bufferline")

if not present then
    print("bufferline plugin not found")
    return
end

bufferline.setup({})
