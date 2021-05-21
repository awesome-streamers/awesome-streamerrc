local function init()
  require('lualine').setup {
    options = {
      extensions = { 'quickfix' },
      theme = 'tokyonight'
    }
  }
end

return {
  init = init
}
