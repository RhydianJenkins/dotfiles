require("git-worktree").setup({
    --change_directory_command = <str> -- default: 'cd',
    --update_on_change = <boolean> -- default: true,
    --update_on_change_command = <str> -- default: 'e .',
    --clearjumps_on_change = <boolean> -- default: true,
    --autopush = <boolean> -- default: false,
})

require("telescope").load_extension("git_worktree")

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

local Worktree = require("git-worktree")
Worktree.on_tree_change(function(op, metadata)
    if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    end
end)

-- keybinds
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap(
    "n",
    "<leader>wt",
    "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>cwt",
    "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    opts
)
