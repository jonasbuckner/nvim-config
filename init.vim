set nocompatible

call plug#begin(stdpath('data') . '/plugged')
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
call plug#end()

filetype on
syntax on
filetype indent on
filetype plugin on

set path+=**
set wildmenu

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2

set autoindent
set number
set ruler
set hidden
set modeline
set t_ut=

set incsearch
set showmatch
set ignorecase
set smartcase

set splitbelow
set splitright

nmap j gj
nmap k gk

set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap
set tags^=./.git/tags

command! Initvim exe 'edit '.stdpath('config').'/init.vim'

" set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%{FugitiveStatusline()}%h%m%r%y%=%c,%l/%L\ %P

autocmd BufWritePre * %s/\s\+$//e

" NERDTree
source ~/.config/nvim/nerdtree.vim

" EasyAlign
source ~/.config/nvim/easyalign.vim

" Startify
