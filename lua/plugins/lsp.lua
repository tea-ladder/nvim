-- mason / lsp
require("mason").setup()
require("mason-lspconfig").setup()
-- local mason = require('mason')
-- local lspconfig = require('lspconfig')
-- local mason_lspconfig = require('mason-lspconfig')
-- 
-- vim.lsp.set_log_level('off')
-- 
-- mason.setup()
-- mason_lspconfig.setup()
-- mason_lspconfig.setup_handlers({
--     function(server_name)
--         lspconfig[server_name].setup({})
--     end,
-- --  rust_analyzer = function()  -- 個別に設定することもできる
-- --      require('rust-tools').setup({})
-- --  end,
-- })
-- 
-- -- lsp debug
-- vim.cmd("command! LspLogLevelDebug lua vim.lsp.set_log_level('debug')")
-- 
-- -- test
-- --local util = require("lspconfig.util")
-- --
-- --local function get_python_path(workspace)
-- --  -- 1. venvがアクティブならそれを使用
-- --  if vim.env.VIRTUAL_ENV then
-- --    return vim.env.VIRTUAL_ENV .. "/bin/python"
-- --  end
-- --
-- --  -- 2. workspaceにvenvがあるか検索（.venv, venv など）
-- --  for _, venv in ipairs({".venv", "venv"}) do
-- --    local venv_path = util.path.join(workspace, venv, "Scripts", "python")
-- --    if vim.fn.executable(venv_path) == 1 then
-- --      return venv_path
-- --    end
-- --  end
-- --
-- --  -- 3. なければデフォルトのPythonを使用
-- --  return vim.fn.exepath("python3") or "python"
-- --end
-- --require("lspconfig").pylsp.setup({
-- --  on_init = function(client)
-- --    local path = get_python_path(client.config.root_dir)
-- --    client.config.settings.python = { pythonPath = path }
-- --  end,
-- --})

-- format
vim.cmd('command! LspFormat :lua vim.lsp.buf.format()')

-- diagnostic floating window settings

-- 手動で診断フローティングを閉じたかどうかを追跡するフラグ
local manual_diagnostic_float_closed = false

-- diagnostic cursor (変更なし)
vim.o.updatetime = 250
local LspDiagnosticsFloatGroup = vim.api.nvim_create_augroup("LspDiagnosticsFloat", { clear = true })

-- 手動で診断フローティングを閉じたかどうかを追跡するフラグ
local manual_diagnostic_float_closed = false

