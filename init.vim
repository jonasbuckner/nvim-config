set nocompatible

" Useful Variables
let sourceconfig = "source " . stdpath('config') " Reuse of Config Path

exe sourceconfig . "/plugins.vim"

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

set list
set listchars=tab:>- " Make tab characters visible

set tags=./tags

nmap j gj
nmap k gk

nmap <Leader>o :set paste!<CR>
set pastetoggle=<F11>

exec "set backupdir=" . stdpath("data") . "/backup"
exec "set directory=" . stdpath("data") . "/swap"
set tags^=./.git/tags

set bg=dark
let g:gruvbox_contrast_dark = "medium"
colorscheme gruvbox

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%{fugitive#Statusline()}%h%m%r%y%=%c,%l/%L\ %P

" Remove Trailing Whitespace
autocmd BufWritePre * %s/\s\+$//e

" Commands
command! Initvim exe 'edit '.stdpath('config').'/init.vim'

" Functions
exe sourceconfig . "/functions.vim"

" Mappings
nmap <silent><C-P> :FZF<cr>

" Languages
exe sourceconfig . "/lang/javascript.vim"
exe sourceconfig . "/lang/php.vim"
exe sourceconfig . "/lang/html.vim"

" NERDTree
exe sourceconfig . "/plug/nerdtree.vim"

" EasyAlign
exe sourceconfig . "/plug/easyalign.vim"

" Tmux Navigator
exe sourceconfig . "/plug/tmux-navigator.vim"

" Startup
autocmd vimenter * if !argc() | Startify | NERDTreeToggle | wincmd p | endif
