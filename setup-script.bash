#!/bin/bash

# An alias for building AUR packages
function aurbuild {
	# This has *very* inconsistent behavior when no arguments are given, be very careful when using this 
	if [ -z $1 ]; then
		echo "Provide a valid AUR repository URL..."
	else
		git clone $1;						# clone repository
		dir=$(echo $1 | cut -d'/' -f4- | cut -d'.' -f1);	# get repository's directory name, extracted from the git URL
		cd $dir;						# cd into repository
		makepkg -si;						# build AUR package
		cd ..;							# cd out of repository
		rm -rf $dir;						# delete repository
	fi
}

# Select a fast mirror to download and upgrade packages
sudo pacman-mirrors --interactive && sudo pacman -Syyu;

# Upgrade the system and load the package databases before installing *anything*
sudo pacman -Syu;

# Installing all of my required packages
sudo pacman -S vim fish git mosh gparted cups-pdf cups hplip efibootmgr dosfstools grub conky tlpui acpi_call tldr refind virtualbox ipython bluez bluez-utils blueman bluez rofi nodejs-lts-fermium python-pywal network-manager-applet networkmanager xorg-xbacklight qtile wtf alacritty discord cmatrix bashtop xclip nitrogen dash tmux openssh python-pip tlp tlp-rdw powertop ttf-fira-code

# Install AUR packages
aurbuild https://aur.archlinux.org/picom-jonaburg-git.git; 	# Picom with kawase blur and rounded corners
aurbuild https://aur.archlinux.org/brave-bin.git;		# Brave browser binary 
aurbuild https://aur.archlinux.org/preload.git;			# Preload 
aurbuild https://aur.archlinux.org/teams.git;			# Microsoft Teams (for classes)
aurbuild https://aur.archlinux.org/visual-studio-code-bin.git;	# Visual Studio Code
aurbuild https://aur.archlinux.org/yaru.git;			# Yaru Theme
aurbuild https://aur.archlinux.org/xbacklight-ctl-git.git;	# Xbacklight
aurbuild https://aur.archlinux.org/intelbacklight-git.git;	# Intelbacklight (I really have no idea what works in between xorg-xbacklight, xbacklight-ctl and intelbacklight)
aurbuild https://github.com/tonsky/FiraCode;			# FiraCode font
aurbuild https://aur.archlinux.org/lf.git;			# Lf (go implementation of ranger)
aurbuild https://aur.archlinux.org/typora.git;			# Typora
aurbuild https://aur.archlinux.org/duf.git;			# Duf (good-looking go implementation of df)

curl -fsSL https://starship.rs/install.sh | bash;		# Install starship prompt


# Copy config files to respective locations
cp config.py ~/.config/qtile/config.py; cp autorun.bash ~/.config/qtile/;	# qtile config and autorun script
mkdir ~/.config/picom; cp picom.conf ~/.config/picom/picom.conf;		# picom config
mkdir ~/.config/rofi; cp config.rasi ~/.config/rofi/config.rasi;		# rofi config
mkdir ~/.config/alacritty; cp alacritty.yml ~/.config/alacritty/alacritty.yml;	# alacritty config

cp starship.toml ~/.config/starship.toml;					# starship config (file isn't in this repo yet)
cp config.fish ~/.config/fish/;							# fish config
mkdir ~/.config/fish/functions/; cp -r ./functions/* ~/.config/fish/functions;	# fish functions


# Cloning some personal repos

mkdir ~/repos;
git clone https://www.github.com/Krishna-Sivakumar/wallpapers.git ~/repos/wallpapers;	# Wallpaper repository
git clone https://www.github.com/Krishna-Sivakumar/termracer.git ~/repos/termracer;	# termracer


# Enabling important services

sudo systemctl start org.cups.cupsd;
sudo systemctl enable org.cups.cupsd; sudo systemctl enable cups.service;
sudo systemctl enable NetworkManager;
sudo systemctl enable preload;
sudo systemctl enable sshd;
sudo systemctl enable bluetooth.service;
sudo NetworkManager;
