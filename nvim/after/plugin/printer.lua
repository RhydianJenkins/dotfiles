local present, printer = pcall(require, "printer")

if not present then
    print("printer plugin not found")
    return
end

printer.setup({
    keymap = "yP",
    behavior = "yank",
    yank_register = "+",
})

vim.keymap.set("n", "yp", "<Plug>(printer_print)iw", { desc = "[Y]ank [p]rint" })
