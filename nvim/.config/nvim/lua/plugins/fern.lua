return {
    {
      "lambdalisue/vim-fern",
      dependencies = {
        "lambdalisue/vim-fern-hijack",
        "lambdalisue/vim-fern-renderer-nerdfont",
        "lambdalisue/vim-nerdfont",
        "lambdalisue/vim-glyph-palette",
      },
      keys = {
        { "<leader>fe", "<Cmd>Fern . -drawer -toggle -reveal=%<CR>", desc = "Fern drawer" },
      },
      init = function()
        vim.g["fern#default_hidden"] = 1
        vim.g["fern#drawer_width"] = 40
        -- ファイル種別のアイコンを出す。インデントの縦線は nerdfont 側の設定で出す
        vim.g["fern#renderer"] = "nerdfont"
        vim.g["fern#renderer#nerdfont#indent_markers"] = 1
      end,
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "fern",
          callback = function()
            local opts = { buffer = true }
            vim.keymap.set("n", "<CR>", "<Plug>(fern-action-open-or-expand)", opts)
            vim.keymap.set("n", "l", "<Plug>(fern-action-expand)", opts)
            vim.keymap.set("n", "h", "<Plug>(fern-action-collapse)", opts)
            -- アイコンにファイル種別ごとの色を付ける
            vim.fn["glyph_palette#apply"]()
          end,
        })
      end,
    }
}
