#!/bin/bash

# Define the list of packages to install
PACKAGES=(
    "xf86-video-amdgpu"
    "base-devel"
    "vim"
    "git"
    "wget"
    "github-cli"
    "xorg-server"
    "xorg-xinit"
    "libx11"
    "libxinerama"
    "libxft"
    "webkit2gtk"
    "chromium"
    "numlockx"
    "libnotify"
    "dunst"
    "sxhkd"
    "xwallpaper"
    "xclip"
    "opendoas"
    "starship"
    "zathura-pdf-poppler"
    "btop"
    "unzip"
    "unrar"
    "pavucontrol"
    "nsxiv"
    "mpv"
    "xorg-xev"
    "python3"
    "brightnessctl"
)

# Update package repositories
doas pacman -Sy

# Install each package
for pkg in "${PACKAGES[@]}"; do
    echo "Installing $pkg..."
   # sudo pacman -S --noconfirm --needed "$pkg"
    doas pacman -S "$pkg"
done

echo "Packages installation complete."

PACKFONTS=(
    "ttf-carlito"
    "ttf-roboto"
    "ttf-roboto-mono"
    "ttf-dejavu"
    "ttf-libertinus"
    "noto-fonts"
    "noto-fonts-emoji"
    "ttf-opensans"
    "ttf-droid"
    "ttf-font-awesome"
    "ttf-caladea"
  )
# Install each font  package
for pkg in "${PACKFONTS[@]}"; do
    echo "Installing $pkg..."
   # sudo pacman -S --noconfirm --needed "$pkg"
    doas pacman -S "$pkg"
done

echo "Fonts Packages installation complete."


git clone https://github.com/yahya1007/suckless.git


PACKPRINTER=(
    "cups"
    "hplip
    "system-config-printer"
#sudo usermod -aG lp yahya
#sudo systemctl enable --now cups
)

git clone https://aur.archlinux/yay.git
yay -S betterlockscreen
sudo systemctl enable betterlockscreen@yahya

# file manager
nemo
lxappearance # for GTK app 
qt5ct # for Qt app
# mask dev-tmp
sudo systemctl mask dev-tpmrm0.device
