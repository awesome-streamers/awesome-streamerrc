" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/sasha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/sasha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/sasha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/sasha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/sasha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  NERDTree = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/NERDTree"
  },
  SimpylFold = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/SimpylFold"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["deoplete-jedi"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/deoplete-jedi"
  },
  ["deoplete.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/deoplete.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indentpython.vim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/indentpython.vim"
  },
  ["jedi-vim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/jedi-vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  neomake = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/neomake"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tagbar = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-jinja"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-jinja"
  },
  ["vim-nerdtree-syntax-highlight"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-nerdtree-syntax-highlight"
  },
  ["vim-nerdtree-tabs"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-nerdtree-tabs"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-prettier"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-prettier"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/sasha/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
