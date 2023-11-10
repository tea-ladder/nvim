if exists('&termguicolors')
  setglobal termguicolors
endif

" 起動高速
let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:did_indent_on             = 1
let g:did_load_filetypes        = 1
let g:did_load_ftplugin         = 1
"let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1

let g:mapleader = '\'
let g:maplocalleader = ','

" プラグインの読み込み
let g:plug_shallow = 0

"" plugin start {{
call plug#begin('~/.config/nvim/plugged')
"" color scheme
Plug 'sainnhe/everforest'

"" fern filer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-bookmark.vim'
"" line
Plug 'vim-airline/vim-airline'
"" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

"" async 
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'akaimo/asyncomplete-around.vim'
"" lexima
Plug 'cohama/lexima.vim'

" denoops
Plug 'vim-denops/denops.vim'

"" quickrun
Plug 'thinca/vim-quickrun'
Plug 'lambdalisue/vim-quickrun-neovim-job'

"" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

"" ripgrep
Plug 'kyoh86/vim-ripgrep'

"" zenmode
Plug 'folke/zen-mode.nvim'

"" fulscreen
Plug 'lambdalisue/vim-fullscreen'

"" markdwon table
Plug 'mattn/vim-maketable'

"" ddu
Plug 'Shougo/ddu.vim'
" Install your UIs
Plug 'Shougo/ddu-ui-ff'
" Install your sources
Plug 'shun/ddu-source-rg'
Plug 'shun/ddu-source-buffer'
" Install your filters
Plug 'Shougo/ddu-filter-matcher_substring'
" Install your kinds
Plug 'Shougo/ddu-kind-file'

call plug#end()
"" }} plugin end

" plugin

"" vim-airline{{{
let g:airline_theme = 'everforest'
"" }}}


" 各プラグイン読み込み
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif
runtime! _config/*.vim
