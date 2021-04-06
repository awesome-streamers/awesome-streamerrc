local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

return packer.startup(function()
    local use = use

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/telescope.nvim'
    
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'preservim/NERDTree'
    --use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }

    use 'tpope/vim-sensible'
    use 'tpope/vim-surround'
    use 'jistr/vim-nerdtree-tabs'
    use 'majutsushi/tagbar'
    use 'vim-scripts/indentpython.vim'
    use 'lepture/vim-jinja'
    use 'joshdick/onedark.vim'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-fugitive'
    use 'jiangmiao/auto-pairs'
    use 'vim-airline/vim-airline'
    use 'ryanoasis/vim-devicons'
    use 'jremmen/vim-ripgrep'

    use 'preservim/nerdcommenter'

    use 'Shougo/deoplete.nvim'
    use 'zchee/deoplete-jedi'

    use 'sbdchd/neoformat'

    use 'davidhalter/jedi-vim'

    use 'neomake/neomake'

    use 'tmhedberg/SimpylFold'

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'anott03/nvim-lspinstall'

    use {'prettier/vim-prettier', run = 'npm install' }

    use {'phaazon/hop.nvim'}

    end
)

