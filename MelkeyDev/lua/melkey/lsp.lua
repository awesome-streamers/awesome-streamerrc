local lspconfig = require'lspconfig'

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    --defines error in line via keybinding 
    virtual_text = false,
    underline = { severity_limit = "Error" },
    signs = true,
    update_in_insert = false,
  }
)

local function lsp_map(mode, left_side, right_side)
  vim.api.nvim_buf_set_keymap(0, mode, left_side, right_side, {noremap=true})           
end

local function default_on_attach(client)
  print('Attaching to ' .. client.name)

  lsp_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  lsp_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  lsp_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  lsp_map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
  lsp_map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
  lsp_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  lsp_map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
  lsp_map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  lsp_map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  lsp_map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
  lsp_map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')


end

local default_config = {
  on_attach = default_on_attach,
}

local pid = vim.fn.getpid()
local cache_path = vim.fn.stdpath('cache')
local sumneko_lua_root_path = cache_path .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_lua_binary = sumneko_lua_root_path .. '/bin/Linux/lua-language-server'

-- Language Servers
lspconfig.pyls.setup(default_config)
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.tsserver.setup(default_config)
lspconfig.sumneko_lua.setup({
    cmd = {sumneko_lua_binary, "-E", sumneko_lua_root_path .. '/main.lua'},
    on_attach = default_on_attach,
    settings = {
      Lua ={
        runtime = {
          version = 'LuaJIT',
          path = vim.split(package.path, ';')
        },
        diagnostics = {
          globals = {'vim'}
        },
        workspace = {
          library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
          }
        }
      }
    }
})
lspconfig.vimls.setup(default_config)
lspconfig.yamlls.setup(default_config)
