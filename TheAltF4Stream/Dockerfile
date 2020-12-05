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

RUN git clone --progress "https://github.com/neovim/neovim.git" \
  && (cd neovim && git checkout "tags/v0.4.4") \
  && make CMAKE_BUILD_TYPE="RelWithDebInfo" -C "/neovim" install


FROM alpine:3.12.1

RUN apk add --no-cache \
  bash \
  build-base \
  curl \
  gcc \
  git \
  go \
  nodejs \
  ripgrep \
  rust \
  shadow \
  su-exec \
  unzip \
  yarn

COPY --from=build /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=build /usr/local/share/nvim /usr/local/share/nvim

RUN addgroup "neovim" \
  && adduser -D -G "neovim" -g "" -s "/bin/bash" "neovim" \
  && su-exec neovim:neovim \
  curl -fLo "/home/neovim/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
  && su-exec neovim:neovim \
  mkdir -p /home/neovim/.config/nvim/plugged

COPY ./init.vim /home/neovim/.config/nvim/init.vim

RUN su-exec neovim:neovim nvim --headless +PlugInstall +qa

COPY ./scripts/default_entrypoint.sh /docker_entrypoint.sh

WORKDIR /workspace

ENTRYPOINT [ "/docker_entrypoint.sh" ]
