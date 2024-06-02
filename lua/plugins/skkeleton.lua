vim.cmd [[
call skkeleton#config({ 'globalJisyo': '~/.config/skk/SKK-JISYO.L' })
inoremap <C-i> <Plug>(skkeleton-enable)
cnoremap <C-i> <Plug>(skkeleton-enable)
]]
