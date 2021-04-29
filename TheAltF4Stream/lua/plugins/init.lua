local bufferline = require "TheAltF4Stream.plugins.bufferline"
local compe = require "TheAltF4Stream.plugins.compe"
local compe_tabnine = require "TheAltF4Stream.plugins.compe_tabnine"
local floaterm = require "TheAltF4Stream.plugins.floaterm"
local gitsigns = require "TheAltF4Stream.plugins.gitsigns"
local git_worktree = require "TheAltF4Stream.plugins.git_worktree"
local hardtime = require "TheAltF4Stream.plugins.hardtime"
local hop = require "TheAltF4Stream.plugins.hop"
local lualine = require "TheAltF4Stream.plugins.lualine"
local lspconfig = require "TheAltF4Stream.plugins.lspconfig"
local packer = require "TheAltF4Stream.plugins.packer"
local telescope = require "TheAltF4Stream.plugins.telescope"
local treesitter = require "TheAltF4Stream.plugins.treesitter"
local tokyonight = require "TheAltF4Stream.plugins.tokyonight"
local zettel = require "TheAltF4Stream.plugins.zettel"

local function init()
  -- packages
  packer.init()

  -- lsp
  lspconfig.init()
  treesitter.init()
  compe.init()
  compe_tabnine.init()

  -- telescope
  telescope.init()

  -- git
  gitsigns.init()
  git_worktree.init()

  -- window
  bufferline.init()
  lualine.init()
  tokyonight.init()

  -- utils
  floaterm.init()
  hardtime.init()
  hop.init()
  zettel.init()
end

return {
  init = init,
}
