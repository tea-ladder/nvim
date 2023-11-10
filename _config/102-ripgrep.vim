UsePlugin 'vim-ripgrep'
command! -nargs=+ -complete=file Ripgrep :call ripgrep#search(<q-args>)
