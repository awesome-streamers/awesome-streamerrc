local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  vim.g.vimwiki_list = {{
    ext = '.wiki',
    path = '~/vimwiki',
    syntax = 'default',
  }}

  -- Keymaps
  map('n', '<leader>ww','<CMD>vsp | VimwikiIndex<CR>', options)
  map('n', '<leader>zn','<CMD>lua vim.cmd("ZettelNew " .. vim.fn.input("Title: "))<CR>', options)
  map('n', '<leader>zo','<CMD>ZettelOpen<CR>', options)
  map('n', '<leader>zi','<CMD>ZettelInsertNote<CR>', options)
  map('n', '<leader>zb','<CMD>ZettelBackLinks<CR>', options)
  map('n', '<leader>zu','<CMD>ZettelInbox<CR>', options)
  map('n', '<leader>zl','<CMD>ZettelGenerateLinks<CR>', options)
  map('n', '<leader>zt','<CMD>ZettelGenerateTags<CR>', options)
  map('n', '<leader>zs','<CMD>ZettelSearch<CR>', options)
  map('n', '<leader>zy','<CMD>ZettelYankName<CR>', options)
end

return {
  init = init
}
