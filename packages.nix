{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  };

  environment.systemPackages = with pkgs; [
firefox
 home-manager
nodejs
kitty
git
bash
pcmanfm
 neovim
 vim
arandr
electron
rofi
sct
htop-vim
nitrogen
flameshot
picom
polybar
dunst
numlockx
i3lock-pixeled
  i3-resurrect
 unzip
 zsh
openvpn
wget
openresolv
vscode
openvpn
prusa-slicer
tor-browser-bundle-bin
obsidian
(pkgs.discord.override {
  withOpenASAR = true;
  withVencord = true;
})


  ];
}
