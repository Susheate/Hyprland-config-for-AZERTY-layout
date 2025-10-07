#!/bin/bash


echo "Installing packages"
sudo pacman -Sy --needed --noconfirm zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-fira-code otf-font-awesome dolphin uwsm


echo "Copying hyprland.conf"
cp -rf /hypr/hyprland.conf ~/.config/hypr


echo "Copying waybar.jsonc"
cp -rf /waybar/waybar.jsonc ~/.config/waybar


echo "Copying .zshrc"
cp -rf /zsh/.zshrc ~/.config


echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing yay"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


echo "Installing AUR packages, check PKGBUILD"
yay -S --needed zen-browser-bin


echo "Installation complete"
