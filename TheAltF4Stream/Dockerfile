FROM alpine:3.12.1
RUN apk add --no-cache \
  build-base \
  cmake \
  automake \
  autoconf \
  libtool \
  pkgconf \
  coreutils \
  curl \
  unzip \
  gettext-tiny-dev \
  git
RUN git clone --branch "nightly" --progress "https://github.com/neovim/neovim.git" \
  && make CMAKE_BUILD_TYPE="Release" -C "./neovim" install
RUN curl -fLo "${HOME}/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

RUN mkdir -p /root/.config/nvim
COPY init.vim /root/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +qall

WORKDIR /workspace
ENTRYPOINT [ "nvim" ]
