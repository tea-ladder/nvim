-- snippet

-- vsnip
vim.g.vsnip_snippet_dir = vim.fn.expand('C:\\Users\\tea-l\\.config\\.vsnip')

vim.api.nvim_set_keymap('i', '<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-b>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-b>"', {expr = true})
