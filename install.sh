#!/bin/bash

echo "Setting up dotfiles"

# Install necessary packages
sudo apt update
sudo apt upgrade

sudo apt install -y curl kitty zsh i3 polybar git fonts-firacode cmake make build-essential \
    gcc zip npm ripgrep g++ libfuse2 python3-venv python3-pip picom rofi \
    unzip gdb fontconfig

# installing neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
sudo chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# installing rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#install nerd-fonts
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
unzip -o FiraCode.zip -d "$FONT_DIR"
rm FiraCode.zip

# refresh font cache
fc-cache -fv

#install ohmyzsh
curl -L https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#install browser
curl -fsS https://dl.brave.com/install.sh | sh

if [ -f "$HOME/.zshrc" ]; then
    echo "Removing existing .zshrc..."
    rm "$HOME/.zshrc"
fi

sh ./symlinker.sh

# Set Zsh as default shell
chsh -s $(which zsh)

echo "Dotfiles setup complete! Please restart your terminal."
