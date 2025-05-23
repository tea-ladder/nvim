--vim.cmd('command! -nargs=* Term tabnew | terminal bash <args>')
--vim.cmd('command! -nargs=* Terms split | resize 10 | terminal bash <args>')
--vim.cmd('command! -nargs=* Termv vsplit | resize 10 | terminal bash <args>')
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- ToggleTerm
vim.api.nvim_set_keymap('n', '<Localleader>t', ':ToggleTerm<CR>', {noremap = true})
