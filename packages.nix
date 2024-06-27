{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
go
pavucontrol
alejandra
autokey
winetricks
vlc
xmrig
obs-studio
monero-gui
protonvpn-gui

xfce.thunar
xfce.thunar-volman
libvirt
udisks
# Browsers and Web Tools
firefox
electron
tor-browser-bundle-bin

# Programming and Development Tools
python3
nodejs
git
bash
neovim
vim
vscode
prusa-slicer

# Network and VPN Tools
networkmanager
networkmanagerapplet
protonvpn-gui
openvpn
openresolv
wget

# System and Window Management
kitty
pcmanfm
arandr
rofi
sct
picom
polybar
dunst
numlockx

# Utilities and Tools
usbutils
avrdude
home-manager
unzip
zsh
htop-vim
nitrogen
flameshot
dolphin
obsidian

# Custom Keyboard Firmware
qmk
vial

# wms
hyprland
i3lock-pixeled
i3-resurrect
polkit_gnome

polybar
syncthing
rustup 
cargo

gcc
gnumake
lf

wine
vesktop
(pkgs.discord.override {
  withOpenASAR = true;
  withVencord = true;
})


  ];
}
