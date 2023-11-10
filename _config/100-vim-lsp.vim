UsePlugin 'vim-lsp'

"" code format の短縮
inoremap <silent> <C-;> <ESC>:LspDocumentFormatSync<CR> a
nnoremap <silent> <C-;> :LspDocumentFormatSync<CR>
command Codediag LspDocumentDiagnostics
"" 定義ジャンプ
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=no
"  nmap <buffer> gd <plug>(lsp-definition)
"  nmap <buffer> <f2> <plug>(lsp-rename)
"  inoremap <expr> <CR> pumvisible() ? "\<c-y>\<CR>" : "\<CR>"
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <ESC> pumvisible() ? "\<c-y>\<ESC>" : "\<ESC>"
  inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 0

" python linter
let g:lsp_settings = {
\  'pylsp-all': {
\    'workspace_config': {
\      'pylsp-all': {
\        'configurationSources': ['flake8'],
\      }
\    }
\  }
\}
" }}


" inlay hints (only vim 9)
"let g:lsp_inlay_hints_enabled = 1
"let g:lsp_inlay_hints_mode = {
"\  'normal': ['curline'],
"\}
