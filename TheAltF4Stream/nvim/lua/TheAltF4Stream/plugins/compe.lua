local function init()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      -- Built-in
      buffer = true;
      calc = true;
      path = true;
      spell = true;
      tags = true;

      -- Neovim
      nvim_lsp = true;
      nvim_lua = true;

      -- External plugin
      luasnip = true;
      treesitter = true;

      -- External source
      tabnine = true;
      tmux = true;
    };
  }

  vim.o.completeopt = "menuone,noselect"

  vim.cmd([[
    inoremap <silent><expr> <C-Space> compe#complete()
    inoremap <silent><expr> <CR>      compe#confirm('<CR>')
    inoremap <silent><expr> <C-e>     compe#close('<C-e>')
    inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
    inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
  ]])

  --vim.cmd("highlight link CompeDocumentation NormalFloat")
end

return {
  init = init
}
