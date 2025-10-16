#!/bin/bash

echo 'Updating system'
sudo pacman -Syu


echo 'Installing packages'
sudo pacman -S --needed --noconfirm zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-fira-code otf-font-awesome dolphin uwsm xdg-desktop-portal-hyprland xdg-desktop-portal dolphin playerctl wofi archlinux-xdg-menu hyprpaper blueman


echo 'Changing shell to Zsh'
chsh -s /bin/zsh

echo 'Copying fastfetch config'
cp -rf fastfetch ~/.config


echo 'Copying hyprland.conf'
cp -rf hypr ~/.config


echo 'Copying waybar config'
cp -rf waybar ~/.config


echo 'Installing Oh My Zsh'
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi


echo 'Copying .zshrc'
cp -rf zsh/.zshrc ~/.zshrc


echo 'Installing yay'
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si


echo 'Installing AUR packages, check PKGBUILD'
yay -S --needed zen-browser-bin hyprshot-git


echo 'Installation complete'
