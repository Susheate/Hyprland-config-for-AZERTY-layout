#!/bin/bash


clear="\e[0m"
bold="\e[1m"
green="\e[32m"
cyan="\e[36m"
magenta="\e[35m"


echo -e "${bold}Installing packages and updating system${clear}"
if [ -d /bedrock/strata/arch ] && [ -d /bedrock/strata/artix ]; then
	echo -e "${green}Bedrock Linux${clear} detected, ${cyan}artix${bold}${clear} and ${cyan}arch ${magenta}strata${clear} found"
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman
	sudo strat -r arch pacman -Syu --needed nwg-displays nwg-look

else
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman nwg-look

fi


echo -e "${bold}Changing shell to Zsh${clear}"

chsh -s /bin/zsh


echo -e "${bold}Copying fastfetch config${clear}"

cp -rf fastfetch ~/.config


echo -e "${bold}Copying hyprland.conf${clear}"

cp -rf hypr ~/.config


echo -e "${bold}Copying waybar config${clear}"

cp -rf waybar ~/.config


echo -e "${bold}Checking if Oh My Zsh has already been installed${clear}"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	echo -e "${bold}Installing Oh My Zsh${clear}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

else
	echo -e "${bold}Oh My Zsh is already installed, skipping${clear}"

fi


echo -e "${bold}Copying .zshrc${clear}"

cp -rf zsh/.zshrc ~/.zshrc


echo -e "${bold}Installing yay${clear}"

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --needed


echo -e "${bold}Installing AUR packages, check PKGBUILDs${clear}"

yay -S --needed zen-browser-bin hyprshot-git


echo -e "${bold}Installation complete${clear}"
