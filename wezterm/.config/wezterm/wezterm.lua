local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"

return config
