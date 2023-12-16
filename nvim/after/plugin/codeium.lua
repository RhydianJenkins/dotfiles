local present, codeium = pcall(require, "codeium")

if not present then
    print("codeium plugin not found")
    return
end

codeium.setup({})
