{
  description = "My system configuration";

inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  home-manager = {
    url = "github:nix-community/home-manager/release-24.05";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { nixpkgs, home-manager, ... }: {
  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [ ./configuration.nix ];
  };

  homeConfigurations.e = home-manager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    modules = [ ./home.nix ];
  };
};
}
