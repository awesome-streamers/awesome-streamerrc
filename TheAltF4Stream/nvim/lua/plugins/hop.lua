local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>h1', '<CMD>HopChar1<CR>', options)
  map('n', '<leader>h2', '<CMD>HopChar2<CR>', options)
  map('n', '<leader>hh', '<CMD>HopPattern<CR>', options)
  map('n', '<leader>hw', '<CMD>HopWord<CR>', options)
end

return {
  init = init
}
