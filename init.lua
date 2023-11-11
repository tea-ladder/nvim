if vim.fn.has('termguicolors') then
 vim.opt.termguicolors = true
end
-- 起動高速
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
vim.g.did_indent_on = 1
vim.g.did_load_filetypes = 1
vim.g.did_load_ftplugin = 1
-- vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.skip_loading_mswin = 1

-- manipulation
vim.g.mapleader = '\\'
vim.g.maplocalleader = ','

-- plugin start {{
vim.cmd [[
call plug#begin('~/.config/nvim/plugged')

"" color scheme
Plug 'sainnhe/everforest'
Plug 'dracula/vim', { 'as': 'dracula' }

"" fern filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-bookmark.vim'

"" line
Plug 'vim-airline/vim-airline'

"" lexima
Plug 'cohama/lexima.vim'

" denoops
Plug 'vim-denops/denops.vim'

"" quickrun
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/vim-quickrun-neovim-job'

"" ripgrep
Plug 'kyoh86/vim-ripgrep'

"" fulscreen
Plug 'lambdalisue/vim-fullscreen'

"" markdwon table
Plug 'mattn/vim-maketable'

"" nvim-lspconfig
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

"" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

"" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'


call plug#end()
]]
-- }} plugin end
--
vim.g.airline_theme = 'dracula'

require('000-common')
require('001-color')
require('002-command')
require('003-filetype')
require('010-terminal')

-- plugins
require('plugins.filer')
require('plugins.snippet')
require('plugins.lsp')
require('plugins.completion')
require('plugins.quick-run')
require('plugins.ripgrep')

