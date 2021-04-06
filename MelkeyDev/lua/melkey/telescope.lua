local vim = vim
local telescope = require'telescope'
local themes = require'telescope.themes'
local builtin = require'telescope.builtin'
local actions = require'telescope.actions'
local previewers = require'telescope.previewers'


local custom_actions = {}

custom_actions.add_selection_to_quickfix = function(prompt_bufnr)
  local entry = actions.get_selected_entry(prompt_bufnr)

  local qf_list = {
    {
      bufnr = entry.bufnr,
      filename = entry.filename,
      lnum = entry.lnum,
      col = entry.col,
      text = entry.value,
    }
  }

  local current_qf = vim.fn.getqflist()

  for _, v in pairs(current_qf) do
    table.insert(qf_list, v)
  end

  vim.fn.setqflist(qf_list)
  print('Added ' .. entry.filename .. ' to quickfix')
end

custom_actions.remove_selection_from_quickfix = function(prompt_bufnr)
  local entry = actions.get_selected_entry(prompt_bufnr)
  local selected_qf_entry = {
    bufnr = entry.bufnr,
    filename = entry.filename,
    lnum = entry.lnum,
    col = entry.col,
    text = entry.value,
  }

  local qf_list = {}

  local current_qf = vim.fn.getqflist()
  for _, qf_entry in pairs(current_qf) do
      local should_keep = true
      for k, v in pairs(selected_qf_entry) do
        if qf_entry[k] ~= v then
          should_keep = false
          break
        end
      end
      if should_keep then
        table.insert(qf_list, qf_entry)
      end
  end

  vim.fn.setqflist(qf_list)
  actions.close(prompt_bufnr)
end

local defaults = {
  mappings = {
    i = {
      ["<C-a>"] = custom_actions.add_selection_to_quickfix,
      ["<C-q>"] = custom_actions.remove_selection_from_quickfix
    }
  }
}


local theme_defaults = themes.get_dropdown{ win_blend = 10, results_height = .25, width = .65, shorten_path = true }

telescope.setup({
  defaults = vim.tbl_extend('error', theme_defaults, defaults, {
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new
  })
})

local M = {}


M.find_files = function()
  builtin.find_files()
end

M.dotfiles = function()
  local config = {}

  if (os.getenv('DOTFILES_GIT_DIR')) then
    config.cwd = os.getenv('DOTFILES_GIT_DIR')
  else
    print("Set DOTFILES_GIT_DIR env var for this command to work")
    return
  end
  builtin.find_files(config)
end

M.help_tags = function()
  builtin.help_tags()
end

M.live_grep = function()
  builtin.live_grep()
end

M.grep_string = function(search)
  local config = {
    search = search
  }

  builtin.grep_string(config)
end

M.buffers = function()
  builtin.buffers()
end

M.quickfix = function()
  builtin.quickfix()
end

return M
