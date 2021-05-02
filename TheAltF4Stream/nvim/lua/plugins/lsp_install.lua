local os = require 'os'

local function init()
  local path = vim.fn.stdpath'cache'..'/lspconfig/sumneko_lua/lua-language-server'

  print(path)
end

return {
  init = init
}
