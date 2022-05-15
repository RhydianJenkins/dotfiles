local present, nvimgps = pcall(require, "nvim-gps")

if not present then
    print("nvim-gps plugin not found")
    return
end

nvimgps.setup()
