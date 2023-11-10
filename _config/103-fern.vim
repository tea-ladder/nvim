UsePlugin 'fern.vim'
nnoremap <Localleader>e :Fern . -reveal=% -drawer -toggle -width=40<CR>
nnoremap <Localleader>E :Fern bookmark:/// -reveal=% -drawer -toggle -width=40<CR>
let g:fern#scheme#bookmark#store#file = expand('~/.fern/bookmark.json')
