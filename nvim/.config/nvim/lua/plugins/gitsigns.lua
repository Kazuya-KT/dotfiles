-- カーソル行の git blame を行末に出す（PhpStorm の inline blame 風）
return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gb", "<Cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle inline blame" },
    { "<leader>gB", "<Cmd>Gitsigns blame_line full=true<CR>", desc = "Blame line (popup)" },
  },
  opts = {
    -- git add 前の新規ファイルも追加行として色を付ける
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text_pos = "eol",
      delay = 50,
    },
    current_line_blame_formatter = "    <author>, <author_time:%R> • <summary>",
  },
}
