#!/bin/bash


echo "Installing packages"
yay -S --needed --noconfirm steam wine lutris prismlauncher wine-mono flatpak kdeconnect plasma tlp ufw ly qalculate-qt code micro obsidian btop obs-studio filelight


echo "Enabling services (systemd)"
sudo systemctl enable tlp && sudo systemctl enable ufw


echo "Installing AUR packages, check PKGBUILD"
yay -S --needed librewolf-bin


echo "Installing Flatpaks"
flatpak install org.vinegarhq.Sober org.vinegarhq.Vinegar com.heroicgameslauncher.hgl
flatpak override --user --filesystem=xdg-run/app/com.discordapp.Discord:create --filesystem=xdg-run/discord-ipc-0 --device=input org.vinegarhq.Sober


echo "Installation complete"
