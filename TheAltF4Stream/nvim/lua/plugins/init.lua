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
    -- window
    'bufferline',
    'lualine',
    -- utils
    'floaterm',
    'hardtime',
    'hop',
    'zettel',
  }

  for _, plug in ipairs(plugins) do
    require(string.format('TheAltF4Stream.plugins.%s', plug)).init()
  end
end

return {
  init = init,
}
