local function init()
  require 'TheAltF4Stream.vim'.init()
  require 'TheAltF4Stream.packer'.init()
end

return {
  init = init,
}
