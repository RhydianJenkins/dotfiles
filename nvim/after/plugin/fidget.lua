local fidget_present, fidget = pcall(require, "fidget")

if not fidget_present then
    print("fidget plugin not found")
    return
end

fidget.setup()
