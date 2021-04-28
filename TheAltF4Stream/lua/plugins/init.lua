local bufferline = require "TheAltF4Stream.plugins.bufferline"
local coc = require "TheAltF4Stream.plugins.coc"
local floaterm = require "TheAltF4Stream.plugins.floaterm"
local gitsigns = require "TheAltF4Stream.plugins.gitsigns"
local git_worktree = require "TheAltF4Stream.plugins.git_worktree"
local hardtime = require "TheAltF4Stream.plugins.hardtime"
local hop = require "TheAltF4Stream.plugins.hop"
local lualine = require "TheAltF4Stream.plugins.lualine"
local packer = require "TheAltF4Stream.plugins.packer"
local telescope = require "TheAltF4Stream.plugins.telescope"
local treesitter = require "TheAltF4Stream.plugins.treesitter"
local tokyonight = require "TheAltF4Stream.plugins.tokyonight"
local zettel = require "TheAltF4Stream.plugins.zettel"

local function init()
  -- Sync
	packer.init()
  coc.init()
	telescope.init()
	git_worktree.init()

  -- Async
  bufferline.init()
  floaterm.init()
  gitsigns.init()
  hardtime.init()
  hop.init()
  lualine.init()
  treesitter.init()
  tokyonight.init()
  zettel.init()
end

return {
  init = init,
}
