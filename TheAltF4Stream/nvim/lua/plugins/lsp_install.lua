local os = require 'os'

local function install_sumenko_lua()
  local path = vim.fn.stdpath'cache'..'/lspconfig/sumneko_lua/lua-language-server'

  print(path)
end

local function init()
  install_sumenko_lua()
end

return {
  init = init,
  install_sumenko_lua = install_sumenko_lua
}
