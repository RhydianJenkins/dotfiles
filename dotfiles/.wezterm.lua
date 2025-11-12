local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.check_for_updates = false
config.color_scheme = "tokyonight"
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.front_end = "OpenGL"

config.keys = {
    -- Trigger debug overlay
    {
        key = 'L',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ShowDebugOverlay,
    },

    -- Vim-like navigation for copy mode
    {
        key = 'c',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.ActivateCopyMode,
    },

    -- Spawn command palette
    {
        key = 'p',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivateCommandPalette,
    },
}

return config
