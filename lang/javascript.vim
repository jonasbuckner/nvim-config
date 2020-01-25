""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.js syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
autocmd BufNewFile,BufRead *.js set foldmethod=syntax
autocmd BufNewFile,BufRead *.js set foldlevel=2
autocmd BufNewFile,BufRead *.js set tabstop=4
autocmd BufNewFile,BufRead *.js set shiftwidth=4
autocmd BufNewFile,BufRead *.js set softtabstop=4
autocmd BufNewFile,BufRead *.json nmap =j :%!python -m json.tool<CR>
