local function init()
  require 'TheAltF4Stream.vim'.init()
  require 'TheAltF4Stream.plugins'.init()
end

return {
  init = init,
}
