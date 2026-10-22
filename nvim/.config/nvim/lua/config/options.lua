-- 基本設定
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
-- 長い行は画面端で折り返す (折り返した行もインデントを揃える)
vim.opt.wrap = true
vim.opt.breakindent = true
-- 折り返し時に表示行単位で移動できるようにする
vim.keymap.set({ "n", "x" }, "j", "gj", { silent = true })
vim.keymap.set({ "n", "x" }, "k", "gk", { silent = true })
-- ノーマルモードで ESC を押したら画面を一瞬光らせる (vim の visualbell と同じ。nvim は初期設定で全部オフ)
vim.opt.belloff = ""
vim.opt.visualbell = true
-- 長い行も色付けする (初期値 3000 バイトだと日本語の JSON は約 1000 字で色が消える)
vim.opt.synmaxcol = 20000
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- モードごとにカーソルの形と色を変える
-- ノーマル：青ブロック / 挿入：緑の縦棒 / ビジュアル：ピンクのブロック
vim.opt.guicursor = table.concat({
  "n-c-sm:block-NormalCursor",
  "v-ve:block-VisualCursor",
  "i-ci:ver25-InsertCursor",
  "r-cr-o:hor20-InsertCursor",
}, ",")

-- colorscheme を読み込むとハイライトが消えるので、読み込むたびに入れ直す
local function cursor_colors()
  vim.api.nvim_set_hl(0, "NormalCursor", { bg = "#4A88C7", fg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "InsertCursor", { bg = "#6AAB73", fg = "#FFFFFF" })
  vim.api.nvim_set_hl(0, "VisualCursor", { bg = "#C77DBB", fg = "#FFFFFF" })
end
vim.api.nvim_create_autocmd("ColorScheme", { callback = cursor_colors })
cursor_colors()
