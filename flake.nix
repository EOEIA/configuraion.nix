{
inputs = {
 nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
#nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
url = "github:nix-community/home-manager/release-24.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };
catppuccin.url = "github:catppuccin/nix";
};


outputs = { nixpkgs, home-manager, catppuccin, ... }: {

  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
 ./configuration.nix
catppuccin.nixosModules.catppuccin
         ];
  };

  homeConfigurations.e = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    modules = [
 ./home.nix
catppuccin.homeManagerModules.catppuccin
 ];
  };
};
}
