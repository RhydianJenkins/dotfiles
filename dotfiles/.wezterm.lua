local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.check_for_updates = false
config.color_scheme = "tokyonight"
config.enable_tab_bar = false
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
