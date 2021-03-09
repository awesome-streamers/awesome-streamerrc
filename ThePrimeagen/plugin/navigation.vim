nnoremap <C-Left> :call AfPPAlternatePluthPluth()<CR>
nnoremap <C-Up> :call AfPPAlternate()<CR>
inoremap <C-Left> <esc>:call AfPPAlternatePluthPluth()<CR>
inoremap <C-Up> <esc>:call AfPPAlternate()<CR>
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <C-l> :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if g:the_primeagen_qf == 1
        if a:global
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_l = 0
            lclose
        endif
    else
        if a:global
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_l = 0
            lclose
        endif
    endif
endfun

" May remove
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
