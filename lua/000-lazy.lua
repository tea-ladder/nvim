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
      -- terminal
      {
        'akinsho/toggleterm.nvim',
        config = true,
        opts = {
          open_mapping = [[<c-t>]],
          direction = 'tab',
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

      -- neogit
      {
        "NeogitOrg/neogit",
        dependencies = {
          "nvim-lua/plenary.nvim",         -- required
          "sindrets/diffview.nvim",        -- optional - Diff integration
        },
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
      {'mason-org/mason.nvim'},
      {'mason-org/mason-lspconfig.nvim'},
      {'neovim/nvim-lspconfig'},

      -- nvim-cmp
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {"uga-rosa/cmp-skkeleton"},

      -- none-ls
      {'nvimtools/none-ls.nvim'},

      -- icons
      {'onsails/lspkind.nvim'},

      -- vsnip
      {'hrsh7th/vim-vsnip'},
      {'hrsh7th/cmp-vsnip'},

      -- silicon
      {'skanehira/denops-silicon.vim'},
      -- org
      {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
          -- Setup orgmode
          require('orgmode').setup({
            org_agenda_files = '~/org/tasks.org',
            org_default_notes_file = '~/org/tasks.org',
            org_todo_keywords = {'TODO(t)', 'REMD(r)', 'WAIT(w)', '|', 'DONE(d)', 'SKIP(x)'},
            win_split_mode = 'vertical',
            mappings = {
              org = {
                 org_clock_in = { '<Localleader>ci', desc = 'Clock in headline under cursor.' },
                 org_clock_out = { '<Localleader>co', desc = 'Clock out headline under cursor.' },
              }
            }
          })
 
          -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
          -- add ~org~ to ignore_install
          -- require('nvim-treesitter.configs').setup({
          --   ensure_installed = 'all',
          --   ignore_install = { 'org' },
          -- })
        end,
      },
      -- yazi
      {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        dependencies = {
          -- check the installation instructions at
          -- https://github.com/folke/snacks.nvim
          "folke/snacks.nvim"
        },
        keys = {
          -- 👇 in this section, choose your own keymappings!
          {
            "<Localleader>E",
            mode = { "n" },
            "<cmd>Yazi<cr>",
            desc = "Open yazi at the current file",
          },
          -- {
          --   -- Open in the current working directory
          --   "<leader>cw",
          --   "<cmd>Yazi cwd<cr>",
          --   desc = "Open the file manager in nvim's working directory",
          -- },
          --{
          --  "<c-up>",
          --  "<cmd>Yazi toggle<cr>",
          --  desc = "Resume the last yazi session",
          --},
        },
        ---@type YaziConfig | {}
        opts = {
          -- if you want to open yazi instead of netrw, see below for more info
          open_for_directories = false,
          --keymaps = {
          --  show_help = "<f1>",
          --},
        },
        -- 👇 if you use `open_for_directories=true`, this is recommended
        -- init = function()
        --   -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
        --   -- vim.g.loaded_netrw = 1
        --   vim.g.loaded_netrwPlugin = 1
        -- end,
      },

      -- skk
      -- {
      --   "vim-skk/skkeleton",
      --   dependencies = {
      --     "vim-denops/denops.vim",
      --     {
      --       "delphinus/skkeleton_indicator.nvim",
      --       event = { "VeryLazy", "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
      --       opts = { fadeOutMs = 0 },
      --       config = function()
      --         require("skkeleton_indicator").setup()
      --       end,
      --     },
      --   },
      --   keys = {
      --     {
      --       "<C-k>",
      --       mode = { "i" },
      --       "<Plug>(skkeleton-toggle)",
      --       desc = "skk toggle",
      --     },
      --   },
      --   config = function()
      --     vim.fn['skkeleton#config']({
      --       globalDictionaries = {  "~/.local/SKK-JISYO.L" },
      --       eggLikeNewline = true,
      --       showCandidatesCount = 2,
      --     })
      --   end,
      -- },
})
