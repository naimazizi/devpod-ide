#!/bin/bash
packages=(
	build-essential
	fish
	cargo
	fzf
)

brew_packages=(
	pyenv
	pyenv-virtualenv
	lsd
	neovim
	gitui
	fd
	ripgrep
	node
	luarocks
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

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update && sudo apt install google-cloud-cli -y

mkdir -p ~/.config
cd ~/.config
git clone https://github.com/naimazizi/dotconfig .

echo "All packages installed successfully."

chsh -s $(which fish)
