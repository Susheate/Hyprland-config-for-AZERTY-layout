#!/bin/bash


echo 'Installing packages and updating system'

if [ -d /bedrock/strata/arch ] && [ -d /bedrock/strata/artix ]; then
	echo 'Bedrock Linux detected, artix and arch strata found'
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman
	sudo strat -r arch pacman -Syu --needed nwg-displays

else
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman

fi


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
