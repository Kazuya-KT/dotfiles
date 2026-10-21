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
vim.opt.cursorline = true
vim.opt.termguicolors = true
