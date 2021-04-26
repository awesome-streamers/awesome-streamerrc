local function load_git_worktree()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  require("telescope").load_extension("git_worktree")

  map('n', '<leader>fw', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>', options)
end

function GitWorktreeInit()
  load_git_worktree()
end
