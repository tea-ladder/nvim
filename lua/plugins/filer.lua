-- filer plugin

-- lir
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = true,
  ignore = {}, -- { ".DS_Store", "node_modules" } etc.
  devicons = {
    enable = true,
    highlight_dirname = false
  },
  mappings = {
    ['l']     = actions.edit,
    ['<CR>']     = actions.edit,
    ['s'] = actions.split,
    ['v'] = actions.vsplit,
    ['t'] = actions.tabedit,
    ['h']     = actions.up,
    ['q']     = actions.quit,
    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,
    ['b']     = require'lir.bookmark.actions'.list,
    ['a']    = require'lir.bookmark.actions'.add,
    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
}
local b_actions = require'lir.bookmark.actions'
require'lir.bookmark'.setup {
  bookmark_path = '~/.lir_bookmark',
  mappings = {
    ['l']     = b_actions.edit,
    ['s'] = b_actions.split,
    ['v'] = b_actions.vsplit,
    ['t'] = b_actions.tabedit,
    ['e'] = b_actions.open_lir,
    ['B']     = b_actions.open_lir,
    ['q']     = b_actions.open_lir,
  }
}
vim.api.nvim_set_keymap('n', '<Localleader>e', ':lua require("lir.float").toggle()<CR>', {noremap = true})
