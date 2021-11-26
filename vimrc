set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()         
filetype plugin indent on    


set mouse-=a
set expandtab
set shiftwidth=2
set tabstop=2
"set number
syntax on

colorscheme molokai

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

"Background transparant
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
