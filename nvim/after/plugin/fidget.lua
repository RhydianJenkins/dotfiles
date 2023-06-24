local present, fidget = pcall(require, "fidget")

if not present then
    print("fidget plugin not found")
    return
end

fidget.setup({})
