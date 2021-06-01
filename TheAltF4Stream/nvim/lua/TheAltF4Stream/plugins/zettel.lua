local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  -- Keymaps
  map('n', '<leader>zn','<CMD>ZettelNew<CR>', options)
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
