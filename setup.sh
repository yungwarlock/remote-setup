#!/usr/bin/env bash

pushd /workspaces
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage

  chmod u+x ./nvim.appimage
  ./nvim.appimage --appimage-extract

  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  cp $OLDPWD/nvim.tar.gz .

  tar -xzvf ./nvim.tar.gz
  cp -r nvim ~/.config/

  ./squashfs-root/usr/bin/nvim +PlugInstall +qall
popd

echo "alias nvim=/workspaces/squashfs-root/usr/bin/nvim" >> ~/.bashrc

/workspaces/squashfs-root/usr/bin/nvim

