local status, colorizer = pcall(require, "colorizer")

if not status then
    print("colorizer plugin not found")
    return
end

colorizer.setup()
