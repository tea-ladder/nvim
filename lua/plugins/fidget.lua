require("fidget").setup {
      -- Options related to LSP progress subsystem
      progress = {
        poll_rate = 5,                -- How frequently to poll for progress messages
        suppress_on_insert = false,   -- Suppress new messages while in insert mode
        ignore_done_already = false,  -- Ignore new tasks that are already complete
        notification_group =          -- How to get a progress message's notification group key
          function(msg) return msg.lsp_name end,
        ignore = {},                  -- List of LSP servers to ignore
        -- Options related to how LSP progress messages are displayed as notifications
        display = {
          done_ttl = 3,               -- How long a message should persist after completion
          done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
          done_style = "Constant",    -- Highlight group for completed LSP tasks
          progress_ttl = math.huge,   -- How long a message should persist when in progress
          progress_icon =             -- Icon shown when LSP progress tasks are in progress
            { pattern = "dots", period = 1 },
          progress_style =            -- Highlight group for in-progress LSP tasks
            "WarningMsg",
          group_style = "Title",      -- Highlight group for group name (LSP server name)
          icon_style = "Question",    -- Highlight group for group icons
          priority = 30,              -- Ordering priority for LSP notification group
          format_message =            -- How to format a progress message
            require("fidget.progress.display").default_format_message,
          format_annote =             -- How to format a progress annotation
            function(msg) return msg.title end,
          format_group_name =         -- How to format a progress notification group's name
            function(group) return tostring(group) end,
          overrides = {               -- Override options from the default notification config
            rust_analyzer = { name = "rust-analyzer" },
          },
        },
      },
}
