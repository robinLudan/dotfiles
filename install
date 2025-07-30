#!/usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Apps
Apps=('hypr' 'nvim' 'kitty' 'fastfetch' 'waybar' 'wofi' 'mako' 'tmux')

# Zsh aliases
ln -sf $DOTFILES/zsh/aliases $HOME/.zsh_aliases

# Remove any automatically generated config and create a symbolic link
for i in "${Apps[@]}"; do
  rm -rf "$HOME/.config/$i"
  ln -sf "$DOTFILES/$i" "$HOME/.config/$i"
done
