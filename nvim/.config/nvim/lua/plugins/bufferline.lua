-- 開いているバッファを画面上部にタブとして並べる（PhpStorm のエディタタブ風）
-- 切り替えは標準の [b / ]b、閉じるのは :bd
return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      -- Fern ドロワーを開いている間はタブをその右から並べる
      offsets = {
        { filetype = "fern", text = "Files", separator = true },
      },
    },
  },
}
