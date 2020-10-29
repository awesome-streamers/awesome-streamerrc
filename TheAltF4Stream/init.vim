"'' VIM PRE-PLUG ''"
filetype plugin indent on
set nocompatible
set termguicolors
syntax enable


"'' START PLUG ''"
call plug#begin('~/.config/nvim/plugged')

"'' Neovim LSP Plugins ''"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

""" Themes
Plug 'ntk148v/vim-horizon'

""" Utilities
Plug 'preservim/nerdcommenter'

" Lightline
Plug 'itchyny/lightline.vim'

" Prettier
Plug 'prettier/vim-prettier'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

call plug#end()
"'' END PLUG ''"


"'' VIM POST-PLUG ''"
colorscheme horizon
highlight Normal cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guibg=NONE guifg=NONE
highlight Pmenu cterm=NONE gui=NONE ctermbg=233 ctermfg=252 guifg=#ffffff guibg=#4f4f4f
set splitright
set encoding=utf-8
set noerrorbells
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set number
set noshowmode


"'' Definitions ''"
let mapleader = " "


"'' Keymaps ''"
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>


"'' Neovim LSP ''"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.bashls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.dockerls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.html.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.vuels.setup{ on_attach=require'completion'.on_attach }
set completeopt=menuone,noinsert,noselect
autocmd BufWritePre *.go, lua vim.lsp.buf.formatting() 


"'' Lightline ''"
let g:lightline = {'colorscheme' : 'horizon'}


"'' Prettier ''"
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


"'' Telescope ''"
nnoremap <c-p> :lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
nnoremap <Leader>en <cmd>lua require'telescope.builtin'.find_files{ cwd = "~/.config/nvim/" }<CR>
