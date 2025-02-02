# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

### NVIDIA
boot.initrd.kernelModules = [ "nvidia" ];
boot.blacklistedKernelModules = ["nouveau"];
##

hardware.enableRedistributableFirmware = lib.mkDefault true;


  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d29b430d-baf3-49b0-bc57-ab587b023eb9";
    fsType = "ext4";
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/b236cdf6-4c2b-45b0-a4e6-0f31261a56e6";}
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp37s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

# For 32 bit applications
hardware.opengl.extraPackages = with pkgs; [
  amdvlk
];
}
