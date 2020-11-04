#!/usr/bin/env sh
set -e

usermod -u "${UID}" neovim \
  && echo -e '\nUpdating Neovim plugins via :PlugInstall...\n' \
  && su-exec neovim:${GID} nvim --headless +PlugInstall +qa \
  && su-exec neovim:${GID} nvim "$@"