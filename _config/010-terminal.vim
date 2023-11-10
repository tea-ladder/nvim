command -nargs=* Term tabnew | terminal bash<args>
command -nargs=* Terms split | resize 10 | terminal bash <args>
command -nargs=* Termv vsplit | resize 10 | terminal bash<args>
tnoremap <Esc> <C-\><C-n>
