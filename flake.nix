{
  description = "Erik's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

 outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
       system = "x86_64-linux";
       unstable = import nixpkgs-unstable { inherit system; };
    in 
    {
    #overlays = import ./nix {inherit inputs;};
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tuuhoo = import ./home.nix;
	    home-manager.extraSpecialArgs = {inherit unstable;};
          }
        ];
      };
    };
  };
}
