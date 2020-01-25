""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Ctrl-L to toggle the line number counting method.
function! g:ToggleNuMode()
    if &relativenumber == 1
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction
noremap <silent><Leader>l :call g:ToggleNuMode()<cr>
noremap <C-n><C-n> :set invnumber<cr>
