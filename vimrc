" ***********************************************
" vim config
" inspired by:
"   Jess Archer
"   (https://github.com/jessarcher/dotfiles)
" ***********************************************

" ***********************************************
" gVim Setup
" ***********************************************

if has("gui_running")
  set lines=48
  set columns=160
  set guicursor+=a:blinkon0
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set macligatures
    set guifont=JetbrainsMono\ Nerd\ Font:h15
    set vb t_vb=.
  elseif has("gui_win32")
    set guifont=Cascadia\ Code\ PL:h11:cANSI
  endif
endif


" ***********************************************
" Keyboardmappings
" ***********************************************

vnoremap < <gv
vnoremap > >gv

vnoremap y myy`y
vnoremap Y myY`y

map gf :edit <cfile><cr>


let mapleader = "\<space>"

nnoremap <leader>V :edit ~/.vimrc<CR>
nnoremap <leader>1 :source ~/.vimrc<CR>

nnoremap <leader><Left> :bprev<CR>
nnoremap <leader><Right> :bnext<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>d :bd<CR>

nnoremap q <c-v>

set pastetoggle=<leader>p
nnoremap <leader>s :set hlsearch!<CR>

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
source ~/.config/vim/coc.vim
source ~/.config/vim/molokai.vim
source ~/.config/vim/polyglot.vim
source ~/.config/vim/commentary.vim

call plug#end()
"doautocmd User PlugLoaded

filetype plugin indent on
colorscheme molokai

" ***********************************************
" Global Config
" ***********************************************
set encoding=UTF-8

set nocompatible
filetype off

set mouse=a
set expandtab
set shiftwidth=2
set tabstop=2
set hidden
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set confirm
set undofile
set clipboard=unnamed
set signcolumn=yes
set number
set cursorline
set wrap linebreak
syntax on

set backup

set backupdir=~/.local/vimtmp//,.
set directory=~/.local/vimtmp//,.
set undodir=~/.local/vimtmp//,.

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" ***********************************************
" Colors
" ***********************************************

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi Visual cterm=bold ctermbg=67 ctermfg=NONE
autocmd vimenter * hi LineNr term=underline ctermfg=59 ctermbg=NONE guifg=#465457 guibg=NONE
autocmd vimenter * hi clear CursorlineNR
autocmd vimenter * hi Cursorline cterm=bold ctermbg=NONE guibg=NONE

" ***********************************************
" Filetype Configs
" ***********************************************
"
autocmd Filetype go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal autoindent noexpandtab tabstop=4 shiftwidth=4


