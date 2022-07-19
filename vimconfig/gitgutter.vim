Plug 'airblade/vim-gitgutter'

let g:gitgutter_sign_column_always = 1
let g:gitgutter_set_sign_backgrounds = 0
let g:gitgutter_sign_removed = '-'

autocmd vimenter * highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
autocmd vimenter * highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
autocmd vimenter * highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE
" autocmd vimenter * highlight clear SignColumn
