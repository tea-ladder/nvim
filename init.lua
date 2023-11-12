vim.loader.enable()

if vim.fn.has('termguicolors') then
 vim.opt.termguicolors = true
end

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

