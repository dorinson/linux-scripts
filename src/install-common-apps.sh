#!/bin/bash     

sudo dnf install -y zsh wget curl neovim htop figlet lolcat neofetch exa bat procs fd-find qbittorrent tmux asciinema
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
