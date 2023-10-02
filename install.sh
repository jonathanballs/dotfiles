#!/bin/bash
echo "Installing config for arch"
pacman -S bat
pacman -S tmux
pacman -S htop
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo "Generating symlinks"
sudo ln zsh/.zshrc ~/.zshrc
sudo ln zsh/.zprofile ~/.zprofile
sudo ln tmux/.tmux.conf ~/.tmux.conf
