#!/bin/bash

dnf install -y git zsh xclip fish tmux tmux-plugin-manager xdg-desktop-portal-gtk flameshot npm go elixir docker docker-compose leafpad pyhton3 python3-pip blueman zsh
dnf install -y gtk-engine-murrine fd ripgrep vim nitrogen noto-fonts nerd-fonts brightnessctl network-manager-applet file-roller fastfetch pavucontrol lxappearance-gtk3
dnf install -y xautolock picom polybar neovim pcmanfm leafpad flatpak feh clang rpi-imager ttf-font-awesome waybar swaylock swayidle i3exit light gnome-boxes rust-analyzer rustup

#zsh setup
curl -L git.io/antigen > ~/antigen.zsh
git clone https://github.com/fraugho/zsh-config.git ~/zsh-config
cp ~/zsh-config/.zshrc ~/
rm -rf ~/zsh-config

#mullvad

# Add the Mullvad repository server to dnf
sudo dnf config-manager --add-repo https://repository.mullvad.net/rpm/stable/mullvad.repo

# Install the package
sudo dnf install mullvad-vpn

#asus laptop
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update -y
sudo dnf install kernel-devel
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda

sudo systemctl enable nvidia-hibernate.service nvidia-suspend.service nvidia-resume.service nvidia-powerd.service

sudo dnf copr enable lukenukem/asus-linux
sudo dnf update -y

sudo dnf install asusctl supergfxctl
sudo dnf update --refresh
sudo systemctl enable supergfxd.service

sudo dnf install asusctl-rog-gui

#tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#i3
git clone https://github.com/fraugho/i3.git .config/i3

#polybar
git clone https://github.com/fraugho/polybar.git .config/polybar

#alacritty
git clone https://github.com/fraugho/alacritty.git .config/alacritty

#neovim
git clone https://github.com/fraugho/nvim.git .config/nvim

#picom
git clone https://github.com/fraugho/picom.git .config/picom

#hyprland
git clone https://github.com/fraugho/hypr.git .config/hypr

#Wallpapers
git clone https://github.com/fraugho/wallpapers.git .config/wallpapers

# Bluetooth
echo "Enabling bluetooth..."
sudo systemctl start bluetooth
sudo systemctl enable bluetooth

# Flathub Setup
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Steam Flatpak
echo "Installing Steam Flatpak..."
flatpak install -y flathub com.valvesoftware.Steam
sudo ln -s /var/lib/flatpak/exports/bin/com.valvesoftware.Steam /usr/bin/steam

# Proton-GE Flatpak
echo "Installing Proton-GE Flatpak"
flatpak install -y com.valvesoftware.Steam.CompatibilityTool.Proton-GE

# Vivaldi Flatpak
echo "Installing Vivaldi Flatpak"
flatpak install -y flathub com.vivaldi.Vivaldi
sudo ln -s /var/lib/flatpak/exports/bin/com.vivaldi.Vivaldi /usr/local/bin/vivaldi

# Jellyfin Flatpak
echo "Installing Jellyfin Flatpak"
flatpak install -y flathub com.github.iwalton3.jellyfin-media-player
sudo ln -s /var/lib/flatpak/exports/bin/com.github.iwalton3.jellyfin-media-player /usr/local/bin/jellyfin

# OBS Flatpak
echo "Installing OBS Flatpak"
flatpak install -y flathub com.obsproject.Studio
sudo flatpak override --device=all com.obsproject.Studio
sudo ln -s /var/lib/flatpak/exports/bin/com.obsproject.Studio /usr/local/bin/obs

# Firefox Flatpak
echo "Installing Firefox Flatpak..."
flatpak install -y flathub org.mozilla.firefox
sudo ln -s /var/lib/flatpak/exports/bin/org.mozilla.firefox /usr/bin/firefox

# Librewolf Flatkpak
echo "Installing Librewolf Flatpak..."
flatpak install -y flathub io.gitlab.librewolf-community
sudo ln -s /var/lib/flatpak/exports/bin/io.gitlab.librewolf-community /usr/bin/librewolf

# OnlyOffice Flatpak
echo "Installing OnlyOffice Flatpak"
flatpak install -y flathub org.onlyoffice.desktopeditors
sudo ln -s /var/lib/flatpak/exports/bin/org.onlyoffice.desktopeditors /usr/bin/only-office

# Tor Browser Flatpak
echo "Installing Tor Browser Flatpak..."
flatpak install -y flathub com.github.micahflee.torbrowser-launcher
sudo ln -s /var/lib/flatpak/exports/bin/com.github.micahflee.torbrowser-launcher /usr/bin/tor-browser

# Logism Flatpak
echo "Installing Logisim Flatpak..."
flatpak install -y flathub com.github.reds.LogisimEvolution
sudo ln -s /var/lib/flatpak/exports/bin/com.github.reds.LogisimEvolution /usr/bin/logisim

# Spotify Flatpak
echo "Installing Spotify Flatpak..."
flatpak install -y flathub com.spotify.Client
sudo ln -s /var/lib/flatpak/exports/bin/com.spotify.Client /usr/bin/spotify

# Nvidia Driver Flatpak
echo "Instlling Nvidia Driver Flatpak..."
flatpak install -y flathub org.freedesktop.Platform.GL.nvidia-535-113-01

# Flatseal Flatpak
echo "Installing Flatseal..."
flatpak install -y flathub com.github.tchx84.Flatseal
sudo ln -s /var/lib/flatpak/exports/bin/com.github.tchx84.Flatseal /usr/bin/flatseal

# Add configuration to alsa-base.conf
echo "Configuring alsa-base.conf..."
echo "options snd-hda-intel model=asus-zenbook" | sudo tee -a /etc/modprobe.d/alsa-base.conf
echo "Configuration for alsa-base.conf complete!"

echo "Configuration complete!"
rm -rf ~/fedora-config
