#!/bin/bash

echo "Setting up dotfiles"

# Install necessary packages
sudo apt update
sudo apt upgrade

sudo apt install -y curl kitty zsh i3 polybar git fonts-firacode cmake make build-essential gcc

# installing neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

curl -L https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

sh ./symlinker.sh

# Set Zsh as default shell
chsh -s $(which zsh)

echo "Dotfiles setup complete! Please restart your terminal."
