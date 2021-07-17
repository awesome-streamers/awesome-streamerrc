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

local function setup(config, server)
  local lspcontainers = require'lspcontainers'
  local util = require 'lspconfig/util'

  if server == "bashls" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.cmd = lspcontainers.command(server)
    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  if server == "dockerls" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.cmd = lspcontainers.command(server)
    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  if server == "gopls" then
    config.cmd = lspcontainers.command(server)
  end

  if server == "html" then
    config.cmd = lspcontainers.command(server)
  end

  if server == "pylsp" then
    config.cmd = lspcontainers.command(server)
  end

  if server == "sumneko_lua" then
    config.cmd = lspcontainers.command(server)
    config.settings = lua_settings
  end

  if server == "rust_analyzer" then
    --config.cmd = lspcontainers.command(server)
    --config.root_dir = util.root_pattern(".git", vim.fn.getcwd())

    vim.api.nvim_exec([[
      autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"TypeHint", "ChainingHint", "ParameterHint" } }
    ]], false)
  end

  if server == "terraformls" then
    config.cmd = lspcontainers.command(server)
    config.filetypes = { "hcl", "tf", "terraform", "tfvars" }
  end

  if server == "tsserver" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.cmd = lspcontainers.command(server)
    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end

  if server == "yamlls" then
    config.before_init = function(params)
      params.processId = vim.NIL
    end

    config.cmd = lspcontainers.command(server)
    config.root_dir = util.root_pattern(".git", vim.fn.getcwd())
  end
end

return {
  setup = setup
}
