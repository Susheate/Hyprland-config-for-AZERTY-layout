#!/bin/bash


echo 'Installing packages'
sudo pacman -S --needed --noconfirm zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-fira-code otf-font-awesome dolphin uwsm xdg-desktop-portal-hyprland xdg-desktop-portal


echo 'Changing shell to Zsh'
sudo chsh -s /bin/zsh

echo 'Copying the fastfetch config'
cp -rf fastfetch/config.jsonc ~/.config/fastfetch

echo 'Copying hyprland.conf'
cp -rf hypr/hyprland.conf ~/.config/hypr


echo 'Copying the waybar config'
cp -rf waybar/config.jsonc ~/.config/waybar


echo 'Installing Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo 'Copying .zshrc'
cp -rf zsh/.zshrc ~/.config


echo 'Installing yay'
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


echo 'Installing AUR packages, check PKGBUILD'
yay -S --needed zen-browser-bin


echo 'Installation complete'
