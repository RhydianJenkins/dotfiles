local present, symfony_utils = pcall(require, "symfony_utils")

if not present then
    print("symfony_utils plugin not found")
    return
end

symfony_utils.setup({
    class_dirs = {
        "connect",
        "library/BaseKit",
    },
    yaml_dirs = {
        "connect/app",
        "config/di",
    },
})

vim.keymap.set("n", "gsd", "<cmd>GoToSymfonyDefinition<CR>", { desc = "[G]o to [S]ymfony [D]efinition" })
