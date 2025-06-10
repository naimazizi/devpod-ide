#!/bin/bash
packages=(
	build-essential
	fd-find
	ripgrep
	fish
	cargo
)

sudo apt update -y
for package in "${packages[@]}"; do
	echo "Installing $package..."
	sudo apt install -y "$package"
done

curl -fsSL https://pyenv.run | bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

mkdir -p ~/.config
cd ~/.config
git clone https://github.com/naimazizi/dotconfig .

echo "All packages installed successfully."

chsh -s $(which fish)
