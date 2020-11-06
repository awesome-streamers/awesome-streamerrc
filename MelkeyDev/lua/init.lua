local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local nvim_lsp = require'nvim_lsp'

local on_attach_simple = function(client)
  require'completion'.on_attach(client)
end

local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

local on_attach_vim_plus_keymaps = function(client)
  on_attach_vim(client)
  mapper('n', '1gD',        '<cmd> lua vim.lsp.buf.type_definition()<CR>')
  mapper('n', '<C-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
  mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<c-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
  mapper('n', 'K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
  mapper('n', 'H',          '<cmd> lua vim.lsp.buf.hover()<CR>')
  mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
  mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
  mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
  mapper('n', 'gd',         '<cmd> lua vim.lsp.buf.declaration()<CR>')
  mapper('n', '<c-]>',       '<cmd> lua vim.lsp.buf.definition()<CR>')
end

nvim_lsp.pyls_ms.setup{on_attach=on_attach_vim_plus_keymaps}

vim.g.completion_chain_complete_list = {
    default = {
      {complete_items = {"lsp", "buffers", "snippet"}},
      {mode = "file"},
      {mode = '<c-p>'},
      {mode = '<c-n>'}
    }
}
