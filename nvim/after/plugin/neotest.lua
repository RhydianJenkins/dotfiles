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
    neotest.run.run(vim.fn.expand("%"))
    neotest.output.open()
end, { desc = "[T]est [f]ile" })

vim.keymap.set("n", "<leader>tl", function()
    neotest.run.run_last()
end, { desc = "[T]est [l]ast" })

vim.keymap.set("n", "<leader>to", function()
    neotest.output.open()
end, { desc = "[T]est [o]pen" })

vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<CR>", { desc = "[T]est [v]isit" })

vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", { desc = "[T]est [n]earest" })

vim.keymap.set("n", "<leader>ts", function()
    neotest.summary.toggle()
end, { desc = "[T]est [s]ummary toggle" })

vim.keymap.set("n", "[t", function()
    neotest.jump.prev()
end, { desc = "Jump to previous test" })

vim.keymap.set("n", "]t", function()
    neotest.jump.next()
end, { desc = "Jump to next test" })

---@param paths table<string>
---@return string|nil
local function find_path_that_exists(paths)
    for _, path in ipairs(paths) do
        local file = io.open(path, "r")
        if file ~= nil then
            io.close(file)
            return path
        end
    end

    print("No path found in " .. vim.inspect(paths))
    return nil
end

neotest.setup({
    adapters = {
        require("neotest-plenary"),
        require("neotest-rust")({
            -- requires cargo-nextest installed on system
            args = { "--no-capture" },
        }),
        require("neotest-phpunit")({
            root_files = { "composer.json", "phpunit.xml", "phpunit.xml.dist", ".github" },
            filter_dirs = { "vendor" },
            env = {
                CONTAINER = "basekit-php-1",
                REMOTE_PHPUNIT_BIN = "vendor/bin/phpunit",
            },
            phpunit_cmd = function()
                return find_path_that_exists({
                    "~/code/runtests",
                    vim.fn.getcwd() .. "/vendor/bin/phpunit",
                    "/var/basekit/vendor/bin/phpunit",
                })
            end,
        }),
        require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = function()
                return find_path_that_exists({
                    "~/code/basekit/connect/jest.config.js",
                    "~/code/basekit/connect/jest.config.ts",
                    vim.fn.getcwd() .. "/jest.config.js",
                    vim.fn.getcwd() .. "/jest.config.ts",
                })
            end,
            env = { CI = true },
        }),
        require("neotest-vim-test")({
            ignore_file_types = { "js", "ts", "jsx", "tsx", "php" },
        }),
        require("neotest-go"),
    },
})
