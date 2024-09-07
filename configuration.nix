{
  config,
  pkgs,
  ...
}: {

  virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "e" ];

# Set the default browser via xdg-settings
environment.variables = {
  XDG_DEFAULT_BROWSER = "firefox.desktop";  # Replace with your preferred browser's .desktop file
};



xdg.portal.config.common.default = "*";

services.flatpak.enable = true;
xdg.portal.enable = true;

services.clipmenu.enable = true;
services.tor.enable = true;

networking.firewall.enable = true;
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
##   ./modules/libvirt.nix
    ./nvidia.nix
./vfio.nix
  ];




  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  # services.tumbler.enable = true; # Thumbnail support for images


  nix.settings.experimental-features = ["nix-command" "flakes"];

  
boot.loader.grub = {
    enable = true;
    device = "/dev/nvme0n1";
 };

  boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
 # boot.kernelModules = [ "kvm-amd" "vfio-pci" "vfio" ];
  boot.kernelModules = [ "kvm-amd"];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  networking.hostName = "nixos";


  # Enable networking
  networking.networkmanager.enable = true;

systemd.services.NetworkManager-wait-online.enable = pkgs.lib.mkForce false;


  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";


  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  #services.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver = {
    xkb.layout = "us";
  };

services.gnome.gnome-keyring.enable = true;

  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
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
    extraGroups = ["networkmanager" "wheel" "libvirtd" "dialout"];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };



  services.udev.packages = [ pkgs.udev ];
  services.udev.extraRules = ''
    SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", GROUP="dialout", MODE="0660"
  '';


  system.stateVersion = "23.11";
}
