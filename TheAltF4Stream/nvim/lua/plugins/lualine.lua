local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf', 'quickfix' },
      theme = 'tokyonight'
    }
  }
end

return {
  init = init
}
