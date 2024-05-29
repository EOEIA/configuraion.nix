{ config, pkgs, ... }: {
  home = {
    username = "e";
    homeDirectory = "/home/e";
    stateVersion = "23.11";
  };

  imports = [
    ./zsh.nix
    ./i3.nix
    
  ];
}
