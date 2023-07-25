{
  description = "home-manager and NixOS configuration for deudz";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = { 
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs: {
    nixosConfigurations = {
      calculator = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit attrs; };
        system = "x86_64-linux";
        modules = 
          [ 
            ./machines/calculator.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.dan = import ./home/dan/calculator.nix;
            }
          ];
      };
    };
  };
}
