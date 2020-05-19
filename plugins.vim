call plug#begin(stdpath('data') . '/plugged')
" General Helpers and Config
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'romainl/vim-cool'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-janah'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'tyrannicaltoucan/vim-quantum'

" Docker
Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" Git
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" HTML/CSS
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'

" Javascript
Plug 'pangloss/vim-javascript'

" PHP
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'shawncplus/phpcomplete.vim'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()
