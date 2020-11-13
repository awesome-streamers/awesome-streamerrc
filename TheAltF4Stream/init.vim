"'' VIM PRE-PLUG ''"
filetype plugin indent on
set exrc
set nocompatible
set secure
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
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ThePrimeagen/harpoon'

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
"This executes the command silently and ignores errors
silent! colorscheme horizon
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
set relativenumber "" PogChamp


"'' Definitions ''"
let mapleader = " "


"'' VIM Keymaps ''"
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>


"'' Neovim LSP ''"
if filereadable(expand("~/.config/nvim/plugged/nvim-lspconfig/plugin/nvim_lsp.vim"))
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

  nnoremap <leader>ba :lua vim.lsp.buf.code_action()<CR>
  nnoremap <leader>bd :lua vim.lsp.buf.definition()<CR>
  nnoremap <leader>bf :lua vim.lsp.buf.references()<CR>
  nnoremap <leader>bi :lua vim.lsp.buf.implementation()<CR>
  nnoremap <leader>bs :lua vim.lsp.buf.signature_help()<CR>
  nnoremap <leader>br :lua vim.lsp.buf.rename()<CR>
  nnoremap <leader>bh :lua vim.lsp.buf.hover()<CR>
  nnoremap <Leader>bs :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
endif


"'' Neovim Treesitter ''"
if filereadable(expand("~/.config/nvim/plugged/nvim-treesitter/plugin/nvim-treesitter.vim"))
  lua require'nvim-treesitter.configs'.setup{ ensure_installed='all', highlight={ enable=true } }
endif


"'' Harpoon ''"
if filereadable(expand("~/.config/nvim/plugged/harpoon/plugin/harpoon.vim"))
  nmap <Leader>bf :call GotoBuffer(0)<CR>
endif


"'' Lightline ''"
if filereadable(expand("~/.config/nvim/plugged/lightline.vim/plugin/lightline.vim"))
  let g:lightline = {'colorscheme' : 'horizon'}
endif


"'' Prettier ''"
if filereadable(expand("~/.config/nvim/plugged/vim-prettier/plugin/prettier.vim"))
  let g:prettier#config#bracket_spacing = 'true'
  let g:prettier#config#jsx_bracket_same_line = 'false'
  let g:prettier#autoformat = 0
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
endif


"'' Telescope ''"
if filereadable(expand("~/.config/nvim/plugged/telescope.nvim/plugin/telescope.vim"))
  nnoremap <Leader>tf :lua require'telescope.builtin'.find_files{}<CR>
  nnoremap <Leader>tg :lua require'telescope.builtin'.live_grep{}<CR>
  nnoremap <Leader>ts :lua require'telescope.builtin'.lsp_document_symbols()<CR>
  nnoremap <Leader>tr :lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
endif
