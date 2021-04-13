local M = {}

-- Thanks teej!
M.key_mapper = function(mode, key, result)
  -- use nvim_buf_set_keymap instead to allow buftype specific keymaps
  -- this isn't currently working however
  -- vim.api.nvim_buf_set_keymap('%', mode, key, result, {noremap = true, silent = true})
  -- use vim.api.nvim_buf_get_option(0, 'filetype') to check filetype
  vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

function ReloadConfig()
  print('Reloading config')
  require'plenary.reload'.reload_module('melkey')
end

return M
