#!/bin/bash


echo 'Installing packages and updating system'

if [ -d /bedrock/strata/arch ] && [ -d /bedrock/strata/artix ]; then
	echo 'Bedrock Linux detected, artix and arch strata found'
	sudo pacman -Syu --needed wine lutris prismlauncher flatpak kdeconnect plasma ufw ly qalculate-qt micro btop obs-studio filelight steam
	sudo strat -r arch pacman -Syu --needed obsidian code wine-mono

else
	pacman -Syu --needed wine lutris prismlauncher wine-mono flatpak kdeconnect plasma ufw ly qalculate-qt code micro obsidian btop obs-studio filelight steam

fi


echo 'Installing Flatpaks'

flatpak install org.vinegarhq.Sober org.vinegarhq.Vinegar com.heroicgameslauncher.hgl
flatpak override --user --filesystem=xdg-run/app/com.discordapp.Discord:create --filesystem=xdg-run/discord-ipc-0 --device=input org.vinegarhq.Sober


echo 'Installation complete'
