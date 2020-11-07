syntax on

set rnu nu
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set background=dark
set autoread
set nobackup
set nowritebackup
set noswapfile
highlight Comment ctermfg=red


set relativenumber
set nu rnu
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'iamcco/coc-tailwindcss'
Plug 'jaredgorski/spacecamp'
Plug 'ntk148v/vim-horizon'
Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
"Plug 'ncm2/ncm2-path'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'joshdick/onedark.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'

call plug#end()


set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast

colorscheme onedark

set encoding=UTF-8
let mapleader = " "
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Rg<CR>
nnoremap <leader>ne :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <C-S> :w<CR>
tnoremap <ESC> <C-\><C-N>
inoremap <C-S> <ESC>:write<CR>
autocmd StdinReadPre * let s:std
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | :vertical resize 60 | endif
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent>gr    <cmd>lua require'telescope.builtin'.lsp_references{}<CR>



"toggle Tagbag
map <Leader>t :TagbarToggle<CR>

"Coc Config"
 let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]


"Allow NERDTree to show hidden files"
let NERDTreeShowHidden=1
let g:python3_host_prog='/usr/bin/python3'

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()


" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber


let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

let g:airline_powerline_fonts = 1


" Focus and redistribute split windows
noremap ff :resize 100 <CR> <BAR> :vertical resize 220<CR>
noremap fm <C-w>=

"" syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"map <leader>s :SyntasticCheck<CR>
"map <leader>sd :SyntasticReset<CR>
"map <leader>e :lnext<CR>
"map <leader>r :lprev<CR>

lua require('init')
" =====================================
" ======= Completion Settings =========
" =====================================

inoremap <silent><expr> <c-p> completion#trigger_completion()

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackSpace() ? "\<TAB>" :
  \ completion#trigger_completion()

" This is very important to be loaded here
" or Tab will not work, for completion
"inoremap <expr> <Tab> pumvisible() ? "<C-n>" : "<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "<C-y>" : "<C-g>u<CR>"
"nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd BufEnter * lua require'completion'.on_attach()
