{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "e";
    homeDirectory = "/home/e";
    stateVersion = "23.11";
  };

catppuccin.flavor = "mocha";

 programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };

  catppuccin.enable = true;
  programs.kitty.catppuccin.enable = true;

# wayland.windowManager.sway = {
#    enable = true;
#  };
 
  imports = [
    ./modules/bash.nix
#    ./modules/hyprland.nix
    ./modules/i3.nix
   ./modules/kitty.nix
    #            ./modules/polybar
   # ./modules/waybar.nix
   ./modules/zsh.nix
 ./modules/dunst.nix
#./modules/sway.nix
./modules/i3status.nix
  ];
}
