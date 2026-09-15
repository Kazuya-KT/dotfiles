return {
  { "vim-denops/denops.vim", lazy = false },
  {
    "vim-fall/fall.vim",
    dependencies = { "vim-denops/denops.vim" },
    keys = {
      { "<leader>ff", "<Cmd>Fall file<CR>", desc = "Fall: files" },
      { "<leader>fg", "<Cmd>Fall rg<CR>", desc = "Fall: grep(ripgrep)" },
      { "<leader>fb", "<Cmd>Fall buffer<CR>", desc = "Fall: buffers" },
      { "<leader>fl", "<Cmd>Fall line<CR>", desc = "Fall: lines" },
      { "<leader>fo", "<Cmd>Fall oldfiles<CR>", desc = "Fall: oldfiles" },
      { "<leader>fh", "<Cmd>Fall help<CR>", desc = "Fall: help" },
      { "<leader>fq", "<Cmd>Fall quickfix<CR>", desc = "Fall: quickfix" },
    },
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd("User",{
            pattern = "FallPickerEnter:*",
            callback = function()
                vim.keymap.set("c", "<C-s>", "<Cmd>call fall#action('open:split')<CR>", {nowait = true})
                vim.keymap.set("c", "<C-v>", "<Cmd>call fall#action('open:vsplit')<CR>", {nowait = true})
                vim.keymap.set("c", "<C-q>", "<Cmd>call fall#action('open:quiccfix')<CR>", {nowait = true})
            end,
        })
    end,
  },
}
