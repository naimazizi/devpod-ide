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

git submodule update

mkdir -p ~/.config
cd ~/dotconfig
stow --target ~/.config . -v

echo "All packages installed successfully."

chsh -s $(which fish)
