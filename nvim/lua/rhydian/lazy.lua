-- Usually ~/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    lockfile = "~/.lazy/lazy-lock.json", -- nixOS doesn't give us write access to .config
    spec = require("rhydian.plugins"),
    dev = {
        path = "~/code",
        patterns = {"supermaven-inc"},
        fallback = false,
    },
})
