local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf' },
      theme = 'tokyonight'
    }
  }
end

return {
  init = init
}
