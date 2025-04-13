#!/usr/bin/env bash

DOTFILES_DIR="$HOME/.dotfiles"

mkdir -p ~/.config/kitty
ln -sf "$DOTFILES_DIR/kitty/kitty.conf" ~/.config/kitty/kitty.conf
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Monokai_Pro.conf
wget "$THEME" -P ~/.config/kitty/kitty-themes/themes
ln -sf ~/.config/kitty/kitty-themes/themes/Monokai_Pro.conf ~/.config/kitty/theme.conf

ln -sf "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/nushell/
ln -sf "$DOTFILES_DIR/nushell/config.nu" ~/.config/nushell/config.nu

echo "All done. Long may you reign, shell princess."
