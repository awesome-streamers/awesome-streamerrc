local function init()
  local plugins = {
    -- packer
    'packer',
    -- lsp
    'lsp',
    'treesitter',
    'compe',
    'compe_tabnine',
    -- telescope
    'telescope',
    -- git
    'gitsigns',
    'git_worktree',
    -- theme
    'tokyonight',
    --sessions
    'auto_session',
    -- window
    'lualine',
    -- utils
    'floaterm',
    'hardtime',
    'zettel',
  }

  for _, plug in ipairs(plugins) do
    require(string.format('TheAltF4Stream.plugins.%s', plug)).init()
  end
end

return {
  init = init,
}
