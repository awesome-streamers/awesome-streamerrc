FROM alpine:3.13.5 as neovim

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
  && make CMAKE_BUILD_TYPE="RelWithDebInfo" -C "/neovim" install


FROM alpine:3.13.5

RUN apk add --no-cache \
  bash \
  bat \
  build-base \
  curl \
  docker \
  gcc \
  git \
  lazygit \
  nnn \
  ripgrep \
  task \
  unzip \
  zsh

RUN curl -L https://github.com/ClementTsang/bottom/releases/download/0.6.1/bottom_x86_64-unknown-linux-musl.tar.gz -o /bottom.tar.gz \
  && tar -zxvf /bottom.tar.gz -C /root \
  && rm -rf /bottom.tar.gz \
  && mv /root/btm /usr/local/bin/btm

RUN curl -L https://github.com/kdheepak/taskwarrior-tui/releases/download/v0.13.24/taskwarrior-tui-x86_64-unknown-linux-musl.tar.gz -o /taskwarrior-tui.tar.gz \
  && tar -zxvf /taskwarrior-tui.tar.gz -C /root \
  && rm -rf /taskwarrior-tui.tar.gz \
  && mv /root/taskwarrior-tui /usr/local/bin/taskwarrior-tui

COPY --from=neovim /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim /usr/local/share/nvim /usr/local/share/nvim

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
  && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
  && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

RUN git clone https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY ./oh-my-zsh/.zshrc /root/.zshrc
COPY ./nvim/init.lua /root/.config/nvim/init.lua
COPY ./nvim/lua /root/.config/nvim/lua/TheAltF4Stream
COPY ./taskwarrior/.taskrc /root/.taskrc

RUN nvim --headless -c "autocmd User PackerComplete qa" -c PackerSync \
  && timeout 15s nvim --headless -c "TSUpdate" || exit 0

WORKDIR /code

VOLUME [ "/code" ]

ENTRYPOINT [ "nvim" ]
