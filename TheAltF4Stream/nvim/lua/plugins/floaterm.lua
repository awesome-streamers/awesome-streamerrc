local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>ld', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazydocker<CR>', options)
  map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit<CR>', options)
  map('n', '<leader>rr', '<CMD>FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating ranger<CR>', options)
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating<CR>', options)
end

return {
  init = init
}
