function aurbuild {
	if [ -z $1 ]; then
		echo "Provide a valid AUR repository URL..."
	else
		git clone $1;
		dir=$(echo $1 | cut -d'/' -f4- | cut -d'.' -f1);
		cd $dir;
		makepkg -si;
		cd ..;
		rm -rf $dir;
	fi
}

sudo pacman -S git mosh gparted cups-pdf cups hplip efibootmgr dosfstools grub conky tlpui acpi_call tldr refind virtualbox ipython bluez bluez-utils blueman bluez rofi nodejs-lts-fermium python-pywal network-manager-applet networkmanager xorg-xbacklight qtile wtf alacritty discord cmatrix bashtop xclip nitrogen dash tmux openssh python-pip tlp tlp-rdw powertop ttf-fira-code

aurbuild https://aur.archlinux.org/picom-jonaburg-git.git;
aurbuild https://aur.archlinux.org/brave-bin.git;
aurbuild https://aur.archlinux.org/preload.git;
aurbuild https://aur.archlinux.org/teams.git;
aurbuild https://aur.archlinux.org/visual-studio-code-bin.git;
aurbuild https://aur.archlinux.org/yaru.git;
aurbuild https://aur.archlinux.org/xbacklight-ctl-git.git;
aurbuild https://aur.archlinux.org/intelbacklight-git.git;
aurbuild https://aur.archlinux.org/picom-jonaburg-git.git;
aurbuild https://github.com/tonsky/FiraCode;
aurbuild https://aur.archlinux.org/lf.git;
aurbuild https://aur.archlinux.org/typora.git;
aurbuild https://aur.archlinux.org/duf.git;

mkdir ~/.config/qtile; cp ./config.py ~/.config/qtile/config.py; cp ./autorun.bash ~/.config/qtile/;
mkdir ~/.config/picom; cp ./picom.conf ~/.config/picom/picom.conf;
mkdir ~/.config/rofi; cp ./config.rasi ~/.config/rofi/config.rasi;
mkdir ~/.config/alacritty; cp ./alacritty.yml ~/.config/alacritty/alacritty.yml;

curl -fsSL https://starship.rs/install.sh | bash;

cp ./starship.toml ~/.config/starship.toml;
cp ./config.fish ~/.config/fish/;
mkdir ~/.config/fish/functions/; cp -r ./functions/* ~/.config/fish/functions;

mkdir ~/repos;
git clone https://www.github.com/Krishna-Sivakumar/wallpapers.git ~/repos/wallpapers;
git clone https://www.github.com/Krishna-Sivakumar/termracer.git ~/repos/termracer;

sudo systemctl start org.cups.cupsd;
sudo systemctl enable org.cups.cupsd;
sudo systemctl enable cups.service;
sudo systemctl enable NetworkManager;
sudo systemctl enable preload;
sudo systemctl enable sshd;
sudo systemctl enable bluetooth.service;
NetworkManager;
