local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>ld', '<CMD>FloatermNew --autoclose=1 --height=0.8 --width=0.8 lazydocker<CR>', options)
  map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=1 --height=0.8 --width=0.8 lazygit<CR>', options)
  map('n', '<leader>nn', '<CMD>FloatermNew --autoclose=1 --height=0.8 --width=0.8 nnn -Hde<CR>', options)
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=1 --height=0.8 --width=0.8<CR>', options)
end

return {
  init = init
}
