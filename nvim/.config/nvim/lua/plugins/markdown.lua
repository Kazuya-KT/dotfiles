return {
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text", "gitcommit" },
    init = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit" }
      vim.g.bullets_delete_last_bullet_if_empty = 1
      vim.g.bullets_checkbox_markers = " .oOX"
      vim.g.bullets_nested_checkboxes = 1
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    -- markdown / markdown_inline パーサは Neovim 同梱のものを使うので
    -- nvim-treesitter は不要。アイコンプロバイダのみ入れる
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
    },
    init = function()
      -- render-markdown は treesitter ハイライトが有効なバッファで動く。
      -- nvim-treesitter を入れていないので自前で start する
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
    opts = {
      -- 同梱されていないパーサ（html / latex / yaml）は使わない
      html = { enabled = false },
      latex = { enabled = false },
      yaml = { enabled = false },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
    -- 関数形式 (mkdp#util#install) は遅延読み込み時に E117 になるため文字列形式
    build = "cd app && npx --yes yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_close = 0
    end,
  },
}
