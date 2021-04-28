local function init()
  vim.g.coc_global_extensions = {
    'coc-actions',
    'coc-angular',
    'coc-css',
    'coc-cssmodules',
    'coc-docker',
    'coc-elixir',
    'coc-floaterm',
    'coc-go',
    'coc-highlight',
    'coc-html',
    'coc-json',
    'coc-lua',
    'coc-markdownlint',
    'coc-marketplace',
    'coc-prettier',
    'coc-python',
    'coc-rust-analyzer',
    'coc-sh',
    'coc-snippets',
    'coc-sql',
    'coc-tabnine',
    'coc-tailwindcss',
    'coc-tsserver',
    'coc-yaml'
  }

  vim.wo.signcolumn = "yes"

end

return {
  init = init
}
