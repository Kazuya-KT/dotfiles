-- 自作のユーザーコマンド。プラグイン由来のコマンドと見分けるため、名前は My で始める
-- 一覧は :command My<Tab> や :filter /^My/ command で見られる

-- 開いているファイル・分割・カーソル位置を保ったまま nvim を再起動する（プラグイン設定の反映用）
vim.api.nvim_create_user_command("MyRestart", function()
  -- Fern のドロワーはセッションから復元できないので、保存前に閉じておく
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "fern" and #vim.api.nvim_list_wins() > 1 then
      vim.api.nvim_win_close(win, false)
    end
  end

  local session = vim.fn.stdpath("state") .. "/restart-session.vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  vim.cmd("restart source " .. vim.fn.fnameescape(session))
end, { desc = "セッションを保ったまま nvim を再起動する" })
