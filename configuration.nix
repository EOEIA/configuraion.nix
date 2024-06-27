{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
  ];
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  # services.tumbler.enable = true; # Thumbnail support for images

  #   virtualisation.virtualbox.host.enable = true;
  #  users.extraGroups.vboxusers.members = [ "e" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
    extraConfig = ''
      set theme=/boot/grub/themes/bsol/theme.txt
    '';
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver = {
    layout = "us";
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.e = {
    isNormalUser = true;
    description = "e";
    extraGroups = ["networkmanager" "wheel"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system.stateVersion = "23.11";
}
