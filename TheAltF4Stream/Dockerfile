FROM alpine:latest as neovim

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


FROM alpine:latest

RUN apk add --no-cache \
  bash \
  bat \
  build-base \
  curl \
  gcc \
  git \
  go \
  lazygit \
  nodejs \
  ranger \
  ripgrep \
  python3 \
  python3-dev \
  rustup \
  shadow \
  su-exec \
  unzip \
  yarn \
  zsh

COPY --from=neovim /usr/local/bin/nvim /usr/local/bin/nvim
COPY --from=neovim /usr/local/share/nvim /usr/local/share/nvim

RUN curl https://bootstrap.pypa.io/get-pip.py -o "/get-pip.py" \
  && python3 "/get-pip.py" \
  && rm -rf "/get-pip.py" \
  && python3 -m pip install --upgrade pynvim

RUN addgroup "neovim" \
  && adduser -D -G "neovim" -g "" -s "/bin/zsh" "neovim"

USER neovim

ENV GOENV="/home/neovim/Development/go"
ENV GOPATH="${GOENV}" 

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

RUN curl -fLo "/home/neovim/.local/share/nvim/site/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" \
  && mkdir -p /home/neovim/.config/nvim/plugged

COPY --chown="neovim" ./.ripgreprc /home/neovim/.ripgreprc
COPY --chown="neovim" ./.zshrc /home/neovim/.zshrc
COPY --chown="neovim" ./init.vim /home/neovim/.config/nvim/init.vim
COPY --chown="neovim" ./coc-settings.json /home/neovim/.config/nvim/coc-settings.json 

RUN /usr/local/bin/nvim --headless +PlugInstall +qa

WORKDIR /home/neovim
