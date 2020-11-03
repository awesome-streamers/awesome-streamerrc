# awesome-streamerrc/TheAltF4Stream

Neovim configuration and optional "Neovim-in-Docker" environment for `blackglasses` at [The Alt-F4 Stream](https://www.twitch.tv/thealtf4stream) on Twitch.

![The Alt-F4 Stream][preview]

## Project Goals

There are three main goals for this repository:

- To provide a `drag-and-drop` Neovim configuration for local installations. (performance)
- To provide a `pre-built` Neovim-in-Docker environment w/ configuration included. (portability)
- To provide an `auto-loading` Neovim-in-Docker environment w/ overridable configuration options. (experimental)

The first two should work out of the box - the `auto-loading` Docker image is still HIGHLY experimental and NOT recommended for actual development use.

## Drag-and-drop Configuration

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

This last step can also be achieved using `:PlugInstall` after opening Neovim - however it will require a restart for them to properly load.

## Pre-built Environment

To use this configuration as a portable pre-built Neovim-in-Docker environment:

> NOTE: If you are a Windows user, this option is currently only supported using WSL 2 which provides a Linux shell.

1. Install Docker for your operating system at https://docs.docker.com/get-docker/

2. (optional) If you would like to use a custom tag rather than download the latest `erkrnt/nvim:latest` tag:

```
docker image build --tag <tag-name> .
```

3. (suggested) If you would like to cache compiled or downloaded plugins - create a named Docker volume:

> NOTE: This avoids things like `nvim-treesitter` needing to compile on every load.

```
docker volume create neovim_data
```

4. Run the following in your working directory:

> NOTE: If you built a custom tag (step 2) replace `erkrnt/nvim:latest` when using the command below.

```
docker container run \
--env "GID=$GID" \
--env "UID=$UID" \
--interactive \
--rm \
--tty \
--volume "neovim_data:/home/neovim/.config" \
--volume "$PWD:/workspace" \
erkrnt/nvim:latest [<filename> | <folder>]
```

> NOTE: If you didn't create a named Docker volume (step 3) remove the following line

```
--volume "neovim_data:/home/neovim/.config" \
```

## Auto-loading Environment (experimental)

> WARNING: WORKING IN PROGRESS - EXPERIMENTAL USE ONLY.

To use as an auto-loading Neovim environment and mount ANY `init.vim` configuration for portability. This method has two requirements:

- The target "init.vim" has NO ERRORS on load due to plugins missing, etc `(see init.vim for examples)`
- The target "init.vim" is in a folder `(ie. myNeovimEnv/init.vim)` to mount with Docker bind volume

When this image starts ":PlugInstall" is ran headlessly `(see scripts/autoload_entrypoint.sh)` to install plugins then Neovim is executed with the passed parameters from Docker CLI. A "plugged" folder will appear inside the mounted configuration path if this worked properly.

1. (optional) If you would like to use a custom tag rather than download the latest `erkrnt/nvim-autoload:latest` tag:

```
docker image build --file autoload.Dockerfile --tag <tag-name> .
```

2. Run the following in your working directory and replace `<config-dir-path>` with the location of the folder containing your `init.vim` file:

> NOTE: If you built a custom tag (step 1) replace `erkrnt/nvim-autoload:latest` when using the command below.

```
docker container run \
--env "GID=$GID" \
--env "UID=$UID" \
--interactive \
--rm \
--tty \
--volume "<config-dir-path>:/home/neovim/.config/nvim" \
--volume "$PWD:/workspace" \
erkrnt/nvim-autoload:latest [<filename> | <folder>]
```

[preview]: https://github.com/erkrnt/awesome-streamerrc/blob/master/TheAltF4Stream/TheAltF4Stream.png "The Alt-F4 Stream"
