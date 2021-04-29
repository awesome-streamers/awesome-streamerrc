local function init()
  require'compe'.register_source('tabnine', require'compe_tabnine')
end

return {
  init = init
}
