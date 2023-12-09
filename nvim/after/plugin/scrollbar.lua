local present, scrollbar = pcall(require, "scrollbar")

if not present then
    print("scrollbar plugin not found")
    return
end

scrollbar.setup({})
