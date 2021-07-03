local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  --vim.api.nvim_command([[
    --tnoremap <ESC> <C-\><C-n>
  --]])

  map('n', '<leader>bb', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 btm<CR>', options)
  map('n', '<leader>k9', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 k9s<CR>', options)
  map('n', '<leader>ld', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<CR>', options)
  map('n', '<leader>lg', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>', options)
  map('n', '<leader>nn', '<CMD>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<CR>', options)
  map('n', '<leader>tt', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>', options)
  map('n', '<leader>tw', '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 taskwarrior-tui<CR>', options)
end

return {
  init = init
}
