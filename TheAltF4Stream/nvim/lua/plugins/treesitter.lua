local function init()
  require'nvim-treesitter.configs'.setup{ ensure_installed={ 'go', 'lua' }, highlight={ enable=true } }
end

return {
  init = init
}
