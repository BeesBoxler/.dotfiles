#!/usr/bin/env bash

cd $HOME
git clone https://github.com/BeesBoxler/.dotfiles.git
cd .dotfiles
./setup.sh

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Please ensure you have tmux 3.4 and nvim 0.11 installed. Peace out."
