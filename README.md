# Hyprland-config-for-AZERTY-layout

Work in progress 

A repository I originally made in order to backup and restore my Hyprland config easily, made for AZERTY keyboard users.

It offers :
- Keybindings made for AZERTY
- Zsh config (Oh My Zsh, Starship)
- Fastfetch config
- Waybar config
- Already configured hyprland.conf (Custom keybindings, display resolution...)
- Screenshot utility (hyprshot-git)
- Fix for OBS on Hyprland

This collection of config files can be used as it is or as a base for further configuration.

## Installing/Updating :

If you wish to use the latest version :
```bash
git clone https://github.com/Susheate/Hyprland-config-for-AZERTY-layout.git && cd Hyprland-config-for-AZERTY-layout && sh install.sh
```
# Using this command will replace your current configuration files!
If you want a fully tested version, use the releases.

## Documentation :

### Keybindings :

SUPER + T : Open terminal (kitty by default)

SUPER + Q : Kill active window

SUPER + M : Exit Hyprland

SUPER + E : Open file manager (dolphin by default)

SUPER + W : Toggle floating active window

SUPER + R : Open application selection menu (wofi by default)

SUPER + SHIFT + W : Toggle resizable window

SUPER + J : Toggle split

SUPER + B : Open browser (zen-browser-bin by default)

SUPER + F : Maximize active window

SUPER + X : Resize active window

SHIFT + F11 : Fullscreen active window

SUPER + Arrows : Change focus

SUPER + &-à : Move view to workspace 1-10

SUPER + SHIFT + &-à : Move active window and view to workspace 1-10

SUPER + Alt + &-à : Move active window to workspace 1-10

SUPER + Scroll : Scroll through existing workspaces

SUPER + S : Open scratchpad

SUPER + SHIFT + S : Move window and open scratchpad

SUPER + M1 : Move window

SUPER + M2 : Resize window

SUPER + P : Freeze screen and screenshot selected window

SUPER + SHIFT + P : Screenshot selected window

SUPER + Alt + P : Freeze screen and screenshot selected region

SUPER + SHIFT + Alt + P : Screenshot selected region

PRINT : Screenshot selected display

### Scripts :

install.sh :

install.sh installs a set of packages that you can check by reading the script. It setups Zsh, Oh My Zsh, fastfetch, Hyprland, waybar and the yay AUR helper.

The fastfetch config was based off HyDE's fastfetch config.


extra-packages.sh :

extra-packages.sh installs a set of useful packages, not needed for the configs.
