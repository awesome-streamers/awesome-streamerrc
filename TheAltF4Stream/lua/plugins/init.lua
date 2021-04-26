require "TheAltF4Stream.plugins.git_worktree"
require "TheAltF4Stream.plugins.packer"
require "TheAltF4Stream.plugins.telescope"

function PluginsInit()
  PackerInit()
  TelescopeInit()
  GitWorktreeInit()
end
