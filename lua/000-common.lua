-- font
vim.api.nvim_set_keymap('n', '<Localleader>f', ':set guifont="Hack Nerd Font Mono":h', { noremap = true })
vim.opt.guifont = "Hack Nerd Font Mono:h14"
vim.opt.guifontwide = "Hack Nerd Font Mono:h14"

-- tab
vim.api.nvim_set_keymap('n', '<F1>', ':tabnew $MYVIMRC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-Tab>', ':tabnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':tabprev<CR>', {noremap = true})

-- base
vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap = true})
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true})
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap = true})
vim.g.maplocalleader = ','

-- 補完系
-- split で右に開く
vim.opt.splitright = true
vim.opt.splitbelow = true

-- yankでクリップボードにコピー
vim.opt.clipboard = "unnamedplus"
-- カレントディレクトリ
vim.opt.autochdir = true
-- 文字コードをUFT-8に設定
vim.opt.fenc = "utf-8"
--  バックアップファイルを作らない
vim.opt.backup = false
-- スワップファイルを作らない
vim.opt.swapfile = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.opt.autoread = true
-- バッファが編集中でもその他のファイルを開けるように
vim.opt.hidden = true
-- 入力中のコマンドをステータスに表示する
vim.opt.showcmd = true
-- 行番号を表示
vim.opt.number = true
-- 現在の行を強調表示
vim.opt.cursorline = true
-- インデントはスマートインデント
vim.opt.smartindent = true
-- ビープ音を可視化
vim.opt.visualbell = true
-- 括弧入力時の対応する括弧を表示
vim.opt.showmatch = true
-- ステータスラインを常に表示
vim.opt.laststatus = 2
-- コマンドラインの補完
vim.opt.wildmode = "longest:full,full"

-- 折り返し時に表示行単位での移動できるようにする
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
-- シンタックスハイライトの有効化
vim.cmd('syntax on')
-- コメントアウト時に改行させない
vim.opt.formatoptions:remove('ro')
vim.opt.list = true

-- tab系
-- 不可視文字を可視化(タブが「▸-」と表示される)
vim.opt.listchars:append('tab:▸\\-')
-- Tab文字を半角スペースにする
vim.opt.expandtab = true
-- 行頭以外のTab文字の表示幅（スペースいくつ分）
vim.opt.tabstop = 2
-- 行頭でのTab文字の表示幅
vim.opt.shiftwidth = 2

-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別なく検索する
vim.opt.ignorecase = true
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.opt.incsearch = true
-- 検索時に最後まで行ったら最初に戻る
vim.opt.wrapscan = true
-- 検索語をハイライト表示
vim.opt.hlsearch = true
-- ESC連打でハイライト解除
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohlsearch<CR><Esc>', {noremap = true})
