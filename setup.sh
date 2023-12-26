#!/usr/bin/env bash

pushd .
  cd /workspace
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  ./nvim.appimage --appimage-extract

  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  tar -xzvf ./nvim.tar.gz
  cp -r nvim ~/.config/

  ./squashfs-root/usr/bin/nvim +PlugInstall +qall
popd

/workspace/squashfs-root/usr/bin/nvim

