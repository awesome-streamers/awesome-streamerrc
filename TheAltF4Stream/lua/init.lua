local plugins = require "TheAltF4Stream.plugins"
local vim = require "TheAltF4Stream.vim"

local function init()
  vim.init()
  plugins.init()
end

return {
  init = init,
}
