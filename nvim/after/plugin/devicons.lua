local present, devicons = pcall(require, "nvim-web-devicons")

if not present then
    print("devicons plugin not found")
    return
end

devicons.setup {}
