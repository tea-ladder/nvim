UsePlugin 'zen-mode.nvim'
lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      backdrop = 1.0,
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
        foldcolumn = "0", -- disable fold column
        list = false, -- disable whitespace characters
      },
    }
  }
EOF
nnoremap <Localleader>z :ZenMode<CR>
