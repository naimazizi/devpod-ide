#!/bin/bash
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

git submodule update

ln -sf "$PWD/.config/nvim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$PWD/.config/fish" "$XDG_CONFIG_HOME/fish"

packages=(
	fd
	ripgrep
	gitui
	fish
	pyenv
)

for package in "${packages[@]}"; do
	echo "Installing $package..."
	pacman -Sy --noconfirm "$package"
done

echo "All packages installed successfully."
