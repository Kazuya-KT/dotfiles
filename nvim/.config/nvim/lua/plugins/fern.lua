return {
    {
      "lambdalisue/vim-fern",
      dependencies = {
        "lambdalisue/vim-fern-hijack",
      },
      keys = {
        { "<leader>fe", "<Cmd>Fern . -drawer -toggle -reveal=%<CR>", desc = "Fern drawer" },
      },
      init = function()
        vim.g["fern#default_hidden"] = 1
        vim.g["fern#drawer_width"] = 40
        vim.g["fern#renderer#default#leading"] = "│ "
        vim.g["fern#renderer#default#collapsed_symbol"] = "▶ "
        vim.g["fern#renderer#default#expanded_symbol"] = "▼ "
        vim.g["fern#renderer#default#leaf_symbol"] = "  "
      end,
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "fern",
          callback = function()
            local opts = { buffer = true }
            vim.keymap.set("n", "<CR>", "<Plug>(fern-action-open-or-expand)", opts)
            vim.keymap.set("n", "l", "<Plug>(fern-action-expand)", opts)
            vim.keymap.set("n", "h", "<Plug>(fern-action-collapse)", opts)
          end,
        })
      end,
    }
}
