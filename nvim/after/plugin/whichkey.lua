local present, whichkey = pcall(require, "which-key")

if not present then
    print("whichkey plugin not found")
    return
end

whichkey.setup({})
