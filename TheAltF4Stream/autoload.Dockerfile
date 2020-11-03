FROM alpine:3.12.1 as build

RUN apk add --no-cache \
  autoconf \
  automake \
  build-base \
  cmake \
  coreutils \
  curl \
  gettext-tiny-dev \
  git \
  libtool \
  pkgconf \
  unzip

RUN git clone --branch "nightly" --depth="1" --progress "https://github.com/neovim/neovim.git" \
  && make CMAKE_BUILD_TYPE="RelWithDebInfo" -C "/neovim" install


FROM alpine:3.12.1

RUN apk add --no-cache \
  build-base \
  curl \
  gcc \
  git \
  shadow \
  su-exec \
  unzip

RUN addgroup "neovim" \
  && adduser -D -G "neovim" -g "" -s "/bin/bash" "neovim" \
  && su-exec neovim:neovim \
  curl -fLo "/home/neovim/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
  && su-exec neovim:neovim \
  mkdir -p /home/neovim/.config/nvim/plugged

COPY ./scripts/autoload_entrypoint.sh /docker_entrypoint.sh

COPY --from=build /usr/local/share/nvim /usr/local/share/nvim
COPY --from=build /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=build /usr/local/lib64/nvim /usr/local/lib64/nvim

WORKDIR /workspace

ENTRYPOINT [ "/docker_entrypoint.sh" ]