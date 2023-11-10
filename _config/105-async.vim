UsePlugin 'asyncomplete.vim'

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 100
let g:asyncomplete_around_range = 20

call asyncomplete#register_source(asyncomplete#sources#around#get_source_options({
      \ 'name': 'around',
      \ 'allowlist': ['*'],
      \ 'priority': 10,
      \ 'completor': function('asyncomplete#sources#around#completor'),
      \ }))
