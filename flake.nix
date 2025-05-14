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
    spicetify.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      utils = import ./lib/utils.nix
        { inherit nixpkgs home-manager inputs; };
      inherit (utils) mkHomeManagerConfiguration mkNixosConfiguration;
    in {
      nixosConfigurations = {
        mashine = mkNixosConfiguration "mashine";
      };
      homeConfigurations = {
        deudz = mkHomeManagerConfiguration "x86_64-linux" "mashine";
      };
    };
}
