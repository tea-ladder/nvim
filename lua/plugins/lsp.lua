-- mason / lsp
local mason = require('mason')
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

vim.lsp.set_log_level('off')

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
--  rust_analyzer = function()  -- 個別に設定することもできる
--      require('rust-tools').setup({})
--  end,
})

-- lsp debug
vim.cmd("command! LspLogLevelDebug lua vim.lsp.set_log_level('debug')")

-- test
local util = require("lspconfig.util")

local function get_python_path(workspace)
  -- 1. venvがアクティブならそれを使用
  if vim.env.VIRTUAL_ENV then
    return vim.env.VIRTUAL_ENV .. "/bin/python"
  end

  -- 2. workspaceにvenvがあるか検索（.venv, venv など）
  for _, venv in ipairs({".venv", "venv"}) do
    local venv_path = util.path.join(workspace, venv, "Scripts", "python")
    if vim.fn.executable(venv_path) == 1 then
      return venv_path
    end
  end

  -- 3. なければデフォルトのPythonを使用
  return vim.fn.exepath("python3") or "python"
end
require("lspconfig").pylsp.setup({
  on_init = function(client)
    local path = get_python_path(client.config.root_dir)
    client.config.settings.python = { pythonPath = path }
  end,
})
