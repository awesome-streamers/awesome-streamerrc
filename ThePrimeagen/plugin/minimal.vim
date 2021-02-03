fun! ThePrimeagenTurnOnGuides()
    set rnu
    set nu 
    set signcolumn=yes
    set colorcolumn=80
endfun

fun! ThePrimeagenTurnOffGuides()
    set nornu
    set nonu 
    set signcolumn=no
    set colorcolumn=800
endfun

nnoremap <leader>ao :call ThePrimeagenTurnOnGuides()<cr>
nnoremap <leader>ae :call ThePrimeagenTurnOffGuides()<cr>

augroup THE_PRIMEAGEN_MINIMAL
    autocmd! 
    autocmd FileType *\(^\(netrw\|help\)\)\@<! :call ThePrimeagenTurnOnGuides()
    autocmd FileType netrw,help :call ThePrimeagenTurnOffGuides()
augroup END
