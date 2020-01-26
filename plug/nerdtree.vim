""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <Leader>e :NERDTreeToggle<CR>
nnoremap <silent> <C-\> :NERDTreeToggle<CR>
let g:NERDTreeUseGitToDelete = 1
let g:NERDTreeUseGitToMove = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
