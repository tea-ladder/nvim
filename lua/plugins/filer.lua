-- filer plugin

--  fern {{
vim.api.nvim_set_keymap('n', '<Localleader>e', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Localleader>E', ':Fern bookmark:/// -reveal=% -drawer -toggle -width=40<CR>', {noremap = true})
vim.g.fern_scheme_bookmark_store_file = vim.fn.expand('~/.fern/bookmark.json')
--  }}
