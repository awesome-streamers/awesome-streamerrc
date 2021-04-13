"'' VIM PRE-PLUG ''"
set hidden
set nobackup
set nocompatible
set nowritebackup
set secure
set shortmess+=c
set termguicolors
set updatetime=300
syntax enable


"'' START PLUG ''"
call plug#begin('~/.config/nvim/plugged')

""" Language Support ''"
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""" Neuron
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'fiatjaf/neuron.vim'

""" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

""" Themes
Plug 'ghifarit53/tokyonight-vim'

""" Utilities
Plug 'phaazon/hop.nvim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'voldikss/vim-floaterm'
Plug 'takac/vim-hardtime' " see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }

call plug#end()
"'' END PLUG ''"


"'' VIM POST-PLUG ''"
"This executes the command silently and ignores errors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
silent! colorscheme tokyonight
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
set scrolloff=3
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE


augroup WrapInMarkdown
  autocmd!
  autocmd FileType markdown setlocal wrap
augroup END


"'' Definitions ''"
let mapleader = " "


"'' VIM Keymaps ''"
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>


"'' Conquer of Completion (CoC) ''"
if filereadable(expand("~/.config/nvim/plugged/coc.nvim/plugin/coc.vim"))
  let g:coc_global_extensions=[
      \'coc-actions',
      \'coc-angular',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-docker',
      \'coc-elixir',
      \'coc-floaterm',
      \'coc-go',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-markdownlint',
      \'coc-marketplace',
      \'coc-prettier',
      \'coc-python',
      \'coc-rust-analyzer',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sql',
      \'coc-tabnine',
      \'coc-tailwindcss',
      \'coc-tsserver',
      \'coc-yaml',
      \]

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <leader>bd <Plug>(coc-definition)
  nmap <leader>bt <Plug>(coc-type-definition)
  nmap <leader>bi <Plug>(coc-implementation)
  nmap <leader>br <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif


"'' Floatterm ''"
if filereadable(expand("~/.config/nvim/plugged/vim-floaterm/plugin/floaterm.vim"))
  nnoremap <leader>fd :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazydocker<CR>
  nnoremap <leader>fg :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit<CR>
  nnoremap <leader>fr :FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating ranger<CR>
  nnoremap <leader>ft :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating<CR>
endif


"'' Hardtime ''"
if filereadable(expand("~/.config/nvim/plugged/vim-hardtime/plugin/hardtime.vim"))
  let g:hardtime_default_on = 1
  let g:hardtime_showmsg = 1
endif


"'' Hop ''"
if filereadable(expand("~/.config/nvim/plugged/hop.nvim/plugin/hop.vim"))
  nnoremap <leader>h1 :HopChar1<CR>
  nnoremap <leader>h2 :HopChar2<CR>
  nnoremap <leader>hs :HopPattern<CR>
  nnoremap <leader>hw :HopWord<CR>
endif


"'' Lightline ''"
if filereadable(expand("~/.config/nvim/plugged/lightline.vim/plugin/lightline.vim"))
  let g:lightline = {'colorscheme' : 'tokyonight'}
endif


"'' Telescope ''"
if filereadable(expand("~/.config/nvim/plugged/telescope.nvim/plugin/telescope.vim"))
lua << EOF
  require('telescope').setup{
    defaults = {
      file_ignore_patterns = {
        "git/*",
        "**/*.pem",
        "**/node_modules/**"
      }
    }
  }
EOF
  nnoremap <leader>fe <CMD>lua require('telescope.builtin').file_browser()<CR>
  nnoremap <leader>ff <CMD>lua require('telescope.builtin').find_files{ hidden = true }<CR>
  nnoremap <leader>fs <CMD>lua require('telescope.builtin').live_grep()<CR>
  nnoremap <leader>fb <CMD>lua require('telescope.builtin').buffers()<CR>
  nnoremap <leader>fh <CMD>lua require('telescope.builtin').help_tags()<CR>
endif


"'' Treesitter ''"
if filereadable(expand("~/.config/nvim/plugged/nvim-treesitter/plugin/nvim-treesitter.vim"))
  lua require'nvim-treesitter.configs'.setup{ ensure_installed='all', highlight={ enable=true } }
endif
