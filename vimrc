" ***********************************************
" Global Config
" ***********************************************

set nocompatible
filetype off

set mouse-=a
set expandtab
set shiftwidth=2
set tabstop=2
set hlsearch
set hidden
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set confirm
set undofile
set clipboard=unnamedplus
set signcolumn=yes
"set number
syntax on

set backup

set backupdir=~/.local/vimtmp//,.
set directory=~/.local/vimtmp//,.
set undodir=~/.local/vimtmp//,.

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ***********************************************
" Keyboardmappings
" ***********************************************

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

map gf :edit <cfile><cr>

let mapleader = "\<space>"

nnoremap <leader><Left> :bprev<CR>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>d :bd<CR>

nnoremap q <c-v>

" ***********************************************
" Plugins
" ***********************************************

" Automatically install vim-plug
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
 silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/vim/vim-fugitive.vim
source ~/.config/vim/vim-airlines.vim
source ~/.config/vim/fzf.vim
source ~/.config/vim/vim-trailing-whitespace.vim
source ~/.config/vim/vim-hcl.vim
source ~/.config/vim/nerdtree.vim
source ~/.config/vim/gitgutter.vim
source ~/.config/vim/molokai.vim
source ~/.config/vim/autopairs.vim

call plug#end()
"doautocmd User PlugLoaded

filetype plugin indent on
colorscheme molokai

" ***********************************************
" Misc
" ***********************************************

"Background transparant
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi Visual term=reverse cterm=reverse
