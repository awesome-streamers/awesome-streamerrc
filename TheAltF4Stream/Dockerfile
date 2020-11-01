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

# TODO : clone all plugins repos
# RUN nvim --headless +PlugInstall +qall

# RUN mkdir -p /root/.config/nvim
# COPY init.vim /root/.config/nvim/init.vim

WORKDIR /workspace
ENTRYPOINT [ "nvim" ]
