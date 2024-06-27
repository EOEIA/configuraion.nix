{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # Change this to your preferred theme
      # plugins = [ "git" "z" "extract" ]; # Add your desired plugins here
    };

    shellAliases = {
      ##### aliases ######
      rebuild = "sudo nixos-rebuild switch --flake .";
      ehm = "sudo nano /home/e/nix/home.nix";
      ei3 = "sudo nano /home/e/.config/i3/config";
      hms = "home-manager switch --flake ./#e";
      enix = "sudo nano configuration.nix";
      e = "sudo nano";
      x = "exit";
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      k = "kitty";
      reload = "source ~/.zshrc";
    };

  };
}
