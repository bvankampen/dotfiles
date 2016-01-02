set t_Co=256
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
    set guifont=Hack:h10
    set rtp+=c:\users\bas\vimfiles\bundle\Vundle.vim
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"Plugin 'chriskempson/base16-vim'
Plugin 'bling/vim-airline'
" Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" reload vimrc
nmap <leader>r :w!<cr>:so $MYVIMRC<cr>

nnoremap <leader>t :NERDTree<CR>

syntax enable

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set lazyredraw

set wildignore=*.o,*~,*.pyc

set backspace=eol,start,indent

set whichwrap+=<,>,h,l

set smartcase

set ignorecase

set hlsearch
set incsearch

set encoding=utf8

set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set number
set showcmd
set nocursorline

set lbr
set tw=500

set ai
set si
set wrap

let g:airline_powerline_fonts=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Colorscheme 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme Monokai
set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>m :tabn<cr>
map <leader>n :tabp<cr>


map <leader>\ :noh<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
    catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Misc config
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist', 'docs']
let g:jedi#completions_enabled = 1
