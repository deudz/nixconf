{
  description = "home-manager and NixOS configuration for deudz";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      calculator = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./machines/calculator.nix ];
      };
    };

    homeConfigurations = {
      "dan@calculator" = {
        modules = [ ./home/dan/calculator.nix ];
      };
    };
  };
}
