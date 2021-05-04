local function init()
  require("telescope").setup{
    defaults = {
      file_ignore_patterns = {
        "node_modules/.*",
        "secret.d/.*",
        "%.pem"
      }
    }
  }

  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  -- Keymaps
  map('n', '<leader>fe', '<CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>', options)
  map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
  map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
  map('n', '<leader>fs', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
  map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
  map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
end

return {
  init = init,
}
