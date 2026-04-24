local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- ================================
--  フォント設定
-- ================================
local options = {
  font = wezterm.font("HackGen Console NF", {
    weight = "Regular",
    stretch = "Normal",
    style = "Normal",
  }),
  font_size = 14,

-- ================================
--  ウィンドウ関連設定
-- ================================
  initial_cols = 230,
  initial_rows = 200,
  window_decorations = "RESIZE",
  window_background_opacity = 0.75,
  macos_window_background_blur = 20,
  use_ime = true,

-- ================================
--  ウィンドウ外観（背景・装飾）
-- ================================
  window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
  },

  window_background_gradient = {
    colors = {
      "#0f0c29",
      "#302b63",
      "#24243e",
    },
    orientation = "Vertical",
    interpolation = "Linear",
    blend = "Rgb",
    noise = 64,
  },

-- ================================
--  タブバー設定
-- ================================
  show_new_tab_button_in_tab_bar = false,
  show_close_tab_button_in_tabs = false,

  colors = {
    tab_bar = {
      inactive_tab_edge = "none",
    },
  },
} -- options END --

for k, v in pairs(options) do
  config[k] = v
end

-- ================================
--  タブタイトル表示
-- ================================
wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#3CB371"
    foreground = "#FFFFFF"
  end

  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

return config

