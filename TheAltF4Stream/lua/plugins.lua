local function packer_verify()
  local cmd = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end
end

local load_telescope = function()
	require("telescope").setup{
		defaults = {
			file_ignore_patterns = {
				"node_modules/.*",
				"secret.d/.*",
				"%.pem"
			}
		}
	}

	local map = vim.api.nvim_set_keymap

	local options = { noremap = true }

	-- TODO: Map keybinds to custom TA4S commands (lua :TA4SOpenFiles)
	map('n', '<leader>fe', '<CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>', options)
	map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
end

function PackerInit()
  packer_verify()

  require('packer').startup(function(use)
    -- Packer --
    use 'wbthomason/packer.nvim'

    -- Git Support --
    use 'rhysd/git-messenger.vim'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'lewis6991/gitsigns.nvim'

    -- Language Support --
    use {
      'neoclide/coc.nvim',
      branch = "release"
    }
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate"
    }
    use 'jparise/vim-graphql'

    -- Telescope --
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    }

    -- Themes --
    use 'folke/tokyonight.nvim'

    -- Utilities --
    use 'phaazon/hop.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'preservim/nerdcommenter'
    use 'akinsho/nvim-bufferline.lua'
    use 'romgrk/nvim-treesitter-context'
    use 'kyazdani42/nvim-web-devicons'
    -- use 'vim-scripts/ReplaceWithRegister'
    use 'voldikss/vim-floaterm'
    use 'takac/vim-hardtime' -- see http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
    -- use 'mg979/vim-visual-multi', { 'branch': 'master' }

    -- VimWiki + Zettelkasten --
    use 'vimwiki/vimwiki'
    use {
      'junegunn/fzf',
      run = function() vim.fn['fzf#install']() end
    }
    use 'junegunn/fzf.vim'
    use 'michal-h21/vim-zettel'

  end)

	load_telescope()

end
