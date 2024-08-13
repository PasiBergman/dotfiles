local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
--config.font = wezterm.font("Menlo")
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13.0
-- config.color_scheme = "tokyonight-storm"
config.color_scheme = "catppuccin-mocha"

-- config.enable_kitty_keyboard = true
--
-- Allow use of left Option key on macOS to send regular keys, eg Shift-Option-8 -> '{' on Finnish keyboard
config.send_composed_key_when_left_alt_is_pressed = true

config.keys = {
	-- CTRL-SHIFT-l activates the debug overlay
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
}

config.automatically_reload_config = true

config.initial_cols = 200
config.initial_rows = 80

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

return config
