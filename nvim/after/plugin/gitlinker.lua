local present, gitlinker = pcall(require, "gitlinker")

if not present then
    print("gitlinker plugin not found")
    return
end

gitlinker.setup()

vim.keymap.set({ "n" }, "<leader>gh", gitlinker.link, { desc = "Copy [G]it[H]ub link to current line to clipboard" })
