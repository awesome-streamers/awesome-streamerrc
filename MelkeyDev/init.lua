local vim = vim

vim.g.mapleader = ' ' 

vim.cmd[[colorscheme onedark]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false
  }
)

local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.scrolloff = 7
o.expandtab = true
o.foldlevelstart = 99
wo.number = true -- display line numbers
wo.relativenumber = true -- display relative line numbers
wo.signcolumn = 'yes'
wo.wrap = true 

o.syntax = 'on'

--vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
--vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
--vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
--vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

--hi LspDiagnosticsUnderlineWarning gui=underline guifg=None

require'melkey'
