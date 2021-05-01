local function init()
  -- packer
  require 'TheAltF4Stream.plugins.packer'.init()

  -- lsp
  require 'TheAltF4Stream.plugins.lsp'.init()
  require 'TheAltF4Stream.plugins.treesitter'.init()
  require 'TheAltF4Stream.plugins.compe'.init()
  require 'TheAltF4Stream.plugins.compe_tabnine'.init()

  -- telescope
  require 'TheAltF4Stream.plugins.telescope'.init()

  -- git
  require 'TheAltF4Stream.plugins.gitsigns'.init()
  require 'TheAltF4Stream.plugins.git_worktree'.init()

  -- window
  require 'TheAltF4Stream.plugins.bufferline'.init()
  require 'TheAltF4Stream.plugins.lualine'.init()
  require 'TheAltF4Stream.plugins.tokyonight'.init()

  -- utils
  require 'TheAltF4Stream.plugins.floaterm'.init()
  require 'TheAltF4Stream.plugins.hardtime'.init()
  require 'TheAltF4Stream.plugins.hop'.init()
  require 'TheAltF4Stream.plugins.zettel'.init()
end

return {
  init = init,
}
