#!/bin/bash


clear="\e[0m"
bold="\e[1m"
green="\e[32m"
cyan="\e[36m"
magenta="\e[35m"


echo -e "${bold}Installing packages and updating system${clear}"
if [ -d /bedrock/strata/arch ] && [ -d /bedrock/strata/artix ]; then
	echo -e "${green}Bedrock Linux${clear} detected, ${cyan}artix${clear} and ${cyan}arch ${magenta}strata${clear} found"
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman hyprpicker nm-connection-editor hyprshot network-manager-applet breeze mako
	sudo strat -r arch pacman -Syu --needed nwg-displays nwg-look archlinux-xdg-menu cliphist

else
	sudo pacman -Syu --needed zsh git base-devel curl fastfetch starship hyprland waybar brightnessctl pavucontrol nwg-displays kitty ttf-firacode-nerd dolphin xdg-desktop-portal-hyprland xdg-desktop-portal playerctl wofi hyprpaper blueman nwg-look archlinux-xdg-menu hyprpicker nm-connection-editor hyprshot network-manager-applet breeze mako cliphist

fi


echo -e "${bold}Configuring Dolphin${clear}"

if [[ ! -d "$HOME/.config/menus/" ]]; then
	mkdir ~/.config/menus/

fi

if [[ -d /etc/xdg/menus/arch-applications.menu ]]; then
	sudo mv /etc/xdg/menus/arch-applications.menu /etc/xdg/menus/applications.menu

fi

cp /etc/xdg/menus/*applications.menu ~/.config/menus

xdg-mime default /usr/share/applications/kitty.desktop terminal


echo -e "${bold}Changing shell to Zsh${clear}"

chsh -s /bin/zsh


echo -e "${bold}Copying fastfetch config${clear}"

cp -rf fastfetch ~/.config


echo -e "${bold}Copying hypr${clear}"

cp -rf hypr ~/.config


echo -e "${bold}Detecting and applying displays configuration${clear}"

monitor=$(xrandr --current | grep 'connected' | cut -d ' ' -f 1)
resolution=$(xrandr --current | grep 'connected' | cut -d ' ' -f 3 | cut -d '+' -f 1)
refresh_rate=$(xrandr --current | grep "  $resolution" | cut -d ' ' -f 8 | tr -d '*+')

echo -e "monitor=$monitor,$resolution@$refresh_rate,0x0,1.0" > ~/.config/hypr/monitors.conf

hyprctl reload


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

yay -S --needed zen-browser-bin


echo -e "${bold}Installation complete${clear}"
