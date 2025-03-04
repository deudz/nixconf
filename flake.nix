{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.mashine = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ 
        ./devices/mashine/configuration.nix 
        inputs.home-manager.nixosModules.home-manager {
	  home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bckp";
          home-manager.users.deudz = import ./devices/mashine/home.nix;
        }
      ];
    };
  };
}
