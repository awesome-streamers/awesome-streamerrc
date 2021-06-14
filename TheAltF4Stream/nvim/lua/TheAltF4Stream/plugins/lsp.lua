local lspcontainers = require'lspcontainers'
local util = require 'lspconfig/util'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local lua_settings = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
      -- Setup your lua path
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local function init()
  local lspconfig_servers = {
    "bashls",
    "cssls",
    "dockerls",
    "elixirls",
    "gopls",
    "graphql",
    "html",
    "jsonls",
    "pylsp",
    "rust_analyzer",
    "sqlls",
    "sumneko_lua",
    "terraformls",
    "tsserver",
    "yamlls"
  }

  for _, s in pairs(lspconfig_servers) do
    local c = make_config()

    if s == "bashls" then
      c.before_init = function(params)
        params.processId = vim.NIL
      end

      c.cmd = lspcontainers.command(s)
      c.root_dir = util.root_pattern(".git", vim.fn.getcwd())
    end

    if s == "dockerls" then
      c.before_init = function(params)
        params.processId = vim.NIL
      end

      c.cmd = lspcontainers.command(s)
      c.root_dir = util.root_pattern(".git", vim.fn.getcwd())
    end

    if s == "pylsp" then
      c.cmd = lspcontainers.command(s)
    end

    if s == "sumneko_lua" then
      c.cmd = lspcontainers.command(s)
      c.settings = lua_settings
    end

    if s == "rust_analyzer" then
      --c.cmd = lspcontainers.command(s)
      --c.root_dir = util.root_pattern(".git", vim.fn.getcwd())
      c.settings = {
        ["rust-analyzer"] = {
          updates = {
            channel = "nightly"
          }
        }
      }

      vim.api.nvim_exec([[
        autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint" } }
      ]], false)
    end

    if s == "terraformls" then
      c.cmd = lspcontainers.command(s)
      c.filetypes = { "hcl", "tf", "terraform", "tfvars" }
    end

    if s == "tsserver" then
      c.before_init = function(params)
        params.processId = vim.NIL
      end

      c.cmd = lspcontainers.command(s)
      c.root_dir = util.root_pattern(".git", vim.fn.getcwd())
    end

    if s == "yamlls" then
      c.before_init = function(params)
        params.processId = vim.NIL
      end

      c.cmd = lspcontainers.command(s)
      c.root_dir = util.root_pattern(".git", vim.fn.getcwd())
    end

    require'lspconfig'[s].setup(c)
  end
end

return {
  init = init
}