-- 診断フローティングウィンドウをトグルする関数
local function toggle_diagnostic_float()
  -- vim.print("[SUCCESS] toggle_diagnostic_float has been successfully entered!") -- デバッグ用

  local float_win_to_close = nil
  local all_wins = vim.api.nvim_list_wins()
  -- vim.print("[STAGE 1] Variables declared. Window list count: " .. #all_wins) -- デバッグ用

  -- vim.print("[STAGE 2] Starting window search loop...") -- デバッグ用
  for _, winid in ipairs(all_wins) do
    local is_valid_ok, is_valid_result = pcall(vim.api.nvim_win_is_valid, winid)
    if not (is_valid_ok and is_valid_result) then goto continue_loop end

    local config_ok, config = pcall(vim.api.nvim_win_get_config, winid)
    if not config_ok then goto continue_loop end

    if config.relative == "" or config.relative == nil then goto continue_loop end

    local buf_ok, bufnr = pcall(vim.api.nvim_win_get_buf, winid)
    if not buf_ok then goto continue_loop end

    local buftype_ok, buftype = pcall(function() return vim.bo[bufnr].buftype end)
    if not buftype_ok then goto continue_loop end

    if buftype == 'nofile' and (config.zindex or 0) > 49 then -- 条件 (zindexの値は環境によるかも)
      -- vim.print(string.format("  >>> Diagnostic-like float FOUND: winid %s", tostring(winid))) -- デバッグ用
      float_win_to_close = winid
      break
    end
    ::continue_loop::
  end
  -- vim.print("[STAGE 2] END - Window search loop finished.") -- デバッグ用
  -- if float_win_to_close then
  --   vim.print(string.format("[STAGE 2] Result: Diagnostic float to close found: winid %s", tostring(float_win_to_close))) -- デバッグ用
  -- else
  --   vim.print("[STAGE 2] Result: No diagnostic float to close was found.") -- デバッグ用
  -- end

  -- vim.print("[STAGE 3] Executing close/open logic...") -- デバッグ用
  if float_win_to_close then
    -- vim.print(string.format("[STAGE 3] Attempting to close window: %s", tostring(float_win_to_close))) -- デバッグ用
    local close_ok, close_err = pcall(vim.api.nvim_win_close, float_win_to_close, true)
    if not close_ok then
      vim.notify(string.format("Error closing diagnostic float: %s", tostring(close_err)), vim.log.levels.ERROR)
    -- else
      -- vim.print(string.format("  [SUCCESS] Window %s closed (or attempt made).", tostring(float_win_to_close))) -- デバッグ用
    end
    manual_diagnostic_float_closed = true
    -- vim.print("[STAGE 3] manual_diagnostic_float_closed set to true") -- デバッグ用
  else
    -- vim.print("[STAGE 3] No window to close, attempting to open diagnostic float.") -- デバッグ用
    local float_opts = vim.tbl_deep_extend("force", vim.diagnostic.config().float or {}, {
      scope = "line",
      focusable = false,
    })

    local current_bufnr = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local diagnostics_on_line = vim.diagnostic.get(current_bufnr, {
        lnum = cursor_pos[1],
        severity = { min = vim.diagnostic.severity.HINT }
    })

    if #diagnostics_on_line > 0 then
      -- vim.print(string.format("  Diagnostics found on line %d (%d items), opening float.", cursor_pos[1] + 1, #diagnostics_on_line)) -- デバッグ用
      local open_ok, open_err = pcall(vim.diagnostic.open_float, nil, float_opts)
      if not open_ok then
        vim.notify(string.format("Error opening diagnostic float: %s", tostring(open_err)), vim.log.levels.ERROR)
      -- else
        -- vim.print("  [SUCCESS] vim.diagnostic.open_float called.") -- デバッグ用
      end
    -- else
      -- vim.print("  No diagnostics to show on current line.") -- デバッグ用
    end
    manual_diagnostic_float_closed = false -- 表示試行後は手動クローズ状態を解除
    -- vim.print("[STAGE 3] manual_diagnostic_float_closed set to false") -- デバッグ用
  end
  -- vim.print("[STAGE 3] END - Close/open logic finished.") -- デバッグ用
end

-- カーソルホールド時の自動表示
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  group = LspDiagnosticsFloatGroup,
  callback = function()
    -- 手動で閉じた場合は自動表示しない
    if manual_diagnostic_float_closed then
      return
    end

    -- 既存のフローティングウィンドウがない場合のみ表示する
    -- (より正確には、診断関連のフロートがない場合)
    local diagnostic_float_exists = false
    for _, winid in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_is_valid(winid) then
        local config = vim.api.nvim_win_get_config(winid)
        if config.relative ~= "" and vim.bo[vim.api.nvim_win_get_buf(winid)].buftype == 'nofile' and (config.zindex or 0) > 50 then
          diagnostic_float_exists = true
          break
        end
      end
    end

    if not diagnostic_float_exists then
      local float_opts = vim.tbl_deep_extend("force", vim.diagnostic.config().float or {}, {
        scope = "line",
        focusable = false,
      })
      vim.diagnostic.open_float(nil, float_opts)
    end
  end,
})

-- diagnostic config (変更なし、ただし float_opts で使われる)
vim.diagnostic.config({
  float = {
    source = "always",
    border = "double",
    header = "Diagnostics",
    scope = 'line', -- デフォルトのスコープ (open_floatで上書き可能)
  },
  -- virtual_text = false,
  -- signs = true,
  -- underline = true,
  -- update_in_insert = false,
})

-- キーマッピング (例: <Leader>dt でトグル)
vim.keymap.set('n', '<Localleader>dt', toggle_diagnostic_float, { noremap = true, silent = true, desc = '診断フローティングをトグル' })
-- キーマッピング (デバッグ強化)
-- vim.keymap.set('n', '<Localleader>dt', function() -- `<Localleader>dt` をお使いの場合はそちらに合わせる
--   print("[DEBUG] Keymap <Localleader>dt triggered") -- または <Localleader>dt
--   print("[DEBUG] Type of toggle_diagnostic_float: " .. type(toggle_diagnostic_float))
--   if type(toggle_diagnostic_float) == "function" then
--     print("[DEBUG] toggle_diagnostic_float is a function, attempting to call.")
--     toggle_diagnostic_float()
--   else
--     print("[ERROR] toggle_diagnostic_float is NOT a function! It is a " .. type(toggle_diagnostic_float))
--   end
-- end, { noremap = true, silent = false, desc = '診断フローティングをトグル' })
