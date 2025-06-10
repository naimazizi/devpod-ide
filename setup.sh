#!/bin/bash
packages=(
	build-essential
	fish
	cargo
)

brew_packages=(
	pyenv
	pyenv-virtualenv
	lsd
	neovim
	gitui
	fd
	ripgrep
	fzf
)

sudo apt update -y
for package in "${packages[@]}"; do
	echo "Installing $package..."
	sudo apt install -y "$package"
done

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

for package in "${brew_packages[@]}"; do
	echo "Installing $package..."
	/home/linuxbrew/.linuxbrew/bin/brew install "$package"
done

mkdir -p ~/.config
cd ~/.config
git clone https://github.com/naimazizi/dotconfig .

echo "All packages installed successfully."

chsh -s $(which fish)
