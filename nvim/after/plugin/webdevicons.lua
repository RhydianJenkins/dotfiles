local present, icons = pcall(require, "nvim-web-devicons")

if not present then
    print("nvim web dev icons plugin not found")
    return
end

icons.setup({})
