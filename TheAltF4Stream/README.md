# awesome-streamerrc/TheAltF4Stream

Neovim configuration for `blackglasses` at [The Alt-F4 Stream](https://www.twitch.tv/thealtf4stream) on Twitch.

![The Alt-F4 Stream][preview]

## Requirements

The following dependencies must be installed before setup:

- [Bottom](https://github.com/clementtsang/bottom): Host Metrics + Statistics
- [Docker Engine](https://docs.docker.com/engine/install/): LSPContainers Integration
- [k9s](https://k9scli.io/): Kubernetes Integration
- [Lazydocker](https://github.com/jesseduffield/lazydocker): Docker Integration
- [Lazygit](https://github.com/jesseduffield/lazygit): Git Integration
- [Neovim (nightly)](https://github.com/neovim/neovim/releases/tag/nightly): Editor
- [Nnn](https://github.com/jarun/nnn): File Manager
- [Oh-My-Tmux](https://github.com/gpakosz/.tmux): Terminal Multiplexer Environment
- [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh): Shell Environment
- [Packer](https://github.com/wbthomason/packer.nvim): Package Manager
- [Ripgrep](https://github.com/BurntSushi/ripgrep): Search
- [Taskwarrior](https://github.com/GothenburgBitFactory/taskwarrior): Task Manager
- [Taskwarrior TUI](https://github.com/kdheepak/taskwarrior-tui): Task Manager (Terminal UI)
- [Tmux](https://github.com/tmux/tmux): Terminal Multiplexer
- [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH): Shell
- [Zsh-Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions): Shell Auto Suggestions
- [Zsh-Completions](https://github.com/zsh-users/zsh-completions): Shell Auto Completions
- [Zsh-Syntax-Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Shell Syntax Highlighting
- [Zsh-Z](https://github.com/agkozak/zsh-z): Shell Quick Navigation

## Setup

- Neovim
- Oh-My-Tmux
- Oh-My-Zsh

### Neovim

Two symlinks must be created in place of the local Neovim configuration paths:

- first is the configuration entrypoint
- second is the module folder with source code

```shell
ln -s <root-path>/awesome-streamerrc/TheAltF4Stream/nvim/init.lua ~/.config/nvim/init.lua
ln -s <root-path>/awesome-streamerrc/TheAltF4Stream/nvim/lua/TheAltF4Stream ~/.config/nvim/lua/TheAltF4Stream
```

Once both symlinks are created install all plugins with `:PackerSync` in Neovim.

#### Keymaps

To find keymaps for any given plugin check the module file for it in `./nvim/lua/TheAltF4Stream/plugins`.

### Oh-My-Tmux

One symlinks must be created in place of the local `oh-my-tmux` configuration paths:

```shell
ln -s <root-path>/awesome-streamerrc/TheAltF4Stream/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local
```

### Oh-My-Zsh

One symlink must be created in place of the local `oh-my-zsh` configuration paths:

```shell
ln -s <root-path>/awesome-streamerrc/TheAltF4Stream/oh-my-zsh/.zshrc ~/.zshrc
```

[preview]: https://github.com/erkrnt/awesome-streamerrc/blob/master/TheAltF4Stream/TheAltF4Stream.gif "The Alt-F4 Stream"
