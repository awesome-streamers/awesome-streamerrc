local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  local opts = {
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = true,
  }

  require'auto-session'.setup(opts)

  require'telescope'.load_extension("session-lens")

  -- Telescope --
  map('n', '<leader>fss', '<CMD>lua require("telescope").extensions["session-lens"].search_session()<CR>', options)
end

return {
  init = init
}
