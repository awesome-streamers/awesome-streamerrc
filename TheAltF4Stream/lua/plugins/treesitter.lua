local function init()
  require'nvim-treesitter.configs'.setup{ ensure_installed='all', highlight={ enable=true } }
end

return {
  init = init
}
