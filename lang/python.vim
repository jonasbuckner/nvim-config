""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python 3
""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.py
            \ set foldmethod=syntax |
            \ set autoindent |
            \ set tabstop=4 |
            \ set shiftwidth=4 |
            \ set softtabstop=4 |
            \ set signcolumn=yes

function SemshiHighlights()
    hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
    hi semshiGlobal          ctermfg=167 guifg=#fb4934
    hi semshiImported        ctermfg=214 guifg=#fabd2f cterm=bold gui=bold
    hi semshiParameter       ctermfg=142  guifg=#98971a
    hi semshiParameterUnused ctermfg=106 guifg=#665c54
    hi semshiBuiltin         ctermfg=208 guifg=#fe8019
    hi semshiAttribute       ctermfg=108  guifg=fg
    hi semshiSelf            ctermfg=109 guifg=#85a598
    hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd BufNewFile,BufRead *.py call SemshiHighlights()
autocmd ColorScheme gruvbox call SemshiHighlights()
