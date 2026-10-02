-- JetBrains New UI 風の colorscheme（PhpStorm の配色に合わせる）
return {
  "nickkadutskyi/jb.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme jb")
    -- jb.nvim では HCL の属性名が通常色になるので PhpStorm と同じピンクにする
    vim.api.nvim_set_hl(0, "hclAttributeName", { fg = "#c77dbb" })
  end,
}
