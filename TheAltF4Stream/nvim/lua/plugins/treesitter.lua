local treesitter = require'nvim-treesitter.configs'

local function init()
  treesitter.setup{
    ensure_installed = {
      'bash',
      'css',
      'go',
      'graphql',
      'html',
      'json',
      'lua',
      'python',
      'rust',
      'tsx',
      'typescript',
      'yaml',
    },
    highlight = {
      enable = true
    }
  }
end

return {
  init = init
}
