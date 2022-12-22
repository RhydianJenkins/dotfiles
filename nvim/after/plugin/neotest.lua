local present, neotest = pcall(require, "neotest")

if not present then
    print("neotest plugin not found")
    return
end

-- Disabled - too many tests to run at once inside of neovim!
-- vim.keymap.set("n", "<leader>ta", function()
-- require("neotest").run.run({ suite = true })
-- end, { desc = "[T]est [a]ll" })

-- vim.keymap.set("n", "<leader>td", function()
-- require("neotest").run.run({ strategy = "dap" })
-- end, { desc = "[T]est [d]ebug" })

vim.keymap.set("n", "<leader>tf", function()
    require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "[T]est [f]ile" })

vim.keymap.set("n", "<leader>tl", function()
    require("neotest").neotest.run.run_last()
end, { desc = "[T]est [l]ast" })

vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<CR>", { desc = "[T]est [v]isit" })

vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", { desc = "[T]est [n]earest" })

vim.keymap.set("n", "<leader>ts", function()
    require("neotest").summary.toggle()
end, { desc = "[T]est [s]ummary toggle" })

vim.keymap.set("n", "[t", function()
    require("neotest").jump.prev()
end, { desc = "Jump to previous test" })

vim.keymap.set("n", "]t", function()
    require("neotest").jump.next()
end, { desc = "Jump to next test" })

neotest.setup({
    adapters = {
        require("neotest-plenary"),
        require("neotest-phpunit")({
            phpunit_cmd = function()
                local vendorPaths = {
                    "vendor/bin/phpunit",
                    "/var/www/basekit/vendor/bin/phpunit",
                }

                for _, path in ipairs(vendorPaths) do
                    local file = io.open(path, "r")
                    if file ~= nil then
                        io.close(file)
                        return path
                    end
                end
            end,
        }),
        require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = function()
                return vim.fn.getcwd()
            end,
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "js", "ts", "jsx", "tsx", "php" },
        }),
    },
})
