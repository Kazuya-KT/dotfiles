-- Lua Language Server を有効化
-- 設定は lsp/lua_ls.lua に記述
vim.lsp.enable('lua_ls')

-- Laravel
vim.lsp.enable('laravel-lsp')

-- terraform
vim.lsp.enable('terraform-ls')

-- PHP Language Server を有効化
-- 設定は lsp/intelephense.lua に記述
vim.lsp.enable('intelephense')

-- LSP のキーマップ
-- grn / gra / grr / gri / K は Neovim 0.11 の組み込みマッピングを使う
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    -- 定義ジャンプ（戻るのは <C-o>）
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- 型定義・宣言へジャンプ
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
    -- 定義を分割ウィンドウで開く
    vim.keymap.set('n', '<leader>gd', function()
      vim.cmd('vsplit')
      vim.lsp.buf.definition()
    end, opts)
    -- 診断
    vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  end,
})
