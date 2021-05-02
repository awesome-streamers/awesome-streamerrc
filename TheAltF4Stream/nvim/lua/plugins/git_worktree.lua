local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  require("git-worktree").setup{ autopush = false }

  require("telescope").load_extension("git_worktree")

  -- Git worktree ---
  map('n', '<leader>wc', '<CMD>lua require("git-worktree").create_worktree(vim.fn.input("Worktree name > "), vim.fn.input("Worktree upstream > "))<CR>', options)
  map('n', '<leader>ws', '<CMD>lua require("git-worktree").switch_worktree(vim.fn.input("Worktree name > "))<CR>', options)
  map('n', '<leader>wd', '<CMD>lua require("git-worktree").delete_worktree(vim.fn.input("Worktree name > "))<CR>', options)

  -- Telescope --
  map('n', '<leader>fw', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', options)
end

return {
  init = init
}
