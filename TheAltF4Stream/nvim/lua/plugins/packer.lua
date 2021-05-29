local function packer_verify()
  local cmd = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  require('packer').startup(function(use)
    -- Packer --
    use 'wbthomason/packer.nvim'

    -- Language Support --
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use 'nvim-lua/lsp_extensions.nvim'
    use 'lspcontainers/lspcontainers.nvim'
    use 'hrsh7th/nvim-compe'
    use { 'tzachar/compe-tabnine', run='./install.sh' }
    use 'hrsh7th/vim-vsnip'

    -- Telescope --
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Themes --
    use 'folke/tokyonight.nvim'

    -- Git Support --
    use 'rhysd/git-messenger.vim'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'lewis6991/gitsigns.nvim'

    -- Sessions --
    use 'rmagatti/auto-session'
    use 'rmagatti/session-lens'

    -- Utilities --
    use 'hoob3rt/lualine.nvim'
    use 'preservim/nerdcommenter'
    use 'romgrk/nvim-treesitter-context'
    use 'kyazdani42/nvim-web-devicons'
    use 'voldikss/vim-floaterm'
    use 'takac/vim-hardtime' -- see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/

    -- VimWiki + Zettelkasten --
    use 'vimwiki/vimwiki'
    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
    use 'junegunn/fzf.vim'
    use 'michal-h21/vim-zettel'
  end)
end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
