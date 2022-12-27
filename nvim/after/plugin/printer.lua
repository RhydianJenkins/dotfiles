local present, printer = pcall(require, "printer")

if not present then
    print("printer plugin not found")
    return
end

printer.setup({
    keymap = "yP",
    behavior = "yank",
    yank_register = "+",
    formatters = {
        lua = function(text_inside, text_var)
            return string.format("print([[%s: ]] .. vim.inspect(%s))", text_inside, text_var)
        end,
    },
})

vim.keymap.set("n", "yp", "<Plug>(printer_print)iw", { desc = "[Y]ank [p]rint" })
