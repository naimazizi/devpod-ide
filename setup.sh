#!/bin/bash
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"

git submodule update

ln -sf "$PWD/.config/nvim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$PWD/.config/fish" "$XDG_CONFIG_HOME/fish"

packages=(
	fd-find
	ripgrep
	gitui
	fish
	pyenv
	neovim
)

for package in "${packages[@]}"; do
	echo "Installing $package..."
	apt install -y "$package"
done

echo "All packages installed successfully."
