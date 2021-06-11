local function init()
  local map = vim.api.nvim_set_keymap

  local mapOpts = { noremap = true }

  local opts = {
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = true,
  }

  require'auto-session'.setup(opts)

  map('n', '<leader>sd', '<CMD>lua require("auto-session").DeleteSession()<CR>', mapOpts)
  map('n', '<leader>ss', '<CMD>lua require("auto-session").SaveSession()<CR>', mapOpts)
end

return {
  init = init
}
