local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local options = {
	initial_cols = 200,
	initial_rows = 100,
	font_size = 14,
	color_scheme = 'AdventureTime',
}

for k, v in pairs(options) do
	config[k] = v
end

return config


