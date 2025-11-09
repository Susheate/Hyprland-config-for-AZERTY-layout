#!/bin/bash


clear="\e[0m"
bold="\e[1m"
green="\e[32m"
cyan="\e[36m"
magenta="\e[35m"


echo -e "${bold}Installing packages and updating system${clear}"

if [ -d /bedrock/strata/arch ] && [ -d /bedrock/strata/artix ]; then
	echo -e "${green}Bedrock Linux${clear} detected, ${cyan}artix${clear} and ${cyan}arch ${magenta}strata${clear} found"
	sudo pacman -Syu --needed wine lutris prismlauncher flatpak plasma-desktop ufw qalculate-qt micro btop obs-studio filelight steam ark
	sudo strat -r arch pacman -Syu --needed obsidian code

else
	pacman -Syu --needed lutris prismlauncher wine-mono flatpak plasma-desktop ufw qalculate-qt code micro obsidian btop obs-studio filelight steam ark

fi


echo -e "${bold}Installing Flatpaks${clear}"

flatpak install org.vinegarhq.Sober org.vinegarhq.Vinegar com.heroicgameslauncher.hgl
flatpak override --user --filesystem=xdg-run/app/com.discordapp.Discord:create --filesystem=xdg-run/discord-ipc-0 --device=input org.vinegarhq.Sober


echo -e "${bold}Installation complete${clear}"
