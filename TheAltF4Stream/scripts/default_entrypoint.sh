#!/usr/bin/env sh
set -e

usermod -u "${UID}" neovim && su-exec neovim:${GID} nvim "$@"