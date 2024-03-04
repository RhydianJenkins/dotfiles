local present, symfony_utils = pcall(require, "symfony_utils")

if not present then
    print("symfony_utils plugin not found")
    return
end

symfony_utils.setup({
    class_dirs = {
        "connect/app/bookings/src",
        "connect/app/bookings/tests",
        "connect/app/bookings-checkout/src",
        "connect/app/bookings-checkout/tests",
        "connect/app/customer-manager/src",
        "connect/app/customer-manager/tests",
        "connect/app/dashboard/src",
        "connect/app/dashboard/tests",
        "connect/app/integrations/src",
        "connect/app/integrations/src",
        "connect/app/webhooks/src",
        "connect/app/webhooks/tests",
        "connect/src",
        "config/di/connect",
        "library/BaseKit",
        "plugins/ecommerce/src",
        "control/src",
        "editor/src",
        "api/src",
    },
    yaml_dirs = {
        "connect/app",
        "config/di",
    },
    enable_telescope = true,
})

vim.keymap.set("n", "gsd", "<cmd>GoToSymfonyDefinition<CR>", { desc = "[G]o to [S]ymfony [D]efinition" })
