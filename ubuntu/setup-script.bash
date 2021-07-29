#!/bin/bash

# Ubuntu Setup Script
# Author: Krishna Sivakumar (2021)

## Installing some important packages
sudo apt install rofi alacritty fish pass peco tmux;
python3 -m pip install pywal;
echo "rofi, alacritty, fish, gnu-pass, peco and tmux were installed!"

## Copy config files to respective locations
# cp config.py ~/.config/qtile/config.py; cp autorun.bash ~/.config/qtile/;		# qtile config and autorun script
mkdir ~/.config/picom; cp picom.conf ~/.config/picom/picom.conf;			# picom config
mkdir ~/.config/rofi; cp config.rasi ~/.config/rofi/config.rasi;			# rofi config
mkdir ~/.config/alacritty; cp alacritty.yml ~/.config/alacritty/alacritty.yml;		# alacritty config

# cp starship.toml ~/.config/starship.toml;						# starship config (file isn't in this repo yet)
cp config.fish ~/.config/fish/;								# fish config
mkdir ~/.config/fish/functions/; cp -r ./functions/* ~/.config/fish/functions;		# fish functions

echo "moved config files to correct locations!"


## Cloning some personal repos

mkdir ~/repos;
cd ~/repos;
git clone https://www.github.com/Krishna-Sivakumar/wallpapers.git ~/repos/wallpapers;	# Wallpaper repository
git clone https://www.github.com/Krishna-Sivakumar/termracer.git ~/repos/termracer;	# termracer
git clone https://www.github.com/yshui/picom.git ~/repos/picom;				# Custom picom build

echo "cloned personal repos to right places!"

## Installing Picom

cd ~/repos/picom;

# Installing picom requirements
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev;

# Building and installing picom
git submodule update --init --recursive;
meson --buildtype=release . build;
ninja -C build install;

## Installing Haskell and XMonad

cd ~/repos;
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh; 		# GHCup and Haskell
sudo apt install xmonad;								# Xmonad
