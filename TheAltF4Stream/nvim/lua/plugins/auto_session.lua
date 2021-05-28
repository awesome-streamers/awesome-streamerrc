local function init()
  local opts = {
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = true,
  }

  require'auto-session'.setup(opts)

  require'telescope'.load_extension("session-lens")
end

return {
  init = init
}
