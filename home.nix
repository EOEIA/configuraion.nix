{ config, pkgs, ... }: {
  home = {
    username = "e";
    homeDirectory = "/home/e";
    stateVersion = "23.11";
  };

  imports = [

            ./modules/bash.nix
            ./modules/hyprland.nix
            ./modules/i3.nix
            ./modules/kitty.nix
#            ./modules/libvirt.nix
#            ./modules/polybar
#           ./modules/polybar.nix
            ./modules/waybar.nix
            ./modules/zsh.nix
  ];
}
