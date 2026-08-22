#!/usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Apps
Apps=('niri' 'noctalia' 'nvim' 'foot' 'fastfetch' 'tmux')

# Zsh aliases
ln -sf "$DOTFILES/zsh/aliases" "$HOME/.bash_aliases"

# Remove any automatically generated config and create a symbolic link
for i in "${Apps[@]}"; do
  rm -rf "$HOME/.config/$i"
  ln -sf "$DOTFILES/$i" "$HOME/.config/$i"
done
