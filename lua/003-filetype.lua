-- filetype
-- golang
vim.api.nvim_exec([[
autocmd FileType go setlocal autoindent
autocmd FileType go setlocal smartindent cinwords=func,if,else,for,case
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
]], false)


vim.api.nvim_exec([[
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
]], false)
