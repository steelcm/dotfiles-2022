# install Nix
echo "Insalling Nix..."
curl -L https://nixos.org/nix/install | sh
. ~/.nix-profile/etc/profile.d/nix.sh

# install Nix packages
echo "Insalling Nix Packages..."
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
	nixpkgs.meslo-lgs-nf \
	nixpkgs.lazygit \
	nixpkgs.xclip \
	nixpkgs.ffmpeg \
	nixpkgs.php81 \
	nixpkgs.php81Packages.composer \
	nixpkgs.ripgrep


# add zsh to /etc/shells if not done so already
if ! cat /etc/shells | grep -q "zsh"; then
	echo "Adding ZSH to /etc/shells..."
	command -v zsh | sudo tee -a /etc/shells
fi

echo "Changing user shell to ZSH..."
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins 
echo "Bundle ZSH plugins..."
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install vim plug
sh -c 'curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# stow font conig file ~/.config/fontconfig/conf.d/10-nix-fonts.conf

