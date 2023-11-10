UsePlugin 'ddu.vim'
call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'sources': [
    \     {'name':'rg'},
    \     {'name':'buffer'}
    \   ],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \   },
    \   'sourceParams' : {
    \     'rg' : {
    \       'args': ['--column', '--no-heading', '--color', 'never'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     }
    \   },
    \   'uiParams': {
    \     'ff': {
    \       'startFilter': v:true,
    \       'prompt': '> ',
    \       'split': 'horizontal',
    \     }
    \   },
    \ })


autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>

  inoremap <buffer><silent> <Esc>
    \ <Esc><Cmd>call ddu#ui#ff#close()<CR>

  nnoremap <buffer><silent> <CR>
    \ <Cmd>call ddu#ui#ff#close()<CR>

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#ff#close()<CR>
endfunction

nnoremap <Localleader>rg :DduRg<CR>
nnoremap <Localleader>b <Cmd>call ddu#start({
\   'name': 'buffer',
\ })<CR>

