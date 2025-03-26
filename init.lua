vim.loader.enable()

if vim.fn.has('termguicolors') then
 vim.opt.termguicolors = true
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- manipulation
vim.g.mapleader = '\\'
vim.g.maplocalleader = ','

require('000-lazy')
require('000-common')
require('001-color')
require('002-command')
require('003-filetype')
require('010-terminal')

vim.g.airline_theme = 'dracula'
-- plugins
require('plugins.filer')
require('plugins.snippet')
require('plugins.lsp')
require('plugins.completion')
require('plugins.quick-run')
require('plugins.ripgrep')
require('plugins.none-ls')
require('plugins.silicon')

