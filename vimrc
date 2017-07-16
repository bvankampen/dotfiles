let NERDTreeIgnore = ['\.pyc$']

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'junegunn/fzf'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'klen/python-mode'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

let g:Powerline_symbols = 'fancy'

if has("gui_running")
    set guifont=Fira\ Code:h13
endif

syntax enable
set background=dark
colorscheme solarized

set tabstop=4       " number of columns for a tab
set shiftwidth=4    " number of columns for reindent operations
set shiftround      " use multiple of shiftwidth when indenting with '<'
set expandtab       " convert tabs to spaces
set autoindent

set nowrap          " don't wrap line
set number        " don't show line numbers
set showmatch       " show matching parens

set ignorecase      " ignore case for search
set smartcase       " ignore case if search is all lowercase, case-senstitive otherwise
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type

set history=1000
set undolevels=1000
set visualbell
set noerrorbells

set laststatus=2

set nofoldenable

map <F2> :NERDTreeToggle<CR>
map <F3> :vim-ident-guide<CR>

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

