local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
      performance = {
        rtp = {
          disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
          },
        },
      },
      -- Filer
      {
        'tamago324/lir.nvim',
        dependencies = {
          'nvim-tree/nvim-web-devicons',
          'nvim-lua/plenary.nvim'
        },
      },
      { 'tamago324/lir-bookmark.nvim' },
      -- dashboard
      {
        'goolord/alpha-nvim',
        config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
      },
      -- bookmark
      {
        'crusj/bookmarks.nvim',
        keys = {
          { "<tab><tab>", mode = { "n" } },
        },
        branch = 'main',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          require("bookmarks").setup()
          require("telescope").load_extension("bookmarks")
        end
      },
      -- terminal
      {
        'akinsho/toggleterm.nvim',
        config = true,
        opts = {
          open_mapping = [[<c-t>]],
          direction = 'float',
          shade_terminals = true,
          shading_factor = 2,
          persist_size = true,
          close_on_exit = true,
          shell = "bash --login -i",
        },
      },
      -- color scheme
      {'rebelot/kanagawa.nvim'},
      {
        'dracula/vim',
        name = 'dracula'
      },

      -- line
      {
        'vim-airline/vim-airline',
      },

      -- neovim lua function
      {'nvim-lua/plenary.nvim'},

      -- denoops
      {'vim-denops/denops.vim'},

      -- lexima
      {'cohama/lexima.vim'},

      -- quickrun
      {'thinca/vim-quickrun'},
      {'lambdalisue/vim-quickrun-neovim-job'},

      -- ripgrep
      {'kyoh86/vim-ripgrep'},

      -- markdwon table
      {'mattn/vim-maketable'},

      -- nvim-lspconfig
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},

      -- nvim-cmp
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},

      -- none-ls
      {'nvimtools/none-ls.nvim'},

      -- icons
      {'onsails/lspkind.nvim'},

      -- vsnip
      {'hrsh7th/vim-vsnip'},
      {'hrsh7th/cmp-vsnip'},

      -- silicon
      {'skanehira/denops-silicon.vim'},
})
