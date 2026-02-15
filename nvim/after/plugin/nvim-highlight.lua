local present, nvimHighlight = pcall(require, "nvim-highlight")

if not present then
    print("nvim-highlight plugin not found")
    return
end

nvimHighlight.setup()
