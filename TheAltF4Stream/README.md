# awesome-streamerrc/TheAltF4Stream

Neovim configuration and optional "Neovim-in-Docker" environment for `blackglasses` at [The Alt-F4 Stream](https://www.twitch.tv/thealtf4stream) on Twitch.

![The Alt-F4 Stream][preview]

## Use Cases

There are three main goals for this repository:

- To provide a `drag-and-drop` Neovim configuration for local installations. (performance)
- To provide a `pre-built` Neovim-in-Docker environment w/ configuration included. (portability)
- To provide an `auto-loading` Neovim-in-Docker environment w/ overridable configuration options. (experimental)

The first two should work out of the box - the `auto-loading` Docker image is still HIGHLY experimental and NOT recommended for actual development use.

### Drag-and-drop Configuration

To use this configuration for your own personal use (recommended):

1. Install `neovim` nightly (required for LSP support) using the instructions at https://github.com/neovim/neovim

2. Install `vim-plug` (required for plugins management) using the instructions at https://github.com/junegunn/vim-plug

3. Copy `init.vim` to the local Neovim config path:

> NOTE: The default Neovim config path is used below but may vary depending on installation method.

```
mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim
```

4. Install `plugins` for Neovim using headless operation:

```
nvim --headless +PlugInstall +qa
```

This last step can also be achieved using `:PlugInstall` after opening Neovim - however it will require a restarting for them to properly load.

### Pre-built Environment

To use this configuration as a portable pre-built Neovim-in-Docker environment:

> NOTE: If you are a Windows user, this option is currently only supported using WSL 2 which provides a Linux shell.

1. Install Docker for your operating system at https://docs.docker.com/get-docker/

2. (optional) If you would like to use a custom tag rather than download the latest `erkrnt/nvim:latest` tag:

```
docker image build --tag <tag-name> .
```

3. Run the following in your working directory:

```
docker container run \
--env "GID=$GID" \
--env "UID=$UID" \
--interactive \
--rm \
--tty \
--volume "$PWD:/workspace" \
erkrnt/nvim:latest [<filename> | <folder>]
```

> NOTE: If you built a custom tag (step 2) replace `erkrnt/nvim:latest` when using the command above.

### Auto-loading Environment (experimental)

To be documented.

[preview]: https://github.com/erkrnt/awesome-streamerrc/blob/master/TheAltF4Stream/TheAltF4Stream.png "The Alt-F4 Stream"
