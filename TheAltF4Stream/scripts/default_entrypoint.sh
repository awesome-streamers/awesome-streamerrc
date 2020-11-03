#!/usr/bin/env sh
set -e

echo -e "\nSetting neovim UID to ${UID}..." \
  && usermod -u "${UID}" neovim \
  && echo -e "\nStarting neovim as ${UID}:${GID}..." \
  && su-exec neovim:${GID} nvim "$@"