#!/bin/bash
packages=(
	build-essential
	fd-find
	ripgrep
	gitui
	fish
	pyenv
	neovim
	cargo
)

sudo apt update -y
for package in "${packages[@]}"; do
	echo "Installing $package..."
	sudo apt install -y "$package"
done

mkdir -p ~/.config
cd ~/.config
git clone https://github.com/naimazizi/dotconfig .

echo "All packages installed successfully."

chsh -s $(which fish)
