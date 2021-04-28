local function init()
  -- Theme settings
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  -- Load colorscheme
  vim.cmd[[colorscheme tokyonight]]
end

return {
  init = init
}
