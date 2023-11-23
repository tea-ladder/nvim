vim.cmd('command! -nargs=+ -complete=file Ripgrep lua require("ripgrep").search(<q-args>)')
