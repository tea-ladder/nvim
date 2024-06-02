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

"" neovim lua function
Plug 'nvim-lua/plenary.nvim'

"" none-ls
Plug 'nvimtools/none-ls.nvim'

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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

"" icons
Plug 'onsails/lspkind.nvim'

"" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
"" lsp server
Plug 'j-hui/fidget.nvim'

"" markdwon preview
Plug 'kat0h/bufpreview.vim', { 'do': 'deno task prepare' }

"" silicon
Plug 'skanehira/denops-silicon.vim' " depends: deno isntall https://deno.land/x/silicon/mod.ts

"" skk
Plug 'vim-skk/skkeleton'
""" cmp-source
Plug 'rinx/cmp-skkeleton'


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
require('plugins.fidget')
require('plugins.none-ls')
require('plugins.silicon')
require('plugins.skkeleton')

