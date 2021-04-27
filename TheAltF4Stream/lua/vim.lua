local set_vim_g = function()
	vim.g.mapleader = " "
end

local set_vim_o = function()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 3,
		softtabstop = 2,
    showmode = false,
    termguicolors = true
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  -- Custom vim.o
  vim.o.shortmess = vim.o.shortmess .. 'c'

  -- Not yet in vim.o
  vim.cmd('set encoding=utf8')
  vim.cmd('set nowritebackup')
  vim.cmd('set shiftwidth=2')
  vim.cmd('set secure')
  vim.cmd('set splitright')
  vim.cmd('set tabstop=2')
  vim.cmd('set updatetime=300')
end

local set_vim_wo = function()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

function VimInit()
	set_vim_g()
  set_vim_o()
  set_vim_wo()
end
