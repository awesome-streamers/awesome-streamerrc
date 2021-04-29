local function init()
  require'nvim-treesitter.configs'.setup{ ensure_installed={ 'go' }, highlight={ enable=true } }
end

return {
  init = init
}
